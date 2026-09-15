import 'package:flutter/material.dart';
import 'package:parte2_flutter/models/historico_avaliacao.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
import 'package:parte2_flutter/screens/cadastro_cartao_page.dart';
import 'package:parte2_flutter/widgets/cartao.dart';
import 'package:parte2_flutter/widgets/minha_app_bar.dart';

/// Exercícios 5, 7 e 10 — a tela de lista.
///
/// Exercício 10: é um StatefulWidget e guarda o objeto agrupador. Todo item
/// que entra ou sai passa por um `setState`; sem ele a lista muda na memória
/// mas a tela não redesenha.
class HomePage extends StatefulWidget {
  final HistoricoAvaliacao historico;

  const HomePage({super.key, required this.historico});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _busca = '';

  /// Abre a tela de cadastro em branco. Exercício 10: o filme novo entra pelo
  /// `adicionar` do exercício 3, dentro de um setState — e o total do topo,
  /// que é um getter calculado, se atualiza sozinho.
  void _abrirCadastro() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CadastroCartaoPage(
          podeEscrever: true,
          onSalvar: (filme) {
            final erro = widget.historico.validarItem(filme);
            if (erro != null) return erro;

            setState(() => widget.historico.adicionar(filme));
            return null;
          },
        ),
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  /// Exercício 8 — abre o detalhe do filme tocado, passando o objeto pelo
  /// construtor da tela de destino.
  void _abrirDetalhe(LongaMetragem filme) {
    // A posição real no histórico, e não o índice da lista filtrada pela
    // busca: com um termo digitado, os dois não coincidem.
    final indexReal = widget.historico.filmes.indexOf(filme);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CadastroCartaoPage(
          filme: filme,
          podeEscrever: false,
          onSalvar: (editado) {
            final erro = widget.historico.editar(indexReal, editado);
            if (erro != null) return erro;

            setState(() {});
            return null;
          },
        ),
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  void _removerComDesfazer(LongaMetragem filme, int indexReal) {
    setState(() => widget.historico.remover(filme));

    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 4),
          backgroundColor: Colors.black,
          content: const Text('Filme removido',
              style: TextStyle(color: Colors.white)),
          action: SnackBarAction(
            label: 'Desfazer',
            onPressed: () => setState(
              () => widget.historico.adicionar(filme, indexReal),
            ),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final termo = _busca.trim().toLowerCase();
    final filmesFiltrados = widget.historico.filmes.where((filme) {
      return filme.nome.toLowerCase().contains(termo) ||
          filme.autor.toLowerCase().contains(termo);
    }).toList();

    return Scaffold(
      appBar: const MinhaAppBar(titulo: 'Listagem de Filmes.'),
      // Exercício 5 — Column com os dois alinhamentos declarados:
      // mainAxis empilha de cima para baixo, crossAxis estica na largura.
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Exercício 4 — o getter calculado do histórico, no topo da tela.
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Média de avaliações: '
              '${widget.historico.mediaAvaliacao.toStringAsFixed(1)}'
              '  (${widget.historico.quantidade} filmes)',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Buscar por nome ou autor',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              onChanged: (valor) => setState(() => _busca = valor),
            ),
          ),
          const SizedBox(height: 8),
          // Exercício 7 — ListView.builder alimentado pela lista do histórico.
          // O Expanded resolve o conflito de altura: a Column e a ListView
          // querem crescer no mesmo eixo, e o Expanded dá à lista o espaço
          // que sobrou.
          Expanded(
            child: ListView.builder(
              itemCount: filmesFiltrados.length,
              itemBuilder: (context, index) {
                final filme = filmesFiltrados[index];
                final indexReal = widget.historico.filmes.indexOf(filme);

                return Dismissible(
                  key: ObjectKey(filme),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Arraste para excluir',
                            style: TextStyle(color: Colors.white)),
                        SizedBox(width: 8),
                        Icon(Icons.delete, color: Colors.white),
                      ],
                    ),
                  ),
                  onDismissed: (_) => _removerComDesfazer(filme, indexReal),
                  child: GestureDetector(
                    onTap: () => _abrirDetalhe(filme),
                    child: Cartao(filme: filme),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 32.0, right: 12.0),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
              side: const BorderSide(color: Colors.black38),
            ),
            backgroundColor: Colors.white,
            onPressed: _abrirCadastro,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
