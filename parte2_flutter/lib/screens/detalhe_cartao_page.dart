import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';

class DetalheCartaoPage extends StatelessWidget {
  final LongaMetragem filme;
  const DetalheCartaoPage({super.key, required this.filme});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(filme.nome)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Autor: ${filme.autor}'),
            Text('Duração: ${filme.duracao} min'),
            Text('Avaliação: ${filme.avaliacao}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Gêneros: '),
                for (var genero in filme.generos)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Chip(label: Text(genero.toString().split('.').last)),
                  )
              ]
            )
          ]
        )
      )
    );
  }

}