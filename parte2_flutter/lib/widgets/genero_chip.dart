import 'package:flutter/material.dart';
import 'package:parte2_flutter/enums/genero.dart';

class GeneroChip extends StatelessWidget {
  final Genero genero;
  final bool selecionado;
  final ValueChanged<bool>? onSelecionar;

  const GeneroChip({
    super.key,
    required this.genero,
    this.selecionado = true,
    this.onSelecionar,
  });

  @override
  Widget build(BuildContext context) {
    final estilo = genero.estilo;
    final rotulo = Text(
      estilo.descricao,
      style: TextStyle(
        color: selecionado ? estilo.corTexto : estilo.corFundo,
      ),
    );

    if (onSelecionar != null) {
      return FilterChip(
        label: rotulo,
        selected: selecionado,
        onSelected: onSelecionar,
        backgroundColor: Colors.transparent,
        selectedColor: estilo.corFundo,
        side: BorderSide(color: estilo.corBorda, width: 1.5),
        showCheckmark: false,
      );
    }

    return Chip(
      label: rotulo,
      backgroundColor: estilo.corFundo,
      side: BorderSide(color: estilo.corBorda, width: 1.5),
    );
  }
}
