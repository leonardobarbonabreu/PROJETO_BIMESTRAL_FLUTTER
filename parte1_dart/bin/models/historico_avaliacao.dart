import 'longa_metragem.dart';

class HistoricoAvaliacao {
     
  double get mediaAvaliacao {
    double soma = 0;
    for (var filme in _historico) {
      soma += filme.avaliacao;
    }
    return soma / _historico.length;
  }

  final List<LongaMetragem> _historico;
  
  HistoricoAvaliacao({
    required this._historico
  });

  void adicionar(LongaMetragem filme) {
    _historico.add(filme);
  }

  void listar() {
    for (var filme in _historico) {
      print(filme.ficha());
    }
  }

}