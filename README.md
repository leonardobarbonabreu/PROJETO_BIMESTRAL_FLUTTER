# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

## Integrantes

| Nome | RA |
|---|---|
| Leonardo José Barbon de Abreu | 29267-2025 |

Trabalho individual.

## O domínio

O aplicativo é um **histórico dos filmes que já assisti**: cada `LongaMetragem` é um filme
avaliado (nome, diretor, duração, nota, gêneros e data em que foi avaliado), e o
`HistoricoAvaliacao` é a coleção que **contém** esses filmes e calcula a média das notas.
`Animacao` é um tipo especializado de filme, que acrescenta a técnica de animação e o estúdio.

### Por que composição e não herança

Um histórico **tem** filmes; ele não **é** um filme. A frase "todo histórico de avaliação é um
longa-metragem" não se sustenta: o histórico não tem duração, nem diretor, nem nota — ele tem uma
`List<LongaMetragem>` e responde por ela. Herdar traria todos os atributos do filme para dentro do
histórico sem que nenhum deles fizesse sentido ali.

O teste inverso confirma a herança onde ela cabe: "toda animação **é um** longa-metragem" se lê
naturalmente, e por isso `Animacao extends LongaMetragem` (exercício 2), enquanto
`HistoricoAvaliacao` apenas contém a lista (exercício 3).

## Como rodar

```bash
# Parte 1 — relatório no terminal
cd parte1_dart
dart run bin/main.dart

# Parte 2 — aplicativo Flutter
cd parte2_flutter
flutter run
```

## Tabela de rastreio

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | [`parte1_dart/bin/models/longa_metragem.dart:10`](parte1_dart/bin/models/longa_metragem.dart#L10) | Bloco `[1]` do relatório |
| 2 | Herança | [`parte1_dart/bin/models/animacao.dart:21`](parte1_dart/bin/models/animacao.dart#L21) | Bloco `[2]` do relatório |
| 3 | Composição | [`parte1_dart/bin/models/historico_avaliacao.dart:16`](parte1_dart/bin/models/historico_avaliacao.dart#L16) | Bloco `[3]` do relatório |
| 4 | Encapsulamento | [`parte1_dart/bin/models/historico_avaliacao.dart:27`](parte1_dart/bin/models/historico_avaliacao.dart#L27) | Bloco `[4]` e a média no topo da tela de lista |
| 5 | Estrutura de tela | [`parte2_flutter/lib/screens/home_page.dart:104`](parte2_flutter/lib/screens/home_page.dart#L104) | AppBar e corpo da tela inicial |
| 6 | Cartão | [`parte2_flutter/lib/widgets/cartao.dart:11`](parte2_flutter/lib/widgets/cartao.dart#L11) | Cada item da lista |
| 7 | Lista | [`parte2_flutter/lib/screens/home_page.dart:142`](parte2_flutter/lib/screens/home_page.dart#L142) | Lista rolável com seis itens |
| 8 | Navegação | [`parte2_flutter/lib/screens/home_page.dart:48`](parte2_flutter/lib/screens/home_page.dart#L48) | Toque no item abre o detalhe |
| 9 | Formulário | [`parte2_flutter/lib/screens/cadastro_cartao_page.dart:196`](parte2_flutter/lib/screens/cadastro_cartao_page.dart#L196) | Tela de cadastro, com três campos |
| 10 | Estado | [`parte2_flutter/lib/screens/home_page.dart:37`](parte2_flutter/lib/screens/home_page.dart#L37) | Item novo na lista e média atualizada |

## Notas sobre a organização

**Nome das pastas.** O enunciado sugere `parte1-dart/` e `parte2-flutter/` com hífen, mas nome de
pacote Dart não aceita hífen — o `pubspec.yaml` recusa. As pastas usam `_` (`parte1_dart/`,
`parte2_flutter/`) para que o nome do pacote e o da pasta continuem iguais.

**Cópia dos models.** As classes existem nos dois projetos, como o enunciado prevê. Os arquivos são
idênticos, com uma única diferença: o `import` do enum `Genero`, que na Parte 1 é um caminho
relativo e na Parte 2 é um `package:`.

**Enum `Genero`.** Na Parte 1 ele carrega apenas o rótulo legível. Na Parte 2 o mesmo enum ganha uma
extensão com as cores dos chips, que depende de `package:flutter/material.dart` e por isso não
poderia existir num projeto Dart puro. Os dois expõem `genero.descricao`, que é o que os models
usam.

**Duração e data de avaliação.** Não aparecem no cartão da lista de propósito: são os dados
exclusivos da tela de detalhe (exercício 8). Como o cadastro tem no máximo três campos
(exercício 9), a duração recebe o valor padrão `LongaMetragem.duracaoPadrao` (120 min) e a data de
avaliação recebe a data de hoje quando um filme novo é cadastrado.

## Estrutura

```
PROJETO_BIMESTRAL_FLUTTER/
├── readme.md
├── parte1_dart/
│   ├── pubspec.yaml
│   └── bin/
│       ├── main.dart              ← único executável, imprime o relatório
│       ├── enums/genero.dart
│       └── models/
│           ├── longa_metragem.dart
│           ├── animacao.dart
│           └── historico_avaliacao.dart
└── parte2_flutter/
    ├── pubspec.yaml
    └── lib/
        ├── main.dart              ← cria o histórico com os seis filmes
        ├── enums/genero.dart
        ├── models/                ← as mesmas classes da Parte 1
        ├── screens/
        │   ├── home_page.dart
        │   └── cadastro_cartao_page.dart
        └── widgets/
            ├── cartao.dart
            ├── genero_chip.dart
            └── minha_app_bar.dart
```

## Análise estática

```
parte1_dart   > dart analyze      → No issues found!
parte2_flutter> flutter analyze   → No issues found!
```

## Autoria

Código escrito por mim, com apoio de IA (Claude) na revisão e na organização dos arquivos, conforme
permitido pelo enunciado. Respondo por cada linha entregue.
