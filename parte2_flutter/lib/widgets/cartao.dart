import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
import 'package:parte2_flutter/widgets/genero_chip.dart';

/// Exercício 6 — cartão de um item da lista.
///
/// Recebe UM objeto do domínio e desenha só o que precisa aparecer na
/// listagem: nome, autor, gêneros e nota. Duração e data de avaliação ficam
/// de fora de propósito — são os dados exclusivos da tela de detalhe
/// (exercício 8).
class Cartao extends StatelessWidget {
  final LongaMetragem filme;

  const Cartao({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: const EdgeInsets.all(12),
      // O Container nao aceita `color` junto com `decoration`:
      // a cor de fundo vai dentro do BoxDecoration.
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: Colors.black38),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  filme.nome,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  filme.autor,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: filme.generos
                      .map((genero) => GeneroChip(genero: genero))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Chip(
            backgroundColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4.0),
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            label: Text('${filme.avaliacao}/10'),
          ),
        ],
      ),
    );
  }
}
