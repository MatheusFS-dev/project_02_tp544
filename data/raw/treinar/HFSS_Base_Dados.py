# -*- coding: utf-8 -*-
r"""
HFSS_Base_Dados.py - simula no HFSS as geometrias sorteadas (geometrias_sorteadas.csv) e grava um espectro por geometria.
Mesma montagem dos testes (Au Johnson & Christy, h = 30 nm, P = 320 nm, portas Floquet, 450-1600 nm, 0 graus, ar).

Pode parar e continuar quando quiser: geometrias ja simuladas sao saltadas.
Uso (PowerShell, na pasta 02_Simulacoes_HFSS\BaseDados, onde estao este script e geometrias_sorteadas.csv):
  ..\..\venv\Scripts\python.exe HFSS_Base_Dados.py                -> todas (2000, ~3,5 dias)
  ..\..\venv\Scripts\python.exe HFSS_Base_Dados.py 1 300          -> so da 1.a a 300.a linha (uma noite ~12 h)
  ..\..\venv\Scripts\python.exe HFSS_Base_Dados.py 301 600        -> proximo bloco (ou noutro computador ao mesmo tempo)
  ..\..\venv\Scripts\python.exe HFSS_Base_Dados.py 1 3 ..\..\06_Comparacao\algoritmos\validar_AG_ambos_l900.csv
                                                                  -> simula as 3 geometrias propostas pelo AG (validacao)
Saidas:
  03_Resultados\Espectros_TRA\G0001.csv ...   (lambda_nm,T,R,A)
  04_Base_Dados\simuladas.csv                 (id, familia, minutos, diferenca entre modos)
  04_Base_Dados\falhas.csv                    (geometrias que deram erro; o script continua)
"""
import os, sys, math, cmath, time, csv, shutil, traceback

VERSAO_AEDT = os.environ.get("AEDT_VERSION", "2025.2")
N_PONTOS, MAX_PASSES, DELTA_S = 401, 15, 0.01
MODOS_AR, MODOS_VIDRO = 4, 10
CASO = "A"
P, H_AU, H_SUB, H_AR = 0.320, 0.030, 1.000, 1.000          # um
REINICIAR_A_CADA = 50                                        # reabre o AEDT a cada 50 geometrias (evita acumular memoria)

AQUI = os.path.dirname(os.path.abspath(__file__))
RAIZ = os.path.dirname(os.path.dirname(AQUI))                # ...\Projeto_Metasuperficies
PASTA_ESP = os.path.join(RAIZ, "03_Resultados", "Espectros_TRA")
PASTA_BD = os.path.join(RAIZ, "04_Base_Dados")
PASTA_TMP = os.path.join(AQUI, "projetos_temporarios")
for p in (PASTA_ESP, PASTA_BD, PASTA_TMP):
    os.makedirs(p, exist_ok=True)
C0, EPS0 = 299792458.0, 8.8541878128e-12


def log(msg):
    print(msg)
    with open(os.path.join(AQUI, "log_base_dados.txt"), "a", encoding="utf-8") as f:
        f.write(time.strftime("%Y-%m-%d %H:%M:%S ") + msg + "\n")


def eps_au(lam_nm):
    e = 1.54 - 1.0 / (143.0**2 * (1.0 / lam_nm**2 + 1j / (14500.0 * lam_nm)))
    for A_, l_, g_ in ((1.27, 470.0, 1900.0), (1.10, 325.0, 1060.0)):
        ph = cmath.exp(-1j * math.pi / 4)
        e += A_ / l_ * (ph / (1 / l_ - 1 / lam_nm - 1j / g_) + ph.conjugate() / (1 / l_ + 1 / lam_nm + 1j / g_))
    return e


try:
    from ansys.aedt.core import Hfss
except ImportError:
    from pyaedt import Hfss


def face_em(obj, eixo, valor, tol=1e-4):
    k = "xyz".index(eixo)
    for f in obj.faces:
        c = f.center
        if abs(c[k] - valor) < tol and abs(f.normal[k]) > 0.99:
            return f.id
    raise RuntimeError("face %s = %.3f nao encontrada em %s" % (eixo, valor, obj.name))


def fronteiras_e_portas(hfss, ar, sub, z_top, z_bot):
    for obj in [o for o in (ar, sub) if o is not None]:
        for eixo in "xy":
            hfss.assign_lattice_pair([face_em(obj, eixo, -P / 2), face_em(obj, eixo, +P / 2)],
                                     False, "UseScanAngle", "0deg", "theta_inc")
    portas = []
    nmb = MODOS_VIDRO if CASO == "B" else MODOS_AR
    for nome, obj, z, nm in (("FloquetCima", ar, z_top, MODOS_AR),
                             ("FloquetBaixo", sub if CASO == "B" else ar, z_bot, nmb)):
        fz = face_em(obj, "z", z)
        portas.append(hfss.create_floquet_port(fz, [-P / 2, -P / 2, z], [P / 2, -P / 2, z], [-P / 2, P / 2, z], nm, nome))
    return portas


def setup_e_varredura(hfss):
    mod = hfss.odesign.GetModule("AnalysisSetup")
    mod.InsertSetup("HfssDriven", ["NAME:Setup1", "SolveType:=", "Single", "Frequency:=", "666.2THz",
        "MaxDeltaS:=", DELTA_S, "MaximumPasses:=", MAX_PASSES, "MinimumPasses:=", 1,
        "MinimumConvergedPasses:=", 1, "PercentRefinement:=", 30, "IsEnabled:=", True,
        "BasisOrder:=", 1, "DoLambdaRefine:=", True, "DoMaterialLambda:=", True, "SetLambdaTarget:=", False,
        "Target:=", 0.3333, "UseMaxTetIncrease:=", False, "PortAccuracy:=", 2, "UseABCOnPort:=", False,
        "SetPortMinMaxTri:=", False, "UseDomains:=", False, "UseIterativeSolver:=", False,
        "SaveRadFieldsOnly:=", False, "SaveAnyFields:=", True])
    mod.InsertFrequencySweep("Setup1", ["NAME:Varredura", "IsEnabled:=", True, "RangeType:=", "LinearCount",
        "RangeStart:=", "187.4THz", "RangeEnd:=", "666.2THz", "RangeCount:=", N_PONTOS,
        "Type:=", "Interpolating", "SaveFields:=", False, "SaveRadFields:=", False,
        "InterpTolerance:=", 0.5, "InterpMaxSolns:=", 250, "InterpMinSolns:=", 0, "InterpMinSubranges:=", 1,
        "ExtrapToDC:=", False, "InterpUseS:=", True, "InterpUsePortImped:=", True, "InterpUsePropConst:=", True,
        "UseDerivativeConvergence:=", False, "InterpDerivTolerance:=", 0.2, "UseFullBasis:=", True,
        "EnforcePassivity:=", True, "PassivityErrorTolerance:=", 0.0001])
    hfss.save_project()


def para_thz(x):
    x = [float(v) for v in x]
    m = max(x)
    if m > 1e12: return [v * 1e-12 for v in x]
    if m > 1e3:  return [v * 1e-3 for v in x]
    return x


def magnitude(d, ex):
    if hasattr(d, "get_expression_data"):
        r = d.get_expression_data(ex, formula="magnitude")
        if isinstance(r, tuple) and len(r) == 2:
            return list(r[0]), [float(v) for v in r[1]]
        return list(d.primary_sweep_values), [float(v) for v in r]
    return list(d.primary_sweep_values), [float(v) for v in d.data_magnitude(ex)]


def espectro(hfss, pc, pb, modo, nmc, nmb):
    expr_r = ["S(%s:%d,%s:%d)" % (pc, m, pc, modo) for m in range(1, nmc + 1)]
    expr_t = ["S(%s:%d,%s:%d)" % (pb, m, pc, modo) for m in range(1, nmb + 1)]
    d = None
    for tentativa in range(3):
        try:
            _ = hfss.setup_names
            d = hfss.post.get_solution_data(expressions=expr_r + expr_t, setup_sweep_name="Setup1 : Varredura",
                                            report_category="Modal Solution Data")
            if d:
                break
        except Exception as e:
            log("     leitura dos parametros S falhou (tentativa %d): %s" % (tentativa + 1, e))
        time.sleep(3)
        hfss.save_project()
    if not d:
        raise RuntimeError("nao consegui ler os parametros S de Setup1 : Varredura")
    fr, out = None, {}
    for lista, nome in ((expr_r, "R"), (expr_t, "T")):
        soma = None
        for ex in lista:
            x, mg = magnitude(d, ex)
            if fr is None:
                fr = para_thz(x)
            soma = [b * b for b in mg] if soma is None else [a + b * b for a, b in zip(soma, mg)]
        out[nome] = soma
    lam = [C0 / (f * 1e12) * 1e9 for f in fr]
    return lam, out["T"], out["R"]


# ------------------------------- analise do espectro -------------------------------


# ------------------------------- construir a geometria a partir de uma linha do sorteio -------------------------------
def num(v):
    return float(v) / 1000.0 if v not in ("", None) else None      # nm -> um


def anel_quadrado(m, Lout, w):
    a = m.create_box([-Lout / 2, -Lout / 2, 0], [Lout, Lout, H_AU], "Au_anelq", "Au_JC")
    li = Lout - 2 * w
    b = m.create_box([-li / 2, -li / 2, 0], [li, li, H_AU], "Au_anelq_furo", "Au_JC")
    m.subtract(a, b, keep_originals=False)
    return a


def anel_circular(m, Rout, w):
    a = m.create_cylinder("Z", [0, 0, 0], Rout, H_AU, 0, "Au_anelc", "Au_JC")
    b = m.create_cylinder("Z", [0, 0, 0], Rout - w, H_AU, 0, "Au_anelc_furo", "Au_JC")
    m.subtract(a, b, keep_originals=False)
    return a


def trilhas(m, r_int, r_ext, wt):
    comp = r_ext - r_int
    lst = [([r_int, -wt / 2, 0], [comp, wt, H_AU]), ([-r_ext, -wt / 2, 0], [comp, wt, H_AU]),
           ([-wt / 2, r_int, 0], [wt, comp, H_AU]), ([-wt / 2, -r_ext, 0], [wt, comp, H_AU])]
    return [m.create_box(o, s, "Au_trilha%d" % k, "Au_JC") for k, (o, s) in enumerate(lst)]


def construir(hfss, g):
    m = hfss.modeler
    Lq, wq, Rc, wc, Rd, Ls, wt = [num(g[k]) for k in ("Lout_q", "w_q", "Rout_c", "w_c", "R_d", "L_s", "w_t")]
    pecas = []
    if Lq: pecas.append(anel_quadrado(m, Lq, wq))
    if Rc: pecas.append(anel_circular(m, Rc, wc))
    if Rd: pecas.append(m.create_cylinder("Z", [0, 0, 0], Rd, H_AU, 0, "Au_disco", "Au_JC"))
    if Ls: pecas.append(m.create_box([-Ls / 2, -Ls / 2, 0], [Ls, Ls, H_AU], "Au_quadrado", "Au_JC"))
    if str(g["trilhas"]) == "1":
        r_ext = Lq / 2 - wq / 2 if Lq else Rc - wc / 2               # meio do anel exterior
        if Lq and Rc: r_int = max(0.0, (Rc - wc) - 0.010)             # entra 10 nm no anel circular (como na imagem)
        elif Rd:      r_int = max(0.0, Rd - 0.010)                    # entra 10 nm no disco
        else:         r_int = max(0.0, Ls / 2 - 0.010)                # entra 10 nm no quadrado
        if abs(r_int - wt / 2) < 0.0005:                              # as 4 trilhas so se tocariam num canto
            r_int += 0.001                                            # (o HFSS nao une) -> afasta 1 nm
        pecas += trilhas(m, r_int, r_ext, wt)
    if len(pecas) > 1:
        m.unite(pecas)
    ouro = pecas[0]
    ouro.material_name = "Au_JC"
    ouro.solve_inside = True
    z_top = H_AU + H_AR
    ar = m.create_box([-P / 2, -P / 2, -H_AR], [P, P, z_top + H_AR], "Air_Domain", "vacuum")
    m.subtract(ar, [ouro], keep_originals=True)
    hfss["theta_inc"] = "0deg"
    return ar, None, z_top, -H_AR


def materiais(hfss):
    hfss.modeler.model_units = "um"
    f = [150e12 + i * 10e12 for i in range(56)]
    e = [eps_au(C0 / fi * 1e9) for fi in f]
    for nome, y in (("eps_Au", [x.real for x in e]),
                    ("sig_Au", [2 * math.pi * fi * EPS0 * x.imag for fi, x in zip(f, e)])):
        try:
            hfss.create_dataset(nome, f, y, is_project_dataset=True)
        except Exception:
            pass
    if "au_jc" not in [k.lower() for k in hfss.materials.material_keys]:
        au = hfss.materials.add_material("Au_JC")
        au.permittivity = "pwl($eps_Au, Freq)"
        au.conductivity = "pwl($sig_Au, Freq)"


# ------------------------------- AEDT: um projeto temporario por geometria -------------------------------
_estado = {"novo": True, "contador": 0}


def abrir(gid):
    proj = os.path.join(PASTA_TMP, gid + ".aedt")
    novo = _estado["novo"]; _estado["novo"] = False
    return Hfss(project=proj, design=gid, solution_type="Modal", version=VERSAO_AEDT,
                non_graphical=True, new_desktop=novo)


def fechar(hfss, gid):
    try:
        hfss.close_project(name=hfss.project_name, save=False)
    except Exception:
        pass
    for x in (gid + ".aedt", gid + ".aedtresults", gid + ".aedt.lock"):
        p = os.path.join(PASTA_TMP, x)
        try:
            shutil.rmtree(p) if os.path.isdir(p) else (os.path.exists(p) and os.remove(p))
        except Exception:
            pass
    _estado["contador"] += 1
    if _estado["contador"] % REINICIAR_A_CADA == 0:
        try:
            hfss.release_desktop(close_projects=True, close_desktop=True)
        except Exception:
            pass
        _estado["novo"] = True
        log("     (AEDT reiniciado para libertar memoria)")


def simular(g):
    gid = g["id"]
    hfss = abrir(gid)
    try:
        materiais(hfss)
        ar, sub, z_top, z_bot = construir(hfss, g)
        portas = fronteiras_e_portas(hfss, ar, sub, z_top, z_bot)
        setup_e_varredura(hfss)
        if not hfss.analyze_setup("Setup1"):
            raise RuntimeError("analyze_setup devolveu falso")
        pc, pb = portas[0].name, portas[1].name
        lam, T1, R1 = espectro(hfss, pc, pb, 1, MODOS_AR, MODOS_AR)
        _, T2, R2 = espectro(hfss, pc, pb, 2, MODOS_AR, MODOS_AR)
        dif = max(abs(a - b) for a, b in zip(T1, T2))
        T = [(a + b) / 2 for a, b in zip(T1, T2)]
        R = [(a + b) / 2 for a, b in zip(R1, R2)]
        tmp = os.path.join(PASTA_ESP, gid + ".tmp")
        with open(tmp, "w") as f:
            f.write("lambda_nm,T,R,A\n")
            for row in sorted(zip(lam, T, R, [1 - r - t for r, t in zip(R, T)])):
                f.write("%.3f,%.6f,%.6f,%.6f\n" % row)
        os.replace(tmp, os.path.join(PASTA_ESP, gid + ".csv"))   # so aparece o .csv quando esta completo
        return dif
    finally:
        fechar(hfss, gid)


# =================================== principal ===================================
ARQ_LISTA = sys.argv[3] if len(sys.argv) > 3 else os.path.join(AQUI, "geometrias_sorteadas.csv")   # 3.o argumento: outra lista (ex.: validar_AG_....csv)
lista = list(csv.DictReader(open(ARQ_LISTA, encoding="utf-8")))
de = int(sys.argv[1]) if len(sys.argv) > 1 else 1
ate = int(sys.argv[2]) if len(sys.argv) > 2 else len(lista)
bloco = lista[de - 1:ate]
falta = [g for g in bloco if not os.path.exists(os.path.join(PASTA_ESP, g["id"] + ".csv"))]
log("=========== Base de dados: linhas %d-%d (%d geometrias, %d ja feitas, faltam %d) ==========="
    % (de, ate, len(bloco), len(bloco) - len(falta), len(falta)))
t_ini, feitas = time.time(), 0
for k, g in enumerate(falta, 1):
    t0 = time.time()
    try:
        dif = simular(g)
        mins = (time.time() - t0) / 60
        feitas += 1
        novo = not os.path.exists(os.path.join(PASTA_BD, "simuladas.csv"))
        with open(os.path.join(PASTA_BD, "simuladas.csv"), "a", newline="") as f:
            w = csv.writer(f)
            if novo: w.writerow(["id", "familia", "minutos", "dif_modos_T", "data"])
            w.writerow([g["id"], g["familia"], "%.2f" % mins, "%.3f" % dif, time.strftime("%Y-%m-%d %H:%M")])
        media = (time.time() - t_ini) / 60 / k
        log("%4d/%d  %s %s (%s): %.1f min | dif modos %.3f | faltam ~%.1f h"
            % (k, len(falta), g["id"], g["familia"], g["descricao"], mins, dif, media * (len(falta) - k) / 60))
    except Exception:
        log("%4d/%d  %s %s: ERRO (continua com a proxima)" % (k, len(falta), g["id"], g["familia"]))
        log(traceback.format_exc().splitlines()[-1])
        with open(os.path.join(PASTA_BD, "falhas.csv"), "a", newline="") as f:
            csv.writer(f).writerow([g["id"], g["familia"], time.strftime("%Y-%m-%d %H:%M"),
                                    traceback.format_exc().splitlines()[-1]])
        _estado["novo"] = True                       # depois de um erro, abre um AEDT novo
log("=========== FIM do bloco: %d simuladas agora. Corra analisar_espectros.py ===========" % feitas)
