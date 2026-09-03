import 'package:flutter/material.dart';

enum Genero { acao, terror, aventura, comedia, romance, ficcao, drama, suspense, musical }

/// Agrupa toda a aparência visual de um [Genero]: cor de fundo, cor do
/// texto/ícone, cor da borda e o gradiente (para usos como banners de cartão).
/// Mantendo tudo num só lugar, telas diferentes (cartão, formulário, etc.)
/// desenham o mesmo chip sem duplicar a lógica de cores.
class GeneroEstilo {
  final Color corFundo;
  final Color corTexto;
  final Color corBorda;
  final String descricao;
  
  const GeneroEstilo({
    required this.corFundo,
    required this.corTexto,
    required this.corBorda,
    required this.descricao
  });
}

extension GeneroCor on Genero {
  GeneroEstilo get estilo => switch (this) {
    Genero.acao => const GeneroEstilo(
        corFundo: Colors.deepOrange,
        corTexto: Colors.white,
        corBorda: Colors.deepOrangeAccent,
        descricao: 'Ação',
      ),
    Genero.terror => const GeneroEstilo(
        corFundo: Colors.black87,
        corTexto: Colors.white,
        corBorda: Colors.red,
        descricao: 'Terror',
      ),
    Genero.aventura => const GeneroEstilo(
        corFundo: Colors.lightGreen,
        corTexto: Colors.white,
        corBorda: Colors.green,
        descricao: 'Aventura',
      ),
    Genero.comedia => const GeneroEstilo(
        corFundo: Colors.amber,
        corTexto: Colors.black87,
        corBorda: Colors.orangeAccent,
        descricao: 'Comédia',
      ),
    Genero.romance => const GeneroEstilo(
        corFundo: Colors.pinkAccent,
        corTexto: Colors.white,
        corBorda: Colors.pink,
        descricao: 'Romance',
      ),
    Genero.ficcao => const GeneroEstilo(
        corFundo: Colors.cyan,
        corTexto: Colors.black87,
        corBorda: Colors.cyan,
        descricao: 'Ficção Científica',
      ),
    Genero.drama => const GeneroEstilo(
        corFundo: Color.fromARGB(255, 77, 99, 223),
        corTexto: Colors.white,
        corBorda: Color.fromARGB(255, 77, 99, 223),
        descricao: 'Drama',
      ),
    Genero.suspense => const GeneroEstilo(
        corFundo: Colors.deepPurple,
        corTexto: Colors.white,
        corBorda: Colors.deepPurple,
        descricao: 'Suspense',
      ),
    Genero.musical => const GeneroEstilo(
        corFundo: Colors.yellow,
        corTexto: Colors.black87,
        corBorda: Colors.orangeAccent,
        descricao: 'Musical',
      ),
  };
}
