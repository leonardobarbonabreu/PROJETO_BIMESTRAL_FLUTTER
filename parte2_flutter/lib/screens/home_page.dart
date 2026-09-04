import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/widgets/cartao.dart';
import 'package:parte2_flutter/screens/cadastro_cartao_page.dart';
import 'package:parte2_flutter/widgets/minha_app_bar.dart';

class HomePage extends StatefulWidget {
  final HistoricoAvaliacao historico;
  // Construtor
  const HomePage({super.key, required this.historico});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _busca = '';

  @override
  Widget build(BuildContext context) {
        final filmesFiltrados = widget.historico.filmes.where((filme) {
        final termo = _busca.toLowerCase();
        return filme.nome.toLowerCase().contains(termo) ||
               filme.autor.toLowerCase().contains(termo);
      }).toList();

      return Scaffold(
        appBar: MinhaAppBar(titulo: 'Listagem de Filmes.'),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Média de avaliações: ${widget.historico.mediaAvaliacao.toStringAsFixed(1)}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  decoration: const InputDecoration(
                    hintText: 'Buscar por nome ou autor',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                  onChanged: (valor) => setState(() => _busca = valor),
                ),
              ),
              const SizedBox(height: 8),
              //LISTA
              Expanded(
                child: ListView.builder(                  
                  itemCount: filmesFiltrados.length,
                  itemBuilder: (context, index) {
                    final filme = filmesFiltrados[index];
                    return Dismissible(
                      key: ObjectKey(filme),
                      direction: DismissDirection.endToStart,
                      background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Arraste para Excluir', style: TextStyle(color: Colors.white),),
                          Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0),),
                          const Icon(Icons.delete, color: Colors.white),
                        ],
                      ),
                      ),
                      child: GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => 
                              CadastroCartaoPage(
                                filme: filme,
                                podeEscrever: false,
                                onSalvar: (filme) {
                                  setState(
                                    () {
                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                      widget.historico.editar(index, filme);
                                    }
                                  );
                                }
                              )
                            )
                          );
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        child: Cartao(filme: filme)                        
                      ),
                      onDismissed: (_) {    
                        setState(() {
                          widget.historico.remover(filme);                        
                        });
                        
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 4),
                            backgroundColor: Colors.black,                            
                            content: Text('Filme Removido', style: TextStyle(color: Colors.white, fontWeight: FontWeight(400)),),
                            action: SnackBarAction(label: 'Desfazer', onPressed: (){
                              setState(() {
                                widget.historico.adicionar(filme, index);
                              });
                            }),  
                          ),
                        );
                      },
                    );                    
                  },
                )
              )
            ]
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 32.0, right: 12.0),
          child: SizedBox(
            width: 70,
            height: 70,
            child: FloatingActionButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16.0),
                side: BorderSide(color: Colors.black38)
              ),
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CadastroCartaoPage(
                      podeEscrever: true,
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
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(Icons.add),
            ),
          ),
        ),
      );
  }
}
