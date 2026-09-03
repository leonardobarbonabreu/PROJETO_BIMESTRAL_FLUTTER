import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/screens/home_page.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
import 'package:parte2_flutter/enums/genero.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(
        historico: HistoricoAvaliacao(historico: [
          LongaMetragem(nome: 'Cidade de Deus', duracao: 130, autor: 'Fernando Meirelles', avaliacao: 9.5, generos: [Genero.drama]),
          LongaMetragem(nome: 'File mion', duracao: 115, autor: 'Miguel Gonsalves', avaliacao: 8.3, generos: [Genero.acao, Genero.suspense]),
          LongaMetragem(nome: 'Gorilas de vidro', duracao: 126, autor: 'Agata Vercette', avaliacao: 7.4, generos: [Genero.drama, Genero.terror]),
          LongaMetragem(nome: 'Galinha esqueletica', duracao: 152, autor: 'José Padilha', avaliacao: 9.1, generos: [Genero.acao, Genero.suspense, Genero.drama]),
          LongaMetragem(nome: 'Operação Manga magistral', duracao: 111, autor: 'Martin Picine', avaliacao: 5.3, generos: [Genero.musical, Genero.aventura]),
          LongaMetragem(nome: 'Tropa de Elite', duracao: 124, autor: 'Marina Spessato', avaliacao: 8.2, generos: [Genero.romance, Genero.comedia]),          
        ]),
      )
    );
  }


}

