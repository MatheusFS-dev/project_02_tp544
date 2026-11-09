# Validação curta do dataset Treinar

Data: 09/11/2026 às 07:14:14 -03.

Foram importados os 2.006 arquivos originais, incluindo 2.000 espectros e os
projetos HFSS, em `data/raw/treinar/`, com conferência SHA-256. Os espectros
compartilham 401 comprimentos de onda entre 450,004 e 1.599,746 nm. Não foram
encontrados valores inválidos de T/R/A. O maior erro em T+R+A foi aproximadamente
0,000001.

Conforme autorizado, o teste usa F01–F04: 400 amostras, 327 geometrias únicas e
73 repetições com espectros idênticos. As outras 1.600 amostras foram preservadas,
mas não entram neste modelo. O conversor transforma raios em diâmetros e calcula
as dimensões internas dos anéis. O substrato é ar, conforme o script recebido.
O modelo residual existente de três saídas foi reutilizado.

Foram preparados 240 pedidos de banda/absorção para teste, com respostas
selecionadas exclusivamente dos espectros recebidos: 168 treino, 36 validação e
36 teste. Os pedidos são objetivos gerados para validar o fluxo, não novas
simulações. Arquivos e rastreabilidade estão em `data/processed/treinar/`.

Baseline, Optuna, AutoKeras e Ray concluíram na **RTX 4070 física 1**, com três
épocas e dois candidatos por busca. A seleção explícita da GPU foi corrigida.
Checkpoints e inferência foram verificados nos quatro casos.

| Caso | Acurácia de geometria no teste | MAE dimensional (nm) |
| --- | ---: | ---: |
| Baseline | 80.6% | 39.45 |
| Optuna | 75.0% | 39.59 |
| AutoKeras | 75.0% | 54.49 |
| Ray Tune | 75.0% | 32.70 |

Esses números validam a execução curta. Não demonstram desempenho final ou
generalização a geometrias desconhecidas. Há somente um substrato e os pedidos
compartilham o mesmo catálogo. Nenhuma das 36 previsões de cada caso coincidiu
exatamente com uma geometria simulada, portanto sua absorção física permanece
sem verificação e exige novas simulações HFSS.

**Verificação:** 53 testes passaram, compilação Python e `git diff --check`
sem erros. Configurações permanecem limitadas ao teste curto. Resultados,
checkpoints e avaliações físicas estão em `runs/treinar_smoke/`. Nenhum
treinamento completo foi executado.
