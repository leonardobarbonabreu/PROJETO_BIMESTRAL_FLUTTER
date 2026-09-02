import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';

class CadastroCartaoPage extends StatefulWidget {
  final void Function(LongaMetragem) onSalvar;
  const CadastroCartaoPage({super.key, required this.onSalvar});

  @override
  State<CadastroCartaoPage> createState() => _CadastroCartaoPageState();
}

class _CadastroCartaoPageState extends State<CadastroCartaoPage> {
  final _nomeController  = TextEditingController();
  final _autorController = TextEditingController();
  final _notaController  = TextEditingController();

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
      appBar: AppBar(title: const Text('Cadstrar filme')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
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
            ElevatedButton(
              onPressed: () {
                final novoFilme = LongaMetragem(
                  nome: _nomeController.text,
                  autor: _autorController.text,
                  duracao: 120,
                  avaliacao: double.tryParse(_notaController.text) ?? 1.0,
                  generos: [Genero.acao]
                );
                widget.onSalvar(novoFilme);
                Navigator.of(context).pop();
              },
              child: const Text('confirmar')
            )
          ],
        )
      )
    );
  }
}