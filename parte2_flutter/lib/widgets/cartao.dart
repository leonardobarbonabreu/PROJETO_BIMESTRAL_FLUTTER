import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';

class Cartao extends StatelessWidget {
  final LongaMetragem filme;
  
  const Cartao({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(filme.nome, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('${filme.duracao} min • nota ${filme.avaliacao}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

}