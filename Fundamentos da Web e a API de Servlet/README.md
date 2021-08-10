# Fundamentos da Web e a API de Servlet

### Preparando o ambiente

Para poder realizar o curso, é essencial os seguintes itens:
- Java, no curso foi usado o Java 10, mas não tem problema de usar versões mais recentes pois o  Java trabalha com servidor e as versões recentes sempre funcionam;
- JRE ou JDK (apesar do JDK ter uma documentação mais completa, o JRE é suficiente para o curso)
- Uma IDE, no curso foi usado o Eclipse
- Apache Tomcat

Após todos os itens instalados, ao iniciar no Eclipse, vc deverá indicar o caminho para o Tomcat no seu Server, para isso, você deve seguir os seguintes passos:
- Abra o Open Perspective(geralmente se encontrar no canto direito ao lado da lupinha de pesquisa), selecione Java EE;
- No canto inferior selecione `Servers`, a terceira aba
- Clique no link para poder selecionar o Tomcat como servidor;
- Selecione sua versão do Tomcat; na próxima aba, selecione a pasta onde vc colocou o Tomcat e a versão do seu JRE;
- Ao finalizar, clique no Tomcat dentro da aba de Servers e em seguida clique na seta verde no canto intefrior direito, assim vc irá startar seu servidor

O Tomcat será o nosso servidor, ele que permitirá que nós utilizemos o HTTP, o protocolo da WEB, além disso, ele também irá gerar páginas HTML.

### Primeiro Projeto Java Web

Iremos criar um projeto com Java e associar com o servidor configurado anteriormente:

- No Eclipse, clique em `File -> New -> Dynamic Web Project`. Essa opção foi escolhida devido a complexidade de trablahar com arquivos Web, HTML, imagens.
- Irá abrir uma caixa de diálogo onde vc deverá informar o nome do Projeto em `Project Name`, qual o local do projeto `Project Location`, na opção `Target runtime` selecione a configuração do Tomcat.
- Ao clicar em `Next` veremos na área "Source folders on build path" um arquivo `src`, ele que abrigará nossas classes. O Eclipse compila para uma pasta `build/classes` por padrão.
- Clicando novamente em `Next`, encontraremos o campo `Context root` com o título do projeto, ele indica como o projeto será chamado na url. Em seguida tem o campo `Content Directory` configurado com `WebContent`, os arquivos relacionados ao mundo web. E mais abaixo você encontrará a opção `Generate web.xml deployment descriptor`, a criação de um arquivo de configuração. 
- Feito as configurações necessárias e só clicar em `Finish`.
- A próxima etapa é associar o projeto `gerenciador`ao Tomcat. Para isso devemos clicar sobre a aba `Servers` com o botão direito e selecionar a opção `Add and Remove`, a seguir selecione o projeto e clique no botão `Add`.
- Em `WebContent`, crie um novo arquivo html para podermos acessar a página a partir do navegador e o preencha com o seguinte código:

<br>

``` html
<html>
    <head>
        <title>Bem vindo</title>
    </head>

    <body>
        Bem-vindo no curso Servlets da Alura
    </body>

</html>
```

<br>

- Acessaremos a página a partir do navegador no endereço `localhost:8080/gerenciador/bem-vindo.html`

<br>

O Tomcat recebeu a chamada do navegador, a requisição, e foi passado o código que criamos no projeto.

