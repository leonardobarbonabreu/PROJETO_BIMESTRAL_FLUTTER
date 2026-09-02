import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/widgets/cartao.dart';
import 'package:parte2_flutter/screens/detalhe_cartao_page.dart';

class HomePage extends StatelessWidget {
  final HistoricoAvaliacao historico;
  // Construtor
  const HomePage({super.key, required this.historico});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Home')
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Média de avaliações: ${historico.mediaAvaliacao.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              //LISTA
              Expanded(
                child: ListView.builder(
                  itemCount: historico.filmes.length,
                  itemBuilder: (context, index) {
                    final filme = historico.filmes[index];
                    return GestureDetector(
                      child: Cartao(filme: filme),
                      onTap:() {
                         Navigator.of(context)..push(
                           MaterialPageRoute(builder: (context) => DetalheCartaoPage(filme: filme))
                         ); 
                      },
                    );
                  },
                )
              )
            ]
        ),
      );
  }
}
