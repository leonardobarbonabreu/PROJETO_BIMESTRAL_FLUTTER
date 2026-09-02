# Trabalho do 1º Bimestre — Programação para Dispositivos Móveis

**Turmas:** 4º ADS + 4º ESW A
**Professor:** Me. Gustavo Meneghetti Arcolezi
**Valor:** 1,9 ponto — o restante dos 3,0 pontos de trabalhos e atividades do primeiro bimestre já foi distribuído nas atividades feitas em sala
**Entrega do link no Moodle:** até 18/09/2026
**Apresentação:** em sala, em data combinada com a turma, antes de 18/09/2026

## Como funciona

O trabalho é uma lista de dez exercícios, divididos em duas partes. A **Parte 1** é Dart puro, sem Flutter: são as classes que modelam o domínio. A **Parte 2** é Flutter, e usa as classes da Parte 1 para alimentar a interface.

Essa ligação é proposital. Um aplicativo não é um conjunto de telas: é um modelo de dados com telas em cima. Se a Parte 1 estiver mal modelada, a Parte 2 fica difícil de escrever — e é isso que o trabalho pretende que vocês percebam na prática.

Cada exercício trava **um recurso obrigatório** e **um conceito obrigatório**. Resolver o exercício por outro caminho não pontua, mesmo que funcione. A restrição existe para garantir o contato com todo o vocabulário do bimestre, e não apenas com os dois ou três widgets mais confortáveis.

O trabalho pode ser feito **individualmente ou em dupla**.

> **Sobre o conteúdo ainda não dado:** alguns recursos desta lista — `TextEditingController`, `ListView.builder` e `StatefulWidget`/`setState` — só serão trabalhados nas próximas aulas. Isso é proposital: o trabalho acompanha o bimestre inteiro, não apenas o que já foi visto. Comecem pela Parte 1, que já está toda coberta, e avancem na Parte 2 conforme as aulas forem acontecendo.

### Tudo precisa ser visível

O trabalho é apresentado ao vivo, em **cinco minutos por aluno ou dupla**. Nesse tempo não cabe abrir arquivos procurando código.

Daí a regra que atravessa a lista inteira: **cada exercício precisa produzir uma evidência que apareça na tela**. A Parte 1 é demonstrada por um relatório impresso no terminal, com um bloco por exercício. A Parte 2, por uma interface em que o resultado de cada conceito está visível e rotulado.

O código continua sendo lido na correção. O que a regra evita é o exercício que existe no arquivo mas não se manifesta em lugar nenhum quando o programa roda.

## O domínio

Antes de começar, escolham **um tema** e usem o mesmo nos dez exercícios. Pode ser qualquer coisa com entidades que se relacionam: uma biblioteca, um campeonato esportivo, uma clínica veterinária, uma loja de instrumentos, uma escola de música. Evitem repetir o domínio que já usamos em aula no exercício `dart_poo` — pessoas, relacionamentos e casamentos.

O domínio precisa de **duas classes que se relacionam por composição**: uma que representa o item individual e uma que agrupa vários itens. No exemplo da biblioteca, seriam `Livro` e `Estante`. Essa dupla de classes é a espinha dorsal do trabalho — os exercícios 3, 4, 7 e 10 dependem dela.

Declarem o tema logo no início do `README.md` do repositório, com uma frase explicando quais são as entidades e como elas se relacionam.

## Entrega

A entrega é feita pelo Moodle, na forma de **um link para um único repositório do GitHub**. O repositório deve ser público e organizado assim:

```
seu-repositorio/
├── README.md              ← integrantes, domínio e tabela de rastreio
├── parte1-dart/
│   ├── pubspec.yaml
│   └── bin/
│       ├── main.dart      ← único executável, imprime o relatório
│       └── models/        ← suas classes
└── parte2-flutter/
    ├── pubspec.yaml
    └── lib/
        ├── main.dart
        ├── models/        ← as mesmas classes da Parte 1
        └── screens/
```

As classes aparecem duas vezes, uma em cada projeto. Em um projeto real isso seria resolvido com um pacote compartilhado entre os dois; aqui a cópia é aceita para não acrescentar configuração de pacote a um trabalho que tem outro objetivo. Se as duas cópias divergirem, vale a da Parte 2.

Antes de entregar, rodem `dart analyze` na Parte 1 e `flutter analyze` na Parte 2. **Entrega com erro de análise não é corrigida.** Aviso (`warning`) e sugestão (`info`) são tolerados; erro (`error`), não.

Façam commits ao longo do desenvolvimento, e não todos de uma vez na véspera. O histórico do repositório faz parte do que eu observo.

### Tabela de rastreio

O `README.md` do repositório precisa conter esta tabela preenchida. É por ela que a correção é conduzida, e é ela que orienta a apresentação. Sem a tabela, o trabalho não é corrigido.

| # | Exercício | Arquivo e linha | O que aparece na tela |
|---|---|---|---|
| 1 | Entidade principal | `parte1-dart/bin/models/livro.dart:5` | Bloco `[1]` do relatório |
| 2 | Herança | `.../models/livro_digital.dart:8` | Bloco `[2]` do relatório |
| 3 | Composição | `.../models/estante.dart:12` | Bloco `[3]` do relatório |
| 4 | Encapsulamento | `.../models/estante.dart:20` | Bloco `[4]` e o total no topo da tela de lista |
| 5 | Estrutura de tela | `parte2-flutter/lib/screens/home_page.dart:14` | AppBar e corpo da tela inicial |
| 6 | Cartão | `.../screens/widgets/cartao.dart:9` | Cada item da lista |
| 7 | Lista | `.../screens/home_page.dart:22` | Lista rolável com seis itens |
| 8 | Navegação | `.../screens/home_page.dart:30` | Toque no item abre o detalhe |
| 9 | Formulário | `.../screens/cadastro_page.dart:18` | Tela de cadastro |
| 10 | Estado | `.../screens/home_page.dart:40` | Item novo na lista e total atualizado |

Os caminhos acima usam um domínio de biblioteca como exemplo. Substituam pelos arquivos e linhas de vocês.

## Apresentação

As apresentações acontecem **antes** do prazo de entrega, em data combinada com a turma. Isso significa que o trabalho precisa estar pronto no dia em que vocês apresentam: o prazo de 18/09 é para postar o link, não para terminar o que foi apresentado incompleto. O que eu corrijo é o repositório como ele estiver em 18/09, e o histórico de commits mostra o que já existia no dia da apresentação.

Cinco minutos por aluno ou dupla, com o aplicativo já compilado e rodando **antes** de irem à frente. O tempo de compilação não é contado, mas também não é esperado: quem chegar para compilar na hora perde tempo de apresentação.

O roteiro é fixo e igual para todos:

**Minuto 1 — Parte 1.** Rodem `dart run` no terminal, com a fonte aumentada para leitura à distância. O relatório imprime os quatro blocos em ordem. Nesse momento não é preciso explicar nada, apenas deixar a saída visível.

**Minutos 2 e 3 — Parte 2.** Percorram o aplicativo nesta sequência, sem desvios:

1. Tela inicial, com a lista de seis itens e o total no topo.
2. Toque em um item, abrindo o detalhe.
3. Voltem e abram a tela de cadastro.
4. Preencham os campos e confirmem.
5. Mostrem o item novo na lista e o total já atualizado.

**Minutos 4 e 5 — Perguntas.** Serão escolhidos dois ou três pontos da tabela de rastreio, quaisquer que sejam, para explicação oral. Exemplos de perguntas que serão feitas:

- Por que essa classe herda de outra em vez de contê-la?
- O que acontece se o `setState` for removido?
- Por que `ListView.builder` e não uma `Column` com `map`?
- De onde vem o número que aparece no topo da lista, e por que ele mudou?
- O que o botão de confirmar leria se o `TextEditingController` fosse removido?

Quem fez o trabalho em dupla deve estar preparado para explicar **qualquer** exercício, não apenas os que escreveu.

## Critério de avaliação

Cada um dos dez exercícios é avaliado nesta rubrica:

| Critério | Peso |
|---|---|
| Usa corretamente o recurso obrigatório | 40% |
| Aplica corretamente o conceito obrigatório | 40% |
| Produz a evidência visível descrita no exercício | 20% |

"Usar corretamente" significa empregar o recurso para a função que ele tem, e não apenas fazê-lo aparecer no arquivo.

A nota final é a média dos dez exercícios, multiplicada por 1,9. Um exercício não entregue conta como zero nessa média.

## Regras gerais

**Autoria.** O trabalho é individual ou em dupla. Trabalhos de autores diferentes com o mesmo código são tratados como uma entrega só, e a nota é dividida entre todos os envolvidos. Reaproveitar código de terceiros é permitido desde que citado no `README.md` do repositório e desde que vocês saibam explicá-lo.

**Uso de inteligência artificial.** É permitido, e não precisa ser escondido. A regra é uma só: você responde pelo que entregou. Se usou IA e sabe explicar cada linha do que foi entregue, não há problema algum. Se não sabe explicar, o exercício é desconsiderado — exatamente como aconteceria com código copiado de qualquer outra fonte sem compreensão. A ferramenta não é proibida; entregar o que não se compreende é que não pontua.

Vale dizer o que está em jogo. Uma tela de Flutter é gerada em um único pedido a uma ferramenta dessas. O que não vem junto é a capacidade de manter, corrigir e evoluir aquele código depois — e é essa capacidade que a disciplina forma e que a apresentação mede.

**Prazo.** O link precisa estar postado no Moodle até o horário indicado no início deste documento. Não há entrega com atraso: o que não estiver postado até lá não é aceito.

**Ausência na apresentação.** Quem não apresentar não pontua, mesmo com o repositório entregue. Havendo justificativa formal, a apresentação é remarcada.

---

## Parte 1 — Dart e orientação a objetos

Esta parte é um projeto Dart puro, executado com `dart run`. Sem Flutter, sem widget, sem tela.

Os quatro exercícios são demonstrados por **uma única execução**. O `bin/main.dart` deve imprimir um relatório com quatro blocos, neste formato:

```
===== [1] ENTIDADE PRINCIPAL =====
Livro: Dom Casmurro | 256 páginas | R$ 39,90 | 1899

===== [2] HERANÇA =====
Livro comum -> ficha: "Grande Sertão, 560 páginas"
LivroDigital -> ficha: "Grande Sertão, 560 páginas, EPUB, 4.2 MB"

===== [3] COMPOSIÇÃO =====
Estante "Clássicos" contém 3 livros:
  - Dom Casmurro
  - Grande Sertão
  - Memórias Póstumas

===== [4] ENCAPSULAMENTO =====
Estante "Clássicos" -> total de páginas (calculado): 1104
Após adicionar "Iracema" (140 páginas): 1244
```

O conteúdo é o do domínio de vocês. O que é obrigatório é a estrutura: quatro blocos, numerados, com o cabeçalho antes de cada um.

### 1 — Modelagem da entidade principal
**Recurso obrigatório:** `class` com construtor de parâmetros nomeados — **Conceito obrigatório:** `required`
**Evidência:** bloco `[1]`, com os dados de um objeto

Crie a classe que representa o item individual do seu domínio, com pelo menos quatro atributos de tipos diferentes — por exemplo `String`, `int`, `double` e `DateTime`. O construtor deve usar parâmetros nomeados, com `required` nos campos obrigatórios e valor padrão nos opcionais.

Parâmetros nomeados são a forma idiomática de construir objetos em Dart quando há mais de dois campos, porque tornam a chamada legível sem depender da ordem dos argumentos. `Livro(titulo: 'Dom Casmurro', paginas: 256)` se lê sozinho; `Livro('Dom Casmurro', 256)` obriga quem lê a consultar a assinatura.

### 2 — Herança
**Recurso obrigatório:** `extends` — **Conceito obrigatório:** `super` no construtor e `@override` de um método
**Evidência:** bloco `[2]`, com a saída do mesmo método na classe pai e na classe filha, uma linha abaixo da outra

Crie uma classe que **é um tipo especializado** da classe do exercício 1, herdando dela com `extends` e acrescentando pelo menos dois atributos próprios. O construtor da filha deve repassar os campos herdados com `super`.

Além disso, a classe pai deve ter um método que devolva uma descrição do objeto — algo como `String ficha()` — e a filha deve **sobrescrevê-lo** com `@override`, acrescentando as informações que só ela tem.

O bloco `[2]` imprime a saída desse método nas duas classes, uma abaixo da outra. É essa comparação que torna a herança visível: as duas linhas partem do mesmo método, e a diferença entre elas é exatamente o que a especialização acrescentou.

Foi o que fizemos com `Casamento extends Relacionamento`. O teste para saber se a herança cabe é a frase "todo X é um Y": todo casamento é um relacionamento, então cabe. Se a frase soar estranha, o caminho certo é o exercício 3.

### 3 — Composição
**Recurso obrigatório:** atributo do tipo `List<T>` de outra classe sua — **Conceito obrigatório:** distinção entre "é um" e "tem um"
**Evidência:** bloco `[3]`, com a contagem e os itens contidos, um por linha

Crie a classe agrupadora do seu domínio: aquela que **contém** uma lista de objetos da classe do exercício 1. Foi o que fizemos com `Prato`, que tem uma `List<Ingrediente>`.

Essa classe precisa de um método para acrescentar um item à lista — algo como `void adicionar(Livro livro)`. Ele será usado no exercício 10.

No `README.md` do repositório, justifiquem em uma ou duas frases por que essa relação é composição e não herança.

A decisão entre herdar e conter é a mais frequente na modelagem de software, e errá-la produz hierarquias de classes que se tornam impossíveis de manter poucos meses depois.

### 4 — Encapsulamento
**Recurso obrigatório:** atributo privado com `_` — **Conceito obrigatório:** `get` que devolve um valor calculado
**Evidência:** bloco `[4]`, com o valor antes e depois de adicionar um item — e o mesmo valor exibido no topo da tela de lista, na Parte 2

Na classe agrupadora do exercício 3, torne a lista interna privada, prefixando o nome com `_`, e expor um **getter calculado** que devolva algo derivado dela: um total, uma média, uma contagem, uma duração somada.

O valor precisa ser calculado no momento da chamada, a partir da lista interna — não pode ser um campo guardado e atualizado à mão. O bloco `[4]` demonstra isso imprimindo o valor, adicionando um item e imprimindo de novo: se o número mudou sozinho, o getter calcula de fato.

Um getter não precisa devolver um campo armazenado. Ele pode calcular a resposta na hora, e quem o chama não percebe diferença — é justamente isso que permite mudar a implementação depois sem quebrar o código que a usa.

Uma observação sobre Dart: o `_` torna o membro privado **ao arquivo**, não à classe. Por isso outra classe declarada no mesmo arquivo continua enxergando o campo.

---

## Parte 2 — Flutter

Esta parte é um projeto Flutter. Copiem as classes da Parte 1 para `lib/models/` e usem-nas de verdade: **nenhum dado do domínio pode ser escrito direto no widget**. Rótulos de interface, como "Total" ou o título da tela, naturalmente são texto no código; o que não pode é o título de um item, seu preço ou sua descrição estarem digitados na tela em vez de virem de um objeto.

O aplicativo tem exatamente três telas: a lista, o detalhe e o cadastro. Telas adicionais não pontuam e consomem o tempo da apresentação.

A tela de lista mantém **um objeto da classe agrupadora** do exercício 3, criado já com seis itens. É dele que saem tanto a lista exibida quanto o total mostrado no topo.

### 5 — Estrutura de tela
**Recurso obrigatório:** `Scaffold` com `AppBar` — **Conceito obrigatório:** `Column` com `mainAxisAlignment` e `crossAxisAlignment`
**Evidência:** a tela inicial, com AppBar própria e o total do exercício 4 exibido no topo

Monte a tela inicial em `lib/screens/home_page.dart`, com uma `AppBar` personalizada e um corpo organizado em `Column`, definindo explicitamente os dois alinhamentos. A `Column` tem duas partes: o total no topo e a lista do exercício 7 abaixo.

Vocês vão esbarrar aqui em um erro clássico: uma `ListView` dentro de uma `Column` provoca um erro de altura sem limite, porque as duas querem crescer indefinidamente no mesmo eixo. A solução é envolver a `ListView` em um `Expanded`, que dá a ela o espaço restante da `Column`. Vale encontrar o erro antes de aplicar a correção — a mensagem que o Flutter emite nesse caso é uma das que vocês mais vão reencontrar na carreira.

Na apresentação, saibam explicar o que cada um dos dois eixos controla. Trocar um pelo outro é o engano mais frequente de quem começa com layout no Flutter.

### 6 — Cartão do item
**Recurso obrigatório:** `Container` — **Conceito obrigatório:** `BoxDecoration`
**Evidência:** cada item da lista desenhado como cartão, com fundo, borda arredondada e sombra

Crie um widget de cartão, em arquivo próprio, que receba **um** objeto do seu domínio e exiba seus dados, estilizado com `BoxDecoration`.

Extrair o cartão para um arquivo próprio não é capricho: é ele que será reaproveitado no exercício 7, e é o que permite que a lista inteira caiba em poucas linhas.

Uma armadilha conhecida: `Container` não aceita `color` e `decoration` ao mesmo tempo. A cor precisa ir dentro do `BoxDecoration`.

### 7 — Lista dinâmica
**Recurso obrigatório:** `ListView.builder` — **Conceito obrigatório:** `itemCount` e `itemBuilder` alimentados pela lista da classe agrupadora
**Evidência:** ao abrir, o aplicativo já mostra seis itens, e a lista rola

O aplicativo precisa **abrir já com os seis objetos na tela**. Sem tela de abertura, sem botão de carregar, sem lista que começa vazia: no primeiro segundo de execução a lista já deve estar cheia.

Os dados vêm do objeto agrupador, não de uma lista solta dentro do widget. Cada item reaproveita o cartão do exercício 6.

Use `ListView.builder`, e não uma `Column` com `map`. A diferença importa: o `builder` constrói apenas os itens visíveis, enquanto a `Column` constrói todos de uma vez. Com seis itens ninguém percebe; com seis mil, o aplicativo trava.

### 8 — Navegação com passagem de dados
**Recurso obrigatório:** `Navigator.of(context).push` com `MaterialPageRoute` — **Conceito obrigatório:** passagem do objeto pelo construtor da tela de destino
**Evidência:** tocar em um item abre o detalhe daquele item, com pelo menos dois dados que não aparecem na lista

Ao tocar em um item, o aplicativo abre a tela de detalhe do objeto correspondente, passado pelo construtor da tela de destino. O detalhe deve mostrar pelo menos dois dados que não aparecem no cartão da lista.

Na apresentação, toquem em um item do meio da lista, não no primeiro. É a forma mais rápida de evidenciar que o objeto está sendo passado de fato, e não fixado no código.

Este exercício é onde as duas partes do trabalho se encontram. Com a modelagem da Parte 1 bem feita, ele sai quase sozinho.

### 9 — Entrada de dados
**Recurso obrigatório:** `TextFormField` — **Conceito obrigatório:** `TextEditingController`
**Evidência:** tela de cadastro com no máximo três campos e um botão de confirmar

Crie a tela de cadastro de um novo item do domínio. **No máximo três campos** — os demais atributos podem receber valor padrão. Esse limite existe porque preencher formulário longo diante da turma consome o tempo da própria apresentação.

Cada campo precisa de um `TextEditingController`, e o botão de confirmação lê os valores através deles para construir o objeto novo. Estilizem os campos com `InputDecoration` — rótulo, ícone e borda arredondada — como fizemos no campo de CEP da `ProductPage`, na aula de 25/08.

Repare que aquele campo de CEP é um `TextField` **sem** controlador: ele aceita texto, mas o código não tem como recuperar o que foi digitado. O controlador é justamente a peça que faltava ali, e é o que este exercício acrescenta.

Atenção a um detalhe de conversão: o que o controlador devolve é sempre `String`. Campos numéricos precisam de `int.tryParse` ou `double.tryParse`, e vocês precisam decidir o que fazer quando a conversão falha.

### 10 — Estado
**Recurso obrigatório:** `StatefulWidget` — **Conceito obrigatório:** `setState`
**Evidência:** ao confirmar o cadastro, o aplicativo volta à lista, o item novo aparece e o total do topo muda

Este exercício fecha o trabalho e é o mais direto de verificar: ou o item apareceu e o total mudou, ou não.

A tela da lista precisa ser um `StatefulWidget` que guarda o objeto agrupador. Ao confirmar o cadastro, o novo item é acrescentado por meio do método `adicionar` do exercício 3, dentro de um `setState`.

Repare no encadeamento: o item entra na lista privada da classe agrupadora, a `ListView` passa a mostrar sete itens, e o getter do exercício 4 recalcula o total sozinho. Nenhuma dessas três coisas precisou ser atualizada à mão — e é exatamente por isso que o getter tinha de ser calculado, e não guardado.

O ponto conceitual é entender por que alterar a lista **fora** do `setState` não muda nada na tela: o Flutter só reconstrói a interface quando é avisado de que o estado mudou. Testem das duas formas antes da apresentação; ver a tela não reagir ensina mais do que qualquer explicação em aula.

Se vocês usaram `TextEditingController` em um `StatelessWidget` no exercício 9, este é o momento de conhecer o `dispose()`: um controlador precisa ser descartado quando o widget sai de cena, ou vaza memória.

---

## Checklist antes de entregar

Confiram estes itens na véspera, não no dia:

- [ ] `dart analyze` e `flutter analyze` sem nenhum `error`
- [ ] A tabela de rastreio está no `README.md`, com arquivos e linhas reais
- [ ] O relatório da Parte 1 imprime os quatro blocos numerados, em ordem
- [ ] O bloco `[4]` mostra o total antes e depois de adicionar um item, com valores diferentes
- [ ] O aplicativo abre já com os seis itens na lista, sem passo intermediário
- [ ] O total aparece no topo da tela de lista
- [ ] A tela de cadastro tem no máximo três campos
- [ ] O item cadastrado aparece na lista e o total muda, sem reiniciar o aplicativo
- [ ] O repositório está público e o link foi postado no Moodle
- [ ] Quem fez em dupla sabe explicar qualquer um dos dez exercícios

## Onde estudar

O material das aulas está neste mesmo repositório, nas pastas por data. Vale reabrir especialmente `dart_poo` para a Parte 1 e `20-08/hello_world_again` e `25-08/hello_world_again` para a Parte 2.

- [Documentação oficial do Dart](https://dart.dev/guides)
- [Documentação oficial do Flutter](https://docs.flutter.dev/)
- [Flutter — Catálogo de widgets](https://docs.flutter.dev/ui/widgets)
- [Flutter — Listas longas com ListView.builder](https://docs.flutter.dev/cookbook/lists/long-lists)
- [Flutter — Navegação e rotas](https://docs.flutter.dev/ui/navigation)

Dúvidas durante o desenvolvimento, procurem em aula ou pelo canal da disciplina. Perguntar cedo custa muito menos do que refazer na véspera.
