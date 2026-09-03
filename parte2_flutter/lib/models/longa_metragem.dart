import 'package:parte2_flutter/enums/genero.dart';

class LongaMetragem {
  // Atributos da classe
  String   nome;
  int      duracao;
  String   autor;
  double   avaliacao;
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

  //Função para avaliar
  void avaliar(double nota){
       if (nota > 10 || nota < 0.1) {
          avaliacao = nota;
          print('O seguinte Filme foi avaliado com $avaliacao de nota');
       }
       else {
          print('O valor passado é inválido: $nota');
       }       
  }

  String ficha() {
    return 'LongaMetragem{nome: $nome, duracao: $duracao, autor: $autor, avaliacao: $avaliacao, dataAvaliacao: $dataAvaliacao, generos: $generos}';
  }

}