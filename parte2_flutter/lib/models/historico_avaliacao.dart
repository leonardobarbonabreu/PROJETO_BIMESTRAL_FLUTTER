import 'longa_metragem.dart';

class HistoricoAvaliacao {
     
  double get mediaAvaliacao {
    double soma = 0;
    for (var filme in _historico) {
      soma += filme.avaliacao;
    }
    return soma / _historico.length;
  }

  //Atributo privado de listagem dos filmes avaliados
  final List<LongaMetragem> _historico;
  
  //Construtor
  HistoricoAvaliacao({
    required this._historico
  });

  //Adiciona um filme ao histórico
  void adicionar(LongaMetragem filme) {
    _historico.add(filme);
  }

  //Edita um filme existente no histórico
  void editar(int index, LongaMetragem novoFilme) {
    if (index >= 0 && index < _historico.length) {
      _historico[index] = novoFilme;
    }
  }

  // Retorno de uma lista imutável
  List<LongaMetragem> get filmes => List.unmodifiable(_historico);

  //TESTE: Apenas para CLI
  void listar() {
    for (var filme in _historico) {
      print(filme.ficha());
    }
  }
 
}