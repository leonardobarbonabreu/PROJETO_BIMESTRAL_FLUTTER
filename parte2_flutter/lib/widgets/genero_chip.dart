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
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -4.0),
        padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),

        side: BorderSide(color: estilo.corBorda, width: 1),
        showCheckmark: false,
      );
    }

    return Chip(
      label: rotulo,
      backgroundColor: estilo.corFundo,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity(horizontal: 0.0, vertical: -4.0),
      padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(12)),
      side: BorderSide(color: estilo.corBorda, width: 1),
    );
  }
}
