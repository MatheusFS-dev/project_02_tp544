# Do treinamento à inferência de geometrias

Este documento explica, em linguagem simples, como o projeto procura uma estrutura que absorva uma porcentagem desejada de luz ao longo de uma faixa de comprimentos de onda. Por exemplo, pode-se pedir uma geometria que absorva aproximadamente 50% da luz entre 600 e 900 nm.

O trabalho tem três momentos: aprender com simulações já recebidas, procurar uma geometria promissora com o modelo treinado e verificar essa geometria em uma nova simulação HFSS.

## 1. Dados e preparação

O projeto recebeu 2.000 espectros produzidos no HFSS para estruturas com substrato de ar. Cada registro contém a geometria simulada e, para cada comprimento de onda, a parcela de luz transmitida, refletida e absorvida. O conjunto mantém os arquivos e identificadores de origem para que os resultados possam ser rastreados.

Alguns registros representam a mesma geometria. Antes de separar os dados, o programa agrupa essas repetições, chegando a 1.926 geometrias distintas. Assim, cópias da mesma estrutura não aparecem em grupos diferentes e não dão uma impressão exagerada da capacidade de previsão do modelo.

As estruturas pertencem a 12 famílias, chamadas F01 a F12. Cada família usa determinadas dimensões geométricas. O programa identifica quais dimensões se aplicam a cada uma e converte seus valores para uma escala adequada ao treinamento. Os espectros completos são preservados: o modelo aprende o comportamento em toda a faixa de comprimentos de onda disponível, não apenas um valor resumido de absorção.

## 2. Treinamento do modelo de previsão

O modelo recebe a família e as dimensões de uma geometria. Sua tarefa é prever o espectro: quanto da luz será transmitido, refletido e absorvido em cada comprimento de onda. Durante o treinamento, ele compara suas previsões com os espectros HFSS recebidos e ajusta seus parâmetros internos para reduzir os erros.

O treinamento dá atenção especial à absorção, inclusive aos pontos do espectro em que a previsão erra mais. Transmissão e reflexão também entram na avaliação. A saída do modelo mantém as três parcelas entre zero e 100% e faz com que, juntas, somem 100%. Isso organiza a previsão, mas não prova que qualquer espectro previsto possa ocorrer fisicamente.

Na etapa de comparação dos métodos, as 1.926 geometrias distintas são divididas em três grupos:

| Grupo | Geometrias | Uso |
| --- | ---: | --- |
| Treinamento | 1.348 | Ensinar o modelo a prever espectros. |
| Validação | 289 | Acompanhar o aprendizado e escolher o melhor modelo. |
| Teste | 289 | Avaliar o modelo escolhido em geometrias reservadas. |

Após cada época de treinamento, o programa mede os erros no grupo de validação. Ele conserva a versão que teve o melhor resultado nesse grupo e pode parar se não houver melhora por tempo suficiente. O grupo de teste só é usado depois da escolha do modelo. Seus resultados mostram a qualidade da previsão de espectros recebidos, não garantem que uma geometria nova cumpra uma meta de absorção.

O treinamento salva o andamento por época. Se for interrompido, pode continuar a partir do estado salvo, desde que os dados e as configurações sejam os mesmos.

## 3. Baseline, Optuna, AutoKeras e Ray

Os quatro casos usam os mesmos dados preparados e procuram resolver a mesma tarefa de previsão. A diferença principal é a forma de escolher a arquitetura da rede, isto é, sua organização interna.

| Caso | O que faz |
| --- | --- |
| **Baseline** | Usa uma arquitetura definida previamente. Serve como referência para comparar as buscas. |
| **Optuna** | Experimenta arquiteturas diferentes. Usa os resultados de validação para orientar novas tentativas e pode encerrar cedo uma tentativa pouco promissora. |
| **AutoKeras** | Constrói e treina modelos com o AutoKeras. A arquitetura escolhida é exportada para o formato usado na busca de geometrias, e as previsões das duas versões são comparadas. |
| **Ray** | Organiza tentativas com Ray Tune e pode interromper cedo candidatas menos promissoras durante a busca. |

As buscas podem variar a largura e a profundidade da rede, o tipo de bloco interno e o uso de *dropout*, uma técnica aplicada durante o treinamento. Cada caso treina e guarda seu próprio modelo. Optuna, AutoKeras e Ray escolhem seus vencedores pelos resultados de validação. O teste não decide qual arquitetura vence.

## 4. Treinamento dos modelos finais

Depois da comparação, o fluxo final aproveita a arquitetura escolhida em cada um dos quatro casos. Ele treina quatro modelos novamente, desde o início, sem repetir as buscas e sem reutilizar os pesos aprendidos nos treinamentos anteriores.

Nesse treinamento final, todas as 1.926 geometrias distintas são usadas em uma nova divisão: 1.541 para treinamento e 385 para validação. Não há um grupo de teste separado nessa etapa. Cada modelo final conserva seus próprios arquivos e seu próprio resultado de validação. As arquiteturas escolhidas por Optuna e Ray são iguais neste projeto, embora os dois casos tenham treinamentos e saídas independentes.

## 5. Inferência: do pedido à geometria

Na inferência, a pessoa escolhe um dos quatro modelos finais e informa o início da faixa de comprimentos de onda, o fim da faixa e a porcentagem de absorção desejada. O objetivo é manter a absorção próxima desse valor **em toda a faixa**, não apenas atingir o valor em um ponto isolado.

O programa examina as 12 famílias. Em cada família, escolhe oito geometrias do conjunto de treinamento cujos espectros já se aproximam do pedido. Elas servem como pontos de partida. Para cada candidata, o modelo prevê o espectro completo. Quando uma extremidade da faixa solicitada cai entre dois comprimentos de onda medidos, o programa estima o valor nessa extremidade por interpolação.

A busca ajusta gradualmente as dimensões das candidatas durante 500 passos. Seu foco principal é reduzir o **maior desvio** entre a absorção prevista e a desejada dentro da faixa. O desvio médio também é considerado. A cada passo, o programa usa a resposta do modelo para decidir como modificar as dimensões. Os pesos do modelo ficam fixos: nessa fase, mudam as geometrias, não o que o modelo aprendeu.

Os ajustes permanecem dentro dos limites observados no treinamento e perto de cada ponto de partida. O programa respeita quais dimensões existem em cada família e mantém válidos os furos dos anéis. Isso restringe a busca a geometrias compatíveis com as regras do projeto, embora não garanta que a previsão seja exata.

Ao terminar, o programa conserva a melhor candidata de cada família. Ele ordena as candidatas pelo menor desvio máximo previsto e usa o desvio médio como segundo critério. Também registra os espectros previstos, as dimensões em nm, os limites usados e a origem dos pontos de partida.

## 6. Resultado e verificação física

O comando de inferência apresenta a família selecionada e suas dimensões em nanômetros. Ele salva essas informações em um arquivo `geometry.json`, que pode ser usado no fluxo de simulação HFSS.

Esse arquivo representa uma **proposta calculada com o modelo de previsão**. Para saber se a estrutura realmente atende ao pedido, é preciso simulá-la no HFSS e comparar a absorção simulada com a meta na mesma faixa. A simulação é a verificação física da geometria sugerida.

## Onde consultar a implementação

- [Preparação dos dados de comparação](../flat/prepare.py) e [treinamento dos modelos](../flat/training.py).
- [Busca de geometrias](../flat/optimize.py) e [definição das famílias](../shared/families.py).
- [Preparação final](../final/prepare.py), [treinamento final](../final/train_all.py), [inferência](../final/workflow.py) e [simulação HFSS](../final/hfss.py).
- [Comandos para executar os fluxos](RUN.md).
