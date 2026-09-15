# Avaliação do Projeto — Trabalho do 1º Bimestre

> Diagnóstico do repositório contra o `REQUISITOS.md`.
> Gerado em 04/09/2026 · branch `main` · último commit `ca4e32a`

## Análise estática

| Projeto | Comando | Resultado |
|---|---|---|
| Parte 1 | `dart analyze` | **Nenhum issue** |
| Parte 2 | `flutter analyze` | **3 `info`** (`avoid_print`), nenhum `error` — passa no critério |

## Porcentagem de conclusão

| Escopo | % |
|---|---|
| Parte 1 (ex. 1–4) | ~97% |
| Parte 2 (ex. 5–10) | ~95% |
| **Média dos 10 exercícios (rubrica)** | **~95%** |
| **Entrega como um todo** (inclui README/tabela) | **~70%** |

A diferença entre 95% e 70% é o `readme.md` da raiz: ele está **com 0 bytes**. O enunciado é
explícito — "Sem a tabela, o trabalho não é corrigido". Hoje, o código valeria ~95%, mas a
entrega valeria 0.

## Exercício por exercício

| # | Exercício | Situação | Nota estimada |
|---|---|---|---|
| 1 | Entidade principal | `LongaMetragem` com parâmetros nomeados + `required`, 5 tipos diferentes | 100% |
| 2 | Herança | `Animacao extends`, `super.`, `@override ficha()`, bloco `[2]` com as duas linhas | 100% |
| 3 | Composição | `List<LongaMetragem>` + `adicionar()` ok; bloco `[3]` **não imprime a contagem** e o README não justifica "tem um" vs "é um" | 90% |
| 4 | Encapsulamento | `_historico` privado + getter calculado `mediaAvaliacao`, antes/depois no bloco `[4]`, total no topo da tela | 100% |
| 5 | Estrutura de tela | `Scaffold` + `MinhaAppBar`, `Column` com os dois alinhamentos, `Expanded` na `ListView` | 100% |
| 6 | Cartão | `Cartao` em arquivo próprio, `Container` + `BoxDecoration` com borda e sombra | 100% |
| 7 | Lista dinâmica | `ListView.builder` com `itemCount`/`itemBuilder` vindos do agrupador, abre com 6 itens | 100% |
| 8 | Navegação | `Navigator.push` + `MaterialPageRoute` + objeto pelo construtor ok, mas **a evidência falha** (ver pendência 3) | 80% |
| 9 | Entrada de dados | `TextFormField` + `TextEditingController` + `InputDecoration` + `dispose()`, mas **4 campos** onde o limite é 3 | 90% |
| 10 | Estado | `StatefulWidget`, `setState`, `adicionar()`, total recalcula sozinho | 100% |

## O que falta terminar — em ordem de prioridade

### 1. README da raiz — BLOQUEANTE

`readme.md` está vazio (0 bytes). Precisa conter:

- [ ] Integrantes
- [ ] Declaração do domínio (Filme / Histórico de Avaliação) em uma frase
- [ ] Justificativa de por que a relação é **composição** e não herança
- [ ] **Tabela de rastreio** com arquivo e linha reais dos 10 exercícios

Os READMEs de `parte1_dart/` e `parte2_flutter/` não substituem — o enunciado pede na raiz.

### 2. `exit(400)` dentro do app Flutter — RISCO DE APRESENTAÇÃO

Em `parte2_flutter/lib/models/historico_avaliacao.dart:26` e `:72`, `validarItem` falso chama
`exit(400)` — **o aplicativo fecha**. Como o cadastro usa `int.tryParse(...) ?? 0` para a duração,
qualquer duração vazia ou inválida derruba o app na frente da turma.

Além disso, os `Exception("...")` estão apenas sendo **construídos**, nunca lançados nem exibidos —
não fazem absolutamente nada.

**Correção:** retornar o erro para a tela e mostrar um `SnackBar`, em vez de encerrar o processo.

### 3. Evidência do exercício 8

A tela de detalhe foi descontinuada e o cadastro é reutilizado em modo leitura. A decisão em si é
defensável, mas a tela em modo visualização mostra **exatamente os mesmos dados do cartão**
(nome, autor, duração, nota, gêneros). O exercício exige **pelo menos dois dados que não aparecem
na lista**.

**Saída mais barata:** exibir `dataAvaliacao` e mais um campo (técnica de animação, ou sinopse/ano,
se acrescentar ao modelo) apenas no modo visualização.

### 4. Limite de três campos no exercício 9

`parte2_flutter/lib/screens/cadastro_cartao_page.dart` tem 4 `TextFormField` (nome, autor, duração,
nota). Deixe 3 e dê valor padrão ao quarto — o enunciado autoriza isso explicitamente
("os demais atributos podem receber valor padrão").

### 5. Bloco `[3]` da Parte 1

`historico.listar()` imprime a `ficha()` completa de cada filme. O formato pedido é:

```
Histórico "X" contém N filmes:
  - Cidade de Deus
  - Tropa de Elite
```

É pouca coisa e vale os 10% que faltam no exercício 3.

### 6. Detalhes menores de estrutura

- `bin/parte1_dart.dart` deveria ser `bin/main.dart` — o enunciado nomeia o arquivo.
- Pastas com `_` em vez de `-` (`parte1_dart` vs `parte1-dart`). Nome de pacote Dart não aceita
  hífen, então é justificável; vale mencionar isso no README.
- `parte2_flutter/lib/screens/descontinuado_detalhe_cartao_page.dart` é código morto, não roteado.
  Apague ou reative como a tela de detalhe (ver pendência 3).
- Os models divergiram entre as partes (a Parte 2 ganhou `enums/genero.dart`, `editar`, `remover`,
  `filmes`). É tolerado pelo enunciado ("vale a da Parte 2"), mas sincronizar deixa a apresentação
  mais limpa.
- **Bug latente:** `avaliar()` em `longa_metragem.dart:23` tem a condição invertida — aceita nota
  fora da faixa e rejeita nota válida. Nenhum exercício cobra, mas tem cara de pergunta dos
  minutos 4–5.
- Os 3 avisos `avoid_print` somem trocando os `print` do model por retorno/exceção — resolve junto
  com a pendência 2.

### 7. Dados de placeholder na Parte 1

`nome: 'filme teste'`, `autor: 'Leonardo'` nos blocos `[1]` e `[2]`. Funciona, mas usar títulos
reais (como a Parte 2 já faz) apresenta muito melhor.

## Resumo

Fazendo as pendências **1 a 4**, o projeto sai de ~70% para ~98% de entrega.
A pendência **1**, sozinha, é a que zera o trabalho.

## Checklist do enunciado — estado atual

- [x] `dart analyze` e `flutter analyze` sem nenhum `error`
- [ ] A tabela de rastreio está no `README.md`, com arquivos e linhas reais
- [x] O relatório da Parte 1 imprime os quatro blocos numerados, em ordem
- [x] O bloco `[4]` mostra o total antes e depois de adicionar um item, com valores diferentes
- [x] O aplicativo abre já com os seis itens na lista, sem passo intermediário
- [x] O total aparece no topo da tela de lista
- [ ] A tela de cadastro tem no máximo três campos
- [x] O item cadastrado aparece na lista e o total muda, sem reiniciar o aplicativo
- [ ] O repositório está público e o link foi postado no Moodle
- [ ] Sabe explicar qualquer um dos dez exercícios
