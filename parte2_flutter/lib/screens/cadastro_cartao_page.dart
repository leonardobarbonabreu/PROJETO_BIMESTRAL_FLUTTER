import 'package:flutter/material.dart';
import 'package:parte2_flutter/enums/genero.dart';
import 'package:parte2_flutter/models/animacao.dart';
import 'package:parte2_flutter/models/longa_metragem.dart';
import 'package:parte2_flutter/widgets/genero_chip.dart';
import 'package:parte2_flutter/widgets/minha_app_bar.dart';

/// Exercícios 8 e 9 — a mesma tela serve de detalhe e de cadastro.
///
/// - Aberta pela lista com [filme] preenchido e `podeEscrever: false`, ela é a
///   tela de DETALHE: mostra a duração, a data de avaliação e (nas animações)
///   estúdio e técnica — dados que o cartão da lista não exibe.
/// - Aberta pelo botão "+" sem [filme], ela é a tela de CADASTRO: exatamente
///   três campos de digitação (nome, autor e nota), como o enunciado exige.
///
/// Duração e data de avaliação nunca são digitadas. Em um filme já existente
/// elas são conservadas; em um filme novo recebem valor padrão
/// ([LongaMetragem.duracaoPadrao] e a data de hoje).
class CadastroCartaoPage extends StatefulWidget {
  /// Devolve `null` quando o filme foi aceito, ou a mensagem de erro da
  /// validação do histórico — que esta tela mostra num SnackBar.
  final String? Function(LongaMetragem) onSalvar;
  final LongaMetragem? filme;
  final bool podeEscrever;

  const CadastroCartaoPage({
    super.key,
    required this.onSalvar,
    this.filme,
    required this.podeEscrever,
  });

  @override
  State<CadastroCartaoPage> createState() => _CadastroCartaoPageState();
}

class _CadastroCartaoPageState extends State<CadastroCartaoPage> {
  // Exercício 9 — um TextEditingController por campo. É por eles que o botão
  // de confirmar lê o que foi digitado.
  final _nomeController = TextEditingController();
  final _autorController = TextEditingController();
  final _notaController = TextEditingController();

  /// Gêneros marcados no formulário. Um Set porque cada gênero está apenas
  /// marcado ou não, sem repetição.
  final Set<Genero> _generosSelecionados = {};

  bool get _editando => widget.filme != null;

  late bool _podeEscrever;

  @override
  void initState() {
    super.initState();

    _podeEscrever = widget.podeEscrever;

    final filme = widget.filme;
    if (filme != null) {
      _nomeController.text = filme.nome;
      _autorController.text = filme.autor;
      _notaController.text = filme.avaliacao.toString();
      _generosSelecionados.addAll(filme.generos);
    }
  }

  @override
  void dispose() {
    // Um controlador precisa ser descartado quando o widget sai de cena,
    // ou vaza memória.
    _nomeController.dispose();
    _autorController.dispose();
    _notaController.dispose();

    super.dispose();
  }

  InputDecoration _decoracaoCampo(String rotulo, IconData icone) {
    return InputDecoration(
      labelText: rotulo,
      prefixIcon: Icon(icone),
      prefixIconColor: _podeEscrever
          ? const Color(0xFF607D8B)
          : const Color.fromARGB(255, 155, 179, 192),
      // filled + fillColor valem também no estado desabilitado, então o campo
      // continua branco no modo somente-leitura.
      filled: true,
      fillColor: Colors.white,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }

  /// Linha somente-leitura para os dados que não são digitados.
  Widget _infoLinha(IconData icone, String rotulo, String valor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icone, size: 20, color: const Color(0xFF607D8B)),
          const SizedBox(width: 12),
          Text('$rotulo: ', style: const TextStyle(color: Colors.black54)),
          Expanded(
            child: Text(
              valor,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  /// Monta o objeto do domínio a partir dos controladores.
  ///
  /// O que o controlador devolve é sempre String: a nota passa por
  /// `double.tryParse`, e uma conversão falha vira 0, que a validação do
  /// histórico recusa com mensagem própria.
  LongaMetragem _montarFilme() {
    final original = widget.filme;

    final nome = _nomeController.text.trim();
    final autor = _autorController.text.trim();
    final nota =
        double.tryParse(_notaController.text.trim().replaceAll(',', '.')) ?? 0;
    final generos = _generosSelecionados.toList();

    final duracao = original?.duracao ?? LongaMetragem.duracaoPadrao;
    final dataAvaliacao = original?.dataAvaliacao ?? DateTime.now();

    // Editar uma animação precisa devolver uma animação, ou a técnica e o
    // estúdio se perderiam na troca.
    if (original is Animacao) {
      return Animacao(
        nome: nome,
        autor: autor,
        duracao: duracao,
        avaliacao: nota,
        generos: generos,
        dataAvaliacao: dataAvaliacao,
        tecnicaDeAnimacao: original.tecnicaDeAnimacao,
        estudio: original.estudio,
      );
    }

    return LongaMetragem(
      nome: nome,
      autor: autor,
      duracao: duracao,
      avaliacao: nota,
      generos: generos,
      dataAvaliacao: dataAvaliacao,
    );
  }

  void _confirmar() {
    final erro = widget.onSalvar(_montarFilme());

    if (erro != null) {
      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.shade700,
            content: Text(erro, style: const TextStyle(color: Colors.white)),
          ),
        );
      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // Editando, oferece todos os gêneros para marcar; apenas visualizando,
    // mostra só os do filme.
    final generosVisiveis =
        _podeEscrever ? Genero.values : _generosSelecionados.toList();

    final filme = widget.filme;

    return Scaffold(
      appBar: MinhaAppBar(
        titulo: !_editando
            ? 'Cadastrar filme'
            : (_podeEscrever ? 'Editar filme' : 'Visualizar filme'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // --- Campo 1 de 3 ---
            TextFormField(
              enabled: _podeEscrever,
              controller: _nomeController,
              decoration: _decoracaoCampo('Nome', Icons.movie),
            ),
            const SizedBox(height: 16),
            // --- Campo 2 de 3 ---
            TextFormField(
              enabled: _podeEscrever,
              controller: _autorController,
              decoration: _decoracaoCampo('Autor', Icons.person),
            ),
            const SizedBox(height: 16),
            // --- Campo 3 de 3 ---
            TextFormField(
              enabled: _podeEscrever,
              controller: _notaController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: _decoracaoCampo('Nota (0 a 10)', Icons.star),
            ),
            const SizedBox(height: 24),

            // Exercício 8 — dados que NÃO aparecem no cartão da lista.
            if (filme != null) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Ficha técnica',
                    style: TextStyle(color: Colors.black54)),
              ),
              const SizedBox(height: 8),
              _infoLinha(Icons.alarm, 'Duração', '${filme.duracao} min'),
              _infoLinha(Icons.event, 'Data de avaliação', filme.dataFormatada),
              if (filme is Animacao) ...[
                _infoLinha(Icons.animation, 'Técnica de animação',
                    filme.tecnicaDeAnimacao.descricao),
                _infoLinha(Icons.apartment, 'Estúdio', filme.estudio),
              ],
              const SizedBox(height: 8),
            ] else
              // Cadastro novo: deixa explícito o que recebe valor padrão.
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Duração (${LongaMetragem.duracaoPadrao} min) e data de '
                    'avaliação (hoje) recebem valor padrão.',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                ),
              ),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Gêneros', style: TextStyle(color: Colors.black54)),
            ),
            const SizedBox(height: 8),
            // O Align estica na largura toda; sem ele o Wrap encolhe até o
            // tamanho dos chips e a Column o centraliza.
            Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 4,
                children: generosVisiveis.map((genero) {
                  return GeneroChip(
                    genero: genero,
                    selecionado: _generosSelecionados.contains(genero),
                    // Sem callback o GeneroChip vira um Chip estático: o modo
                    // somente-leitura sai de graça.
                    onSelecionar: _podeEscrever
                        ? (marcado) => setState(() {
                              marcado
                                  ? _generosSelecionados.add(genero)
                                  : _generosSelecionados.remove(genero);
                            })
                        : null,
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: _podeEscrever,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 48,
                  width: 128,
                  child: ElevatedButton(
                    onPressed: _confirmar,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _editando ? Colors.blue : Colors.white,
                      side: const BorderSide(color: Colors.black38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      _editando ? 'Alterar' : 'Cadastrar',
                      style: TextStyle(
                        color: _editando ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Visibility(
        visible: _editando,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 32.0, right: 12.0),
          child: SizedBox(
            width: 70,
            height: 70,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(color: Colors.black38),
              ),
              onPressed: () => setState(() => _podeEscrever = !_podeEscrever),
              child: _podeEscrever
                  ? const Icon(Icons.visibility_outlined)
                  : const Icon(Icons.edit),
            ),
          ),
        ),
      ),
    );
  }
}
