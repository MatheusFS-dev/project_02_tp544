# Execução do plano da apresentação

Data: 2026-11-13T10:35:18-03:00

Plano: `docs/plans/2026-11-13-apresentacao-treinamento.md`.

## Escopo e decisões

Apresentação em inglês, baseada no template FluiDRA. Dados e modelos existentes são preservados. Nenhum commit, branch ou publicação foi solicitado.

- Execução no checkout atual, limitada aos novos arquivos da apresentação e validação. As instruções do projeto proíbem criar branches sem autorização.
- O experimento usa três topologias e três sementes (42, 43 e 44), em cinco tamanhos, totalizando 45 treinos. Optuna/Ray representam uma única topologia no sweep.
- Subconjuntos aninhados têm exatamente 135, 337, 674, 1011 e 1348 geometrias. A ordenação intercala posições relativas de cada família e embaralha cada família por semente. Validação e teste permanecem fixos com 289 geometrias cada.
- Cada subconjunto é preparado explicitamente pelo runner, preserva IDs de origem e registra índices originais e hash do dataset. O treinador existente fornece recuperação atômica de épocas, otimizador e RNG.
- Espectros reservados: baseline, ordenação estável pelo erro máximo de absorção, posições de quantil mais próximas de 0%, 50% e 95%. A seleção fica em `validation/presentation/held_out_selection.json`.
- Curvas de busca representam a melhor perda registrada entre candidatos concluídos em ordem de ID, não tempo de execução. Candidatos Optuna podados não atualizam a curva.
- O texto anterior `docs/treinamento_ate_inferencia.md` é um arquivo preexistente e foi preservado.

## Verificação inicial

O teste de amostragem falhou antes da implementação porque o módulo ainda não existia. Após a implementação, passou. `pytest -q` passou com 22 testes. O teste específico de subconjuntos passou com 1 teste.

Os gráficos held-out e HFSS foram renderizados e inspecionados. T/R/A são exibidos em porcentagem, erro em pontos percentuais. A faixa de tolerância aplica-se à absorção na banda solicitada.

## Estado

Sweep concluído: 45/45 treinos, em 49min35s, com checkpoints em `runs/presentation/learning_curve/`. A curva final usa todos os resultados. O bloqueio de resultados incompletos foi verificado antes do término.

## Revisão independente

A revisão confirmou o isolamento das partições e encontrou uma fragilidade no resumo da retomada: ao reiniciar, os resultados agregados poderiam ser substituídos temporariamente apenas pelos treinos revisitados. O runner agora carrega e valida o resumo existente, preserva os demais registros e substitui cada combinação de caso, semente e fração sem duplicar. Teste de regressão falhou antes da correção e passou depois (2 testes específicos).

Na apresentação preliminar, a revisão encontrou cortes visuais, tabelas de backup ausentes e trilhas desenhadas em diagonal. As trilhas do construtor recebido são horizontais e verticais. Essas correções foram encaminhadas antes da verificação final. A primeira compilação não foi considerada entrega concluída.

## Conferências de conteúdo

- Os registros da busca mostram 54 candidatos Optuna completos e 46 podados, 100 candidatos Ray e 57 candidatos AutoKeras completos. Os slides usam as contagens registradas, sem inferir que um orçamento configurado foi inteiramente executado.
- As 12 famílias usam representantes reais do treino, selecionados pela proximidade à mediana dos parâmetros ativos. IDs e dimensões ficam em `validation/presentation/family_representatives.json`.
- Os cinco vencedores e a comparação do exemplo 3 usam células de 320 nm na mesma escala. Raios, lados e larguras foram conferidos contra os JSONs e o construtor recebido. A conversão da sobreposição das trilhas é 0,010 micrômetro = 10 nm.
- As notas dos 14 slides principais somam 580 segundos (9min40s). Esse valor é um roteiro de fala, não uma duração medida de apresentação.
- A sílica permanece como trabalho pendente em texto. Não se desenha extrapolação quantitativa para outro substrato.

## Resultado final

Apresentação compilada com 14 slides principais e nenhum slide de backup (14 páginas). As notas de fala estão em português. O PDF final foi renderizado para conferir legibilidade e a compilação não apresenta caixas excedentes nem comandos indefinidos.

No sweep, o erro cai fortemente até 674–1.011 geometrias. A etapa de 1.011 para 1.348 não melhora todos os modelos, portanto não se afirma ganho monotônico nem extrapolação para sílica. São novos treinos de topologias fixas, não os checkpoints retidos da comparação.

| Topologia | MAE em 135 geometrias (pp) | MAE em 1.348 geometrias (pp) |
|---|---:|---:|
| baseline | 5.255 ± 0.090 | 2.044 ± 0.128 |
| optuna | 5.136 ± 0.097 | 1.740 ± 0.147 |
| autokeras | 5.326 ± 0.183 | 1.612 ± 0.046 |

Valores são média ± desvio amostral entre três sementes. Optuna representa a topologia comum a Optuna e Ray. Todas as avaliações usam as mesmas 289 geometrias de teste.

Verificação final: 22 testes ativos e 2 testes específicos passaram. Os 15 subconjuntos preservam validação, teste e IDs originais. As 45 combinações são únicas. Foram gerados os 20 pares de espectros HFSS com zoom, e os hashes das fontes dos gráficos foram conferidos.

## Correção pós-revisão da apresentação

Data: 2026-11-13

A conferência da versão compilada encontrou e corrigiu estes problemas:

- O preâmbulo não seguia o template: faltavam cabeçalho com seção, rodapé com número do slide e o mecanismo de símbolos. O preâmbulo do template foi restaurado e os slides passaram a ter seções.
- Figuras ilegíveis no tamanho do slide: gráficos de treino, busca, erro por família, erro HFSS e curva de tamanho foram refeitos com fonte e proporção adequadas. O gráfico de barras do teste saiu do slide porque duplicava a tabela.
- Diagrama de inferência com texto sobreposto à caixa final: refeito. Diagrama de partições ampliado.
- Slide de geometrias com texto minúsculo: as dimensões saíram da figura e foram para um novo slide de backup com tabela e legenda dos símbolos.
- O auxiliar `\fig` trocava figura ausente por um quadro "Pending". Agora uma figura ausente interrompe a compilação.
- Texto que sugeria consistência física garantida pelo softmax foi reescrito. A faixa de MAE passou de "1.4 a 1.9" para "1.45 a 1.95 pp".
- Rótulos de eixo cortados em dois gráficos.

Verificações: números dos slides conferidos contra `spectrum_metrics.json`, `geometry.json` e `learning_curve.json`. Desenhos de geometria conferidos contra `HFSS_Base_Dados.py` (raio externo e entrada de 10 nm das trilhas, F12 sem quadrado). Compilação sem erros, caixas excedentes ou referências indefinidas. `pytest -q`: 22 passaram.

Pendência não resolvida: `validation/presentation/data/` tem 81 MB de subconjuntos do sweep e `runs/presentation/` tem 664 MB. Este último já é ignorado pelo git. Decida se os subconjuntos devem ser rastreados.

## Segunda correção

Data: 2026-11-13

- Slide de título removido a pedido. Os slides principais caem de 15 para 14 e o roteiro de fala de 590 s para 580 s.
- Defeito de sobreposição: nos slides "Four independent comparison cases" e "Error on 289 held-out geometries" o fundo azul do título cobria a tabela, porque o grupo de fonte abria logo após `\begin{frame}`. Corrigido com um espaço vertical antes do grupo.
- Revisão página a página das 19 páginas: sem outras sobreposições, cortes ou caixas excedentes. O rótulo de seção do cabeçalho tem fonte pequena e descendentes cortados, comportamento herdado do template.

## Terceira correção

Data: 2026-11-13

- Slides de backup removidos a pedido. A apresentação tem 14 páginas. A legenda do slide de geometrias, que remetia ao backup, foi trocada por uma nota sobre o `geometry.json`. As tabelas HFSS completas e o MAE por família continuam disponíveis em `validation/final/SUMMARY.md` e `validation/flat/<caso>/spectrum_metrics.json`.
