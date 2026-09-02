import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/screens/home_page.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        historico: HistoricoAvaliacao(historico: [
          LongaMetragem(nome: 'Cidade de Deus', duracao: 130, autor: 'Fernando Meirelles', avaliacao: 9.5, generos: [Genero.drama]),
          LongaMetragem(nome: 'Tropa de Elite', duracao: 115, autor: 'José Padilha', avaliacao: 9.0, generos: [Genero.acao])
        ]),
      )
    );
  }


}

