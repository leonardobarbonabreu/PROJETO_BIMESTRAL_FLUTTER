import 'package:parte2_flutter/enums/genero.dart';

/// Exercício 1 — Entidade principal do domínio.
///
/// Um filme que já assisti. O construtor usa parâmetros nomeados com [required]
/// nos campos obrigatórios; [dataAvaliacao] é opcional e recebe o valor padrão
/// "agora" quando não é informado.
///
/// Cinco tipos diferentes: `String`, `int`, `double`, `DateTime` e `List<Genero>`.
class LongaMetragem {
  /// Duração atribuída a um filme cadastrado pela tela da Parte 2, onde o
  /// formulário tem no máximo três campos e a duração não é digitada.
  static const int duracaoPadrao = 120;

  String nome;
  int duracao;
  String autor;
  double avaliacao;
  DateTime dataAvaliacao;
  final List<Genero> generos;

  LongaMetragem({
    required this.nome,
    required this.duracao,
    required this.autor,
    required this.avaliacao,
    required this.generos,
    DateTime? dataAvaliacao,
  }) : dataAvaliacao = dataAvaliacao ?? DateTime.now();

  /// Data de avaliação em dd/MM/yyyy, sem depender do pacote `intl`.
  String get dataFormatada =>
      '${dataAvaliacao.day.toString().padLeft(2, '0')}/'
      '${dataAvaliacao.month.toString().padLeft(2, '0')}/'
      '${dataAvaliacao.year}';

  String get generosFormatados =>
      generos.map((genero) => genero.descricao).join(', ');

  /// Reavalia o filme. Devolve `false` quando a nota está fora de 0 a 10,
  /// em vez de imprimir: o modelo não decide como o erro é mostrado.
  bool avaliar(double nota) {
    if (nota < 0 || nota > 10) return false;
    avaliacao = nota;
    return true;
  }

  /// Exercício 2 — este é o método sobrescrito por [Animacao].
  String ficha() =>
      'Filme: $nome | $duracao min | nota $avaliacao | dir. $autor '
      '| $generosFormatados | avaliado em $dataFormatada';
}
