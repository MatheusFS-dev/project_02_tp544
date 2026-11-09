# Plano para incluir as 12 famílias no modelo

Data: 09/11/2026 às 07:59:29 -03.

**Situação:** planejamento concluído. Nenhuma alteração no modelo ou novo treinamento nesta etapa.

## O que são as outras 1.600 amostras

Cada família abaixo contém 200 amostras recebidas:

| Família | Componentes | Parâmetros ativos |
| --- | --- | --- |
| F05 | Anel quadrado + anel circular | Lout_q, w_q, Rout_c, w_c |
| F06 | F05 + trilhas | Lout_q, w_q, Rout_c, w_c, w_t |
| F07 | Anel quadrado + disco | Lout_q, w_q, R_d |
| F08 | F07 + trilhas | Lout_q, w_q, R_d, w_t |
| F09 | Anel quadrado + quadrado | Lout_q, w_q, L_s |
| F10 | F09 + trilhas | Lout_q, w_q, L_s, w_t |
| F11 | Anel circular + disco | Rout_c, w_c, R_d |
| F12 | F11 + trilhas | Rout_c, w_c, R_d, w_t |

Em nanômetros: `Lout_q` é o lado externo do anel quadrado, `Rout_c` seu equivalente
circular em raio, `w_q`/`w_c` as espessuras dos anéis, `R_d` o raio do disco,
`L_s` o lado do quadrado e `w_t` a largura das trilhas. O script HFSS define
quatro trilhas e calcula seus comprimentos a partir das demais dimensões.

## Representação proposta

Manter as entradas banda inicial, banda final e absorção desejada, além do tronco
residual. Ampliar a classificação de quatro para **12 famílias** e substituir
as duas dimensões atuais pelos **sete parâmetros acima**, normalizados, com
máscara por família. A presença de trilhas decorre da família, sem classificação
adicional. Manter a saída de substrato, registrando que este dataset só contém ar.

Essa saída compartilhada é menor que manter um regressor separado por família.
Adicionar somente classes seria insuficiente para reconstruir as formas compostas.

## Sequência de implementação

1. **Dados:** ampliar `treinar.py`, `preparation.py` e `prepare_treinar.py` para
   F01–F12. Criar NPZ v2 com sete parâmetros, máscara, IDs e unidades explícitas.
   Preservar raios e lados originais. Deduplicar somente espectros idênticos:
   o catálogo completo tem **1.926 desenhos únicos**, com 74 repetições.
2. **Modelo:** adaptar `core.py` para 12 classes e decodificação condicionada
   à família. Restringir dimensões, espessuras e trilhas conforme o catálogo e
   o construtor HFSS, sem inventar separações mínimas entre componentes.
3. **Treino:** atualizar `training.py` e `autokeras_adapter.py` com Huber
   mascarada, dividida pelo número de parâmetros ativos por amostra. Adaptar
   inferência, métricas por família/parâmetro e exportação Keras/PyTorch.
4. **Persistência e avaliação:** versionar esquema e checkpoints em
   `storage.py`/`training.py`, usar novas pastas e rejeitar retomadas
   incompatíveis. Atualizar `search.py` e `physical_evaluation.py` para comparar
   todos os parâmetros ativos e o substrato. Formas novas continuam exigindo HFSS.
5. **Verificação:** testar as 12 famílias, reconstrução geométrica, máscaras,
   limites, perdas, equivalência Keras/PyTorch e retomada. Rodar a suíte e os
   quatro casos na RTX 4070 física 1, com três épocas e dois candidatos por
   busca. Atualizar TOMLs, README e relatório, sem treinamento completo.

**Aceite:** nenhuma família excluída por falta de representação e fluxo completo
funcionando. Manter a seleção pelo menor desvio da absorção e auditar a cobertura
dos rótulos: disponibilizar todas as famílias no catálogo não garante que todas
sejam escolhidas para treino. Não forçar rótulos para equilibrar classes.
Novos pedidos no mesmo catálogo não demonstram generalização a geometrias inéditas.

**Base consultada:** CSV original, função `construir` de
`data/raw/treinar/HFSS_Base_Dados.py` e módulos atuais de preparação, modelo,
treinamento, AutoKeras, persistência e avaliação física.
