import 'longa_metragem.dart';
  // String nome;
  // int    duracao = 0;
  // String autor;
  // int    avaliacao;
  // final  List<Genero> generos;

enum TecnicasDeAnimacao {tradicional, digital_2D, digital_3D, stopMotion, mix}

class Animacao extends LongaMetragem {
  // Atributos da classe
  TecnicasDeAnimacao tecnicaDeAnimacao;

  Animacao({
    required super.nome,
    required super.duracao,
    required super.autor,
    required super.avaliacao,
    required super.generos,
    required this.tecnicaDeAnimacao
  });

  @override
  String ficha() {
    return 'Animacao{nome: $nome, duracao: $duracao, autor: $autor, avaliacao: $avaliacao, dataAvaliacao: $dataAvaliacao, generos: $generos, tecnicaDeAnimacao: $tecnicaDeAnimacao}';
  }  
}