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

<br>
<br>

### Finalmente, o primeiro servlet

Ao executarmos o Tomcat, estamos iniciando uma máquina virtual que requer um método `main`. O Tomcat é um método `main` que sobre um servidor com várias classes e executa diferente ações.

<br>

O navegador possibilita realizarmos requisições para o Tomcat através do protocolo HTTP. **O protocolo HTTP funciona sempre na dinâmica requisição e resposta**. No tópico anterior aprendemos a retornar uma página estática HTML. Nossa próxima meta será gerarmos conteúdos dinâmicos, e essa será uma tarefa do Serlet.

<br>

`Servlet` é um objeto armazenado dentro do projeto pode ser chamado via protocolo HTTP.

<br>

Ao abrir uma página requisitada pelo navegador, passamos a lidar com os Servlets, um objeto especial executado para gerar uma resposta HTTP dinâmica. Logo, o Tomcat é o servidor principal, e o Servlet opera de forma semelhante e auxiliar, ele pode receber requisições e gerar resposta dinâmicas por meio do protocolo HTTP.

<br>

Nosso primeito Servlet:
- Dentro de `src` criaremos nossa classe para implementarmos o Servlet, portanto precisam  precisamos estendê-la com `extends`. O protocolo que este Servlet irá estender será o `Http`.

<br>

```java
package br.com.alura.gerenciador.servlet;

public class OiMundoServlet extends HttpServlet {

}
```

<br>

- Iremos sobrescrever o método `service()` pois esse atende um requisição HTTP

<br>

```java
package br.com.alura.gerenciador.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OiMundoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.service(req, resp);
    }
}    
```

<br>

- Simplifique o código retirando as exceções, o método e os comentários.
- Iremos fornecer um apelido URL para remeter ao nosso Servlet, para isso usaremos anotações.
- `@WebServlet` nos permitira definir o nome do Servlet através do `urlPatterns`

<br>

```java
package br.com.alura.gerenciador.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServletException;
import javax.servlet.http.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//oi
@WebServlet(urlPatterns="/oi")
public class OiMundoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) {

    }
}    
```

<br>

- Para definirmos a resposta do Servlet para o navegador, usaremos o objeto `resp` para devolvemos uma resposta com o método `getWriter()`.
- O `getWriter()` retorna um `PrintWriter`.
- Feito isso, poderemos devolver um conteúdo HTML através do método `println()`:

<br>

```java
//oi
@WebServlet(urlPattern="/oi")
public class OiMundoServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        PrintWriter out = resp.getWriter();
        out.println("<html>");
        out.println("<body>");
        out.println("oi mundo, parabens vc escreveu o primeiro servlets.");
        out.println("</body>");
        out.println("</html>");

    }
}    
```

<br>

Prontinho, agora vc já entende um pouco melhor sobre os Servlets e como criar um ;)

