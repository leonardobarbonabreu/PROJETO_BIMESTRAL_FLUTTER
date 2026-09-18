import 'longa_metragem.dart';

/// Exercícios 3 e 4 — Composição e encapsulamento.
///
/// O histórico **tem** uma lista de filmes; ele não **é** um filme. Por isso
/// `List<LongaMetragem>` como atributo, e não `extends LongaMetragem`.
///
/// A lista é privada (`_historico`) e só sai daqui como cópia imutável
/// ([filmes]); quem quiser mexer nela passa por [adicionar], [editar] ou
/// [remover], que validam antes de alterar.
class HistoricoAvaliacao {
  /// Nome do histórico — usado no cabeçalho do bloco [3] do relatório.
  final String nome;

  /// Exercício 4 — atributo privado.
  final List<LongaMetragem> _historico;

  HistoricoAvaliacao({
    required this._historico,
    this.nome = 'Filmes que já assisti',
  });

  /// Exercício 4 — getter calculado.
  ///
  /// A média é somada na hora, a partir de `_historico`. Não existe campo
  /// guardado: por isso ela muda sozinha quando um filme entra ou sai.
  double get mediaAvaliacao {
    if (_historico.isEmpty) return 0;
    double soma = 0;
    for (final filme in _historico) {
      soma += filme.avaliacao;
    }
    return soma / _historico.length;
  }

  int get quantidade => _historico.length;

  /// Cópia somente-leitura: a tela consegue listar, mas não consegue alterar
  /// a lista interna por fora dos métodos desta classe.
  List<LongaMetragem> get filmes => List.unmodifiable(_historico);

  /// Verifica o filme e devolve a mensagem do primeiro problema encontrado,
  /// ou `null` quando está tudo certo.
  ///
  /// Devolver a mensagem (em vez de imprimir ou encerrar o processo) é o que
  /// permite à tela mostrar um SnackBar sem que o modelo saiba o que é uma
  /// tela.
  String? validarItem(LongaMetragem filme) {
    if (filme.nome.trim().isEmpty) return 'Informe o nome do filme.';
    if (filme.autor.trim().isEmpty) return 'Informe o autor do filme.';
    if (filme.duracao < 70 || filme.duracao > 400) {
      return 'A duração precisa ficar entre 70 e 400 minutos.';
    }
    if (filme.avaliacao < 0 || filme.avaliacao > 10) {
      return 'A avaliação vai de 0 a 10.';
    }
    if (filme.generos.isEmpty) {
      return 'Selecione ao menos um gênero para o filme.';
    }
    
    return null;
  }

  /// Exercício 3 — acrescenta um filme à lista.
  ///
  /// Devolve `null` em caso de sucesso, ou a mensagem de erro da validação.
  /// [index] é usado apenas para desfazer uma exclusão, devolvendo o filme
  /// à posição em que ele estava.
  String? adicionar(LongaMetragem filme, [int? index]) {
    final erro = validarItem(filme);
    if (erro != null) return erro;

    if (index != null && index >= 0 && index <= _historico.length) {
      _historico.insert(index, filme);
    } else {
      _historico.add(filme);
    }
    return null;
  }

  /// Substitui o filme da posição [index]. Mesmo contrato de [adicionar].
  String? editar(int index, LongaMetragem novoFilme) {
    final erro = validarItem(novoFilme);
    if (erro != null) return erro;

    if (index >= 0 && index < _historico.length) {
      _historico[index] = novoFilme;
      return null;
    }
    return 'Filme não encontrado no histórico.';
  }

  void remover(LongaMetragem filme) => _historico.remove(filme);

  /// Exercício 3 — texto do bloco [3] do relatório: a contagem e os títulos,
  /// um por linha. Devolve a String em vez de imprimir para que o modelo
  /// continue igual nas duas partes (a Parte 2 não pode usar `print`).
  String descricao() {
    final linhas = _historico.map((filme) => '  - ${filme.nome}').join('\n');
    return 'Histórico "$nome" contém $quantidade filmes:\n$linhas';
  }
}
