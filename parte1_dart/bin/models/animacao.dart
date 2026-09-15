import 'longa_metragem.dart';

enum TecnicasDeAnimacao { tradicional, digital2D, digital3D, stopMotion, mix }

extension TecnicaDescricao on TecnicasDeAnimacao {
  String get descricao => switch (this) {
        TecnicasDeAnimacao.tradicional => 'Tradicional (desenhada à mão)',
        TecnicasDeAnimacao.digital2D => 'Digital 2D',
        TecnicasDeAnimacao.digital3D => 'Digital 3D',
        TecnicasDeAnimacao.stopMotion => 'Stop-motion',
        TecnicasDeAnimacao.mix => 'Técnica mista',
      };
}

/// Exercício 2 — Herança.
///
/// Toda animação **é um** longa-metragem: tem nome, autor, duração, nota,
/// gêneros e data de avaliação exatamente como qualquer outro filme. O que ela
/// acrescenta são dois atributos próprios — a técnica usada e o estúdio.
/// Por isso `extends`, e não composição.
class Animacao extends LongaMetragem {
  final TecnicasDeAnimacao tecnicaDeAnimacao;
  final String estudio;

  Animacao({
    required super.nome,
    required super.duracao,
    required super.autor,
    required super.avaliacao,
    required super.generos,
    required this.tecnicaDeAnimacao,
    required this.estudio,
    super.dataAvaliacao,
  });

  /// Sobrescreve a ficha do pai acrescentando o que só a animação tem.
  /// Chamar `super.ficha()` evita repetir a montagem dos campos herdados.
  @override
  String ficha() => '${super.ficha()} | $estudio, ${tecnicaDeAnimacao.descricao}';
}
