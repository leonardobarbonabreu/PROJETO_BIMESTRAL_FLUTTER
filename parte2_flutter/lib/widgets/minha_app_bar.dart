import 'package:flutter/material.dart';

class MinhaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;

  const MinhaAppBar({super.key, required this.titulo});

  @override
  Size get preferredSize => const Size.fromHeight(150);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //centerTitle: false,
      
      
      flexibleSpace: Container(
        alignment: AlignmentGeometry.centerLeft,        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF261bff), Color(0xFF8C52FF)],
            begin: Alignment.topLeft,
            end:   Alignment.bottomRight,
          ),          
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(titulo, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white)),
        ),
      ) 
      
    );
  }
}