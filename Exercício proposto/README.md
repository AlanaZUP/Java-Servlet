# Formulário de proposta de solução - Java Servlet: Fundamentos da programação Web Java


Mais na frente, aqui no treinamento, você vai trabalhar num projeto que simula uma editora de livros. Neste projeto vai ser necessário que você cadastre numa lista em memória um novo autor(a). Cada autor(a) tem um nome e um email. Imagine que você precisa fazer isso usando o conhecimento que você adquiriu no curso de servlets. Descreva aqui como seria a solução e o motivo associado a cada passo. 

Importante: Você não precisa criar esse código no seu editor de código. Apenas deixe aqui os passos que faria na implementação. 

Para te ajudar: Qual classe você criaria? De quem ela herdaria? Qual método você vai sobrescrever? Vai usar um get ou um post para receber os dados? Qual redirecionamento vai utilizar? E claro que você deve acrescentar todo o resto para completar a funcionalidade.

### Minha Solução

- Pensando no fluxo desse programa, ao realizar um cadastro, eu devo atualizar minha lista de autores cadastrados, para isso, eu irei realizar uma requisição POST que cadastra esse autor e como resposta redirecionarei para o Servlet que aceita o GET e me retorna a lista de autores.

- Primeiro eu vou implementar duas classes, uma para ser o modelo dos dados dos Autores, e outra para simular um banco de dados.

- Minha classe Autor terá 3 atributos, "private Integer id" que será o identificador do meu autor, "private String nome" que guardará o nome do meu autor e "private String email" que guardará o email desse autor, todas com os repectivos getters e setters.

- Minha classe Banco terá 2 atributos, "private static List<Autor> listaAutores = new ArrayList<Autor>();" que guardará a lista de autores cadastrado e "private static Integer sequencial = 1" que implementará a lógica de id automático. Adicionarei também os métodos: "public void addAutor(Autor autor)" que irá receber um autor, adicionar o id referente a ele "autor.setId(sequencial++);", e adicionar na minha lista de autores atual; e o método "public List<Autor> getListaAutores()" que retornar a minha lista atual de autores;

- Agora é necessário implementar um formulário que permita enviar esses dados para nosso servidor. Esse será um formulário do tipo jsp, além das tags básicas do HTML -> "html", "body", irei adicionar a tag "form" com o atributo "action="/gerenciador/novoAutor"" que informa para qual endereço eu devo fazer a requisição e o atributo "method="post"" que informará qual o tipo de requisição. Dentro do "form" terá também 3 tags "input", uma "<input type="text" name="nome">" para guardar o nome do Autor, "<input type="email" name=email>" para guardar o email do autor e "<input type="submit">" para finalizar e enviar a requisição POST para o endereço.  

- Feito isso irei implementar o Servlet que recebe essa requisição de POST para cadastrar um autor. Esse Servlet será uma classe que extende a classe "HttpServlets" e irá sobrescrever o método "doPost" que recebe requisições do tipo POST, ele possui dois parâmetros referentes ao request e response da requisição. Para informar o endereço da URL referente ao meu Servlet, irei colocar a seguinte tag "@WebServlet("/novoAutor")". Pronto, agora quando o formulário enviar um requisição eu receberei nesse meu Servlet. O request me permitirá acessar os dados enviados pelo formulário, "String paramNome = request.getParameter("nome");" irá guardar o valor digitado pelo usuário no campo "nome" e "String paramEmail = request.getParameter("email");" irá guardar o valor digitado pelo usuário no campo email. Agora eu posso instanciar uma variável Autor que receberá esses dados nome e email -> "Autor autor = new Autor();", "autor.setNome(paramNome);", "autor.setEmail(paramEmail);". Com a minha variável autor criada, eu irei guardar ele no meu Banco simulado, para isso devo instanciar meu banco e adicionar esse meu autor -> "Banco banco = new Banco();", "banco.addAutor(autor);". Com o autor cadastrado, agora eu irei redirecionar para meu Servlet que retorna os autores cadastrado -> "response.sendRedirect("/gerenciador/listaAutores");"

- Como o foco da questão é apenas no POST, não irei abordar a implementação de como listar os autores, mas caso queira verificar, eu implementei essa funcionalidade no repositório do programa [https://github.com/AlanaZUP/Java-Servlet/tree/master/Exerc%C3%ADcio%20proposto](https://github.com/AlanaZUP/Java-Servlet/tree/master/Exerc%C3%ADcio%20proposto); 

<br>

### Solução especialista
Criar a classe NovoAutorServlet e fazer ela herdar de HttpServlet.
Motivo da escolha: É necessário herdar dessa classe para obedecer a interface pública esperada pela implementação da especificação de Servlets. Por exemplo o tomcat.
Criar o método doPost para receber os dados .
Motivo da escolha: Porque eu quero garantir que essa servlet só aceite requisição do tipo post
Acessar os valores que vieram nos parâmetros e em função deles criaria o novo objeto autor. É necessário fazer este processo de conversão dos dados que vieram da requisição para os objetos da nossa própria aplicação.
Criaria o atributo que representa a lista na classe NovoAutorServlet. Eu faria isso porque a instância da Servlet é única e todo valor guardado no atributo declarado nela vive enquanto o servidor estiver de pé.
Retornaria o status 302 para indicar um redirecionamento para o navegador. Aqui eu me apoio no pattern redirect after post, para prevenir o reenvio do post anterior, que causaria uma adição a mais.

<br>

### Resultado
Peso 2 -> 1: Criar uma classe que herda de HttpServlet e o motivo
Não expressei o motivo de ter herdado o HttpServlet. Do meu entendimento ao fazer a classe herda o HttpServlet, a gente indica que essa classe deve atender aos critério de um Servlet e portanto ela é um Servlet.

Peso 4 -> 4: Definir o método que chama service/doPost e o motivo
Acredito que atendi aos critérios desse item

Peso 2 -> 1: Utilização de um status de redirect e o motivo
Apesar de usado o redirect e entender o motivo, não expressei que era necessário usar o redirecionamento para o navegador de modo a evitar o reenvio de informações do POST anterior

Peso 1 -> 1: Criação da classe Autor e o motivo
Acredito que atendi aos critérios desse item

Peso 1 -> 1 : Pegar os valores dos parâmetros através do método getParameter e o motivo (apesar de aqui ser até bem direto)
Acredito que atendi aos critérios desse item
