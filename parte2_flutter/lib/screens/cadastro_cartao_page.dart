import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
import 'package:parte2_flutter/widgets/minha_app_bar.dart';
import 'package:parte2_flutter/enums/genero.dart';

class CadastroCartaoPage extends StatefulWidget {
  final void Function(LongaMetragem) onSalvar;
  final LongaMetragem? filme;
  final bool podeEscrever;
  
  const CadastroCartaoPage(
    {super.key,
     required this.onSalvar,
     this.filme,
     required this.podeEscrever}
  );

  @override
  State<CadastroCartaoPage> createState() => _CadastroCartaoPageState();
}

class _CadastroCartaoPageState extends State<CadastroCartaoPage> {
  final _nomeController  = TextEditingController();
  final _autorController = TextEditingController();
  final _notaController  = TextEditingController();

  bool get _editando => widget.filme != null;

  late bool _podeEscrever;

  @override
  void initState() {
    super.initState();

    _podeEscrever = widget.podeEscrever;

    if (widget.filme != null) {
      _nomeController.text  = widget.filme!.nome;
      _autorController.text = widget.filme!.autor;
      _notaController.text  = widget.filme!.avaliacao.toString();
    }
  }

  @override
  void dispose(){
    _nomeController.dispose();
    _autorController.dispose();
    _notaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MinhaAppBar(
        titulo: !_editando
          ? 'Cadastrar filme'
          : (_podeEscrever ? 'Editar filme' : 'Visualizar filme')
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              enabled: _podeEscrever,
              controller: _nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                prefixIcon: Icon(Icons.movie),
                prefixIconColor: Color(0xFF607D8B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                )                
              )
            ),
            const SizedBox(height: 16),
            TextFormField(
              enabled: _podeEscrever,
              controller: _autorController,
              decoration: const InputDecoration(

                labelText: 'Autor',
                prefixIcon: Icon(Icons.person),
                prefixIconColor: Color(0xFF607D8B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                )                
              )
            ),
            const SizedBox(height: 16),
            TextFormField(
              enabled: _podeEscrever,
              controller: _notaController,
              decoration: const InputDecoration(
                labelText: 'Nota',
                prefixIcon: Icon(Icons.star),
                prefixIconColor: Color(0xFF607D8B),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                )
              ),
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: _podeEscrever,
              child: SizedBox(
                height: 48,
                width: 128,
                child: ElevatedButton(                
                  onPressed: _podeEscrever
                    ? () {
                        final novoFilme = LongaMetragem(
                          nome: _nomeController.text,
                          autor: _autorController.text,
                          duracao: 120,
                          avaliacao: double.tryParse(_notaController.text) ?? 1.0,
                          generos: [Genero.acao]
                        );
                        widget.onSalvar(novoFilme);
                        Navigator.of(context).pop();
                      }
                    : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: widget.filme != null ? Colors.blue : Colors.white,
                    side: BorderSide(color: Colors.black38),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8.0)),                                                      
                  ),              
                  child: Text(
                    _editando ? 'Alterar' : 'Cadastrar',
                    style: TextStyle(color: _editando ? Colors.white : Colors.black,), 
                  )                
                ),
              ),
            )
          ],
        )
      ),
      floatingActionButton:
        Visibility(
          visible: _editando,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 32.0, right: 12.0),
            child: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16.0),
                    side: BorderSide(color: Colors.black38)
                  ),
                  onPressed: () {
                    setState(() {
                      _podeEscrever = !_podeEscrever; 
                    });
                  },
                  child: !_podeEscrever? Icon(Icons.edit) : const Icon(Icons.visibility_outlined)
                ),
            ),
          ),
        ) 
    );
  }
}