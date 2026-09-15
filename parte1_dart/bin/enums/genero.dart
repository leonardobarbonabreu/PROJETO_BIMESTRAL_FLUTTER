/// Gêneros possíveis de um longa-metragem.
///
/// Vive num arquivo próprio (e não dentro de `longa_metragem.dart`) para
/// espelhar a organização da Parte 2, onde o mesmo enum ganha as cores dos
/// chips. Aqui, sem Flutter, ele carrega apenas o rótulo legível.
enum Genero {
  acao,
  terror,
  aventura,
  comedia,
  romance,
  ficcao,
  drama,
  suspense,
  musical,
}

extension GeneroDescricao on Genero {
  String get descricao => switch (this) {
        Genero.acao => 'Ação',
        Genero.terror => 'Terror',
        Genero.aventura => 'Aventura',
        Genero.comedia => 'Comédia',
        Genero.romance => 'Romance',
        Genero.ficcao => 'Ficção Científica',
        Genero.drama => 'Drama',
        Genero.suspense => 'Suspense',
        Genero.musical => 'Musical',
      };
}
