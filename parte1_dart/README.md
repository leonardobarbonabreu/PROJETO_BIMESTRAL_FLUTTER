## Domínio

O tema escolhido é **filmes**: um catálogo de longas-metragens avaliados. `LongaMetragem` representa um filme individual; `HistoricoAvaliacao` agrupa vários filmes e calcula a média das avaliações.

`HistoricoAvaliacao` **tem uma** lista de `LongaMetragem` (composição), e não herda dela: um histórico de avaliações não é um tipo especializado de filme, é uma coleção de filmes com comportamento próprio (adicionar, listar, calcular média). A frase "todo histórico é um filme" não faz sentido — por isso a relação é "tem um", não "é um".

## Tabela de rastreio — Parte 1

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | `bin/models/LongaMetragem.dart:12` | Bloco `[1]` do relatório |
| 2 | Herança | `bin/models/Animacao.dart:23` | Bloco `[2]` do relatório |
| 3 | Composição | `bin/models/HistoricoAvaliacao.dart:13` | Bloco `[3]` do relatório |
| 4 | Encapsulamento | `bin/models/HistoricoAvaliacao.dart:5` | Bloco `[4]` do relatório |
