import 'enums/genero.dart';
import 'models/animacao.dart';
import 'models/historico_avaliacao.dart';
import 'models/longa_metragem.dart';

/// Relatório da Parte 1: quatro blocos numerados, um por exercício.
/// Rode com `dart run bin/main.dart` na pasta `parte1_dart/`.
void main() {
  // ---------------------------------------------------------------------
  // [1] Entidade principal — construtor de parâmetros nomeados + required
  // ---------------------------------------------------------------------
  final duna = LongaMetragem(
    nome: 'Duna: Parte 2',
    autor: 'Denis Villeneuve',
    duracao: 166,
    avaliacao: 9.0,
    generos: [Genero.ficcao, Genero.aventura],
    dataAvaliacao: DateTime(2026, 3, 12),
  );

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(duna.ficha());
  print('');

  // ---------------------------------------------------------------------
  // [2] Herança — o MESMO método ficha() no pai e na filha
  // ---------------------------------------------------------------------
  // O mesmo filme montado das duas formas: como longa-metragem comum e como
  // animação. A diferença entre as duas linhas é exatamente o que o @override
  // acrescentou.
  final tumuloComoFilme = LongaMetragem(
    nome: 'Túmulo dos Vagalumes',
    autor: 'Isao Takahata',
    duracao: 89,
    avaliacao: 9.7,
    generos: [Genero.drama],
    dataAvaliacao: DateTime(2026, 5, 30),
  );

  final tumuloComoAnimacao = Animacao(
    nome: 'Túmulo dos Vagalumes',
    autor: 'Isao Takahata',
    duracao: 89,
    avaliacao: 9.7,
    generos: [Genero.drama],
    dataAvaliacao: DateTime(2026, 5, 30),
    tecnicaDeAnimacao: TecnicasDeAnimacao.tradicional,
    estudio: 'Studio Ghibli',
  );

  print('===== [2] HERANÇA =====');
  print('LongaMetragem -> ficha: "${tumuloComoFilme.ficha()}"');
  print('Animacao      -> ficha: "${tumuloComoAnimacao.ficha()}"');
  print('');

  // ---------------------------------------------------------------------
  // [3] Composição — o histórico TEM uma List<LongaMetragem>
  // ---------------------------------------------------------------------
  final historico = HistoricoAvaliacao(
    nome: 'Filmes que já assisti',
    historico: [
      duna,
      Animacao(
        nome: 'Como Treinar o Seu Dragão',
        autor: 'Dean DeBlois',
        duracao: 98,
        avaliacao: 9.2,
        generos: [Genero.aventura, Genero.comedia],
        dataAvaliacao: DateTime(2026, 4, 2),
        tecnicaDeAnimacao: TecnicasDeAnimacao.digital3D,
        estudio: 'DreamWorks Animation',
      ),
      LongaMetragem(
        nome: 'Círculo de Fogo',
        autor: 'Guillermo del Toro',
        duracao: 131,
        avaliacao: 7.5,
        generos: [Genero.acao, Genero.ficcao],
        dataAvaliacao: DateTime(2026, 1, 25),
      ),
      Animacao(
        nome: 'Homem-Aranha: Através do Aranhaverso',
        autor: 'Joaquim Dos Santos',
        duracao: 140,
        avaliacao: 9.4,
        generos: [Genero.aventura, Genero.acao, Genero.ficcao],
        dataAvaliacao: DateTime(2026, 2, 18),
        tecnicaDeAnimacao: TecnicasDeAnimacao.mix,
        estudio: 'Sony Pictures Animation',
      ),
      tumuloComoAnimacao,
      LongaMetragem(
        nome: 'Um Sonho de Liberdade',
        autor: 'Frank Darabont',
        duracao: 142,
        avaliacao: 9.8,
        generos: [Genero.drama, Genero.suspense],
        dataAvaliacao: DateTime(2026, 6, 8),
      ),
    ],
  );

  print('===== [3] COMPOSIÇÃO =====');
  print(historico.descricao());
  print('');

  // ---------------------------------------------------------------------
  // [4] Encapsulamento — o getter calculado muda sozinho
  // ---------------------------------------------------------------------
  print('===== [4] ENCAPSULAMENTO =====');
  print('Histórico "${historico.nome}" -> média das notas (calculada): '
      '${historico.mediaAvaliacao.toStringAsFixed(2)}');

  final erro = historico.adicionar(LongaMetragem(
    nome: 'Cidade de Deus',
    autor: 'Fernando Meirelles',
    duracao: 130,
    avaliacao: 5.0,
    generos: [Genero.drama, Genero.acao],
    dataAvaliacao: DateTime(2026, 7, 4),
  ));

  if (erro != null) {
    print('Não foi possível adicionar: $erro');
  } else {
    print('Após adicionar "Cidade de Deus" (nota 5.0): '
        '${historico.mediaAvaliacao.toStringAsFixed(2)}');
  }
}
