import 'dart:io';

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
  void adicionar(LongaMetragem filme, [int ?index]) {
    if (!validarItem(filme)){
      exit(400);
    }

    if (index != null){
      _historico.insert(index, filme);
    } else {
      _historico.add(filme);
    }
    
  }

  bool validarItem(LongaMetragem filme) {    
    
    if (filme.autor == "") {
      Exception("Informe o autor do filme");
      return false;        
    }

    if (filme.nome == "") {
      Exception("Informe o nome do filme");
      return false;        
    }

    if (filme.duracao < 70 || filme.duracao > 400) {
      Exception("O filme precisa ter uma duração mínima de 70 min.");
      return false;        
    }

    if (filme.avaliacao < 0.1 || filme.avaliacao > 10) {
      Exception("A avaliação vai de 0 a 10.");
      return false;        
    }

    if (filme.generos.isEmpty) {
      Exception("Selecione ao menos um gênero para o filme");
      return false;        
    }


    return true;

  }

  //Edita um filme existente no histórico
  void editar(int index, LongaMetragem novoFilme) {
    if (!validarItem(novoFilme)){
      exit(400);
    }
  
    if (index >= 0 && index < _historico.length) {
      _historico[index] = novoFilme;
    }
  }

  void remover(LongaMetragem filme) {
    _historico.remove(filme);
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