import 'package:flutter/material.dart';
import 'package:parte2_flutter/enums/genero.dart';
import 'package:parte2_flutter/models/animacao.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
import 'package:parte2_flutter/screens/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  /// Exercício 7 — o objeto agrupador já nasce com os seis filmes, para que a
  /// lista apareça cheia no primeiro segundo de execução.
  /// Nenhum dado do domínio é escrito dentro de um widget: tudo sai daqui.
  HistoricoAvaliacao get _historicoInicial => HistoricoAvaliacao(
        nome: 'Filmes que já assisti',
        historico: [
          LongaMetragem(
            nome: 'Duna: Parte 2',
            autor: 'Denis Villeneuve',
            duracao: 166,
            avaliacao: 9.0,
            generos: [Genero.ficcao, Genero.aventura],
            dataAvaliacao: DateTime(2026, 3, 12),
          ),
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
            generos: [Genero.aventura, Genero.acao],
            dataAvaliacao: DateTime(2026, 2, 18),
            tecnicaDeAnimacao: TecnicasDeAnimacao.mix,
            estudio: 'Sony Pictures Animation',
          ),
          Animacao(
            nome: 'Túmulo dos Vagalumes',
            autor: 'Isao Takahata',
            duracao: 89,
            avaliacao: 9.7,
            generos: [Genero.drama],
            dataAvaliacao: DateTime(2026, 5, 30),
            tecnicaDeAnimacao: TecnicasDeAnimacao.tradicional,
            estudio: 'Studio Ghibli',
          ),
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(historico: _historicoInicial),
    );
  }
}
