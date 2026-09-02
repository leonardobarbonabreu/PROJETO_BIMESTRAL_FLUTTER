import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/widgets/cartao.dart';
import 'package:parte2_flutter/screens/detalhe_cartao_page.dart';
import 'package:parte2_flutter/screens/cadastro_cartao_page.dart';

class HomePage extends StatefulWidget {
  final HistoricoAvaliacao historico;
  // Construtor
  const HomePage({super.key, required this.historico});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CadastroCartaoPage(
                        onSalvar: (filme) {
                          setState(
                            () { 
                              widget.historico.adicionar(filme);
                            }
                          );
                        }
                      )
                    )
                  );
                }
              )
            ]
        ),

        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Média de avaliações: ${widget.historico.mediaAvaliacao.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              //LISTA
              Expanded(
                child: ListView.builder(
                  itemCount: widget.historico.filmes.length,
                  itemBuilder: (context, index) {
                    final filme = widget.historico.filmes[index];
                    return GestureDetector(
                      child: Cartao(filme: filme),
                      onTap:() {
                          Navigator.of(context).push(
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
