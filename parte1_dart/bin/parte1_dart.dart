import 'models/longa_metragem.dart';
import 'models/animacao.dart';
import 'models/historico_avaliacao.dart';

void main() {
  LongaMetragem filme1 = LongaMetragem(
    autor: 'Leonardo',
    nome: 'filme teste',
    avaliacao: 8.7,
    duracao: 87,
    generos: [Genero.acao, Genero.terror]
  );

  Animacao filme2 = Animacao(
    autor: 'Leonardo',
    nome: 'filme teste',
    avaliacao: 10.0,
    duracao: 90,
    generos: [Genero.aventura],
    tecnicaDeAnimacao: TecnicasDeAnimacao.digital_3D
  );

  HistoricoAvaliacao historico = HistoricoAvaliacao(historico: [filme1, filme2]);

  print('===== [1] ENTIDADE PRINCIPAL =====');
  print(filme1.ficha());
  print('');
  print('===== [2] HERANÇA =====');
  print('Filme comum -> ficha: "${filme1.ficha()}"');
  print('Animação -> ficha: "${filme2.ficha()}"');
  print('');
  print('===== [3] COMPOSIÇÃO =====');
  historico.listar();
  print('');
  print('===== [4] ENCAPSULAMENTO =====');
  print('Média das avaliações (antes): ${historico.mediaAvaliacao}');
  historico.adicionar(LongaMetragem(
    autor: 'Fernando Meirelles',
    nome: 'Cidade de Deus',
    avaliacao: 9.5,
    duracao: 130,
    generos: [Genero.acao],
  ));
  print('Após adicionar "Cidade de Deus" (nota 9.5): ${historico.mediaAvaliacao}');
}