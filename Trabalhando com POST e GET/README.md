# Trabalando com POST e GET

### Enviando Parâmetros

A nossa meta é criar um sistema de cadastro para empresas por meio do Servlet. Passaremos a enviar dados para nosso pequeno servidor e devolver uma confirmação de cadastro:

- Dentro de `src` vá em `Nem -> Servlet` para criar um novo Servlet.
- Na caixa de diálogo informe o nome do Servlet e o package que ele pertencerá.
- Na próxima aba é possível cadastrar e editar o mapeamento URL.
- Por fim, na última aba poderemos selecionar os métodos que podem ser previamente implementados pelo Eclipse, no caso iremos selecionar apenas `Inherited abstract methods -> service`.
- Clicando em `Finish` ele irá criar nosso Servlet:

```java
package br.com.alura.gerenciador.servlet;

import java.io.IOException;

/**
*Servlet implementation class NovaEmpresaServlet
*/
@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet { 
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws Serlvet {
        //TODO Auto-generated method stub
    }
}
``` 

- Remova os comentários.
- O `serialVersionUID` serve para que não apareça o *warning* relacionado ao Java IO, mas é opcional
- Estruture a mensagem HTML através do `PrintWriter()` e teste acionando o `System.out.println()`.

```java
package br.com.alura.gerenciador.servlet;

import java.io.IOException;

@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet { 

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws Serlvet {
        System.out.println("Cadastrando nova empresa");
        PrintWriter out = response.getWriter();
        out.println("<html><body>Empresa cadastrada com sucesso!</body></html>");
    }
}
```

- Agora iremos enviar dados a partir do navegador, para isso, depois do nome da URL, inserimos o caractere `?` que marcará o início do parâmetro, seguido do nome do parâmetro e de seu valor, caso seja necessário adicionar mais parâmetros basta adicionar o caractere `&`, exemplo `http://localhost:8080/gerenciador/novaEmpresa?nome=Teste&cnpj=123`.
- Para lermos os parâmetros utilizaremos a requisição (`request`) com o método `getParameter()`, que recebe uma string, o nome do parâmetro, e retorna uma string com o valor desse parâmetro.

```java
package br.com.alura.gerenciador.servlet;

import java.io.IOException;

@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet { 

    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws Serlvet {
        System.out.println("Cadastrando nova empresa");
        String nomeEmpresa = request.getParameter("nome");
        PrintWriter out = response.getWriter();
        out.println("<html><body>Empresa " + nomeEmpresa + " cadastrada com sucesso!</body></html>");
    }
}
```

- Feito isso vc já terá acesso ao valor do parâmetro.

<br>

### Metodos GET e POST

No tópico anterior aprendemos a ler um parâmetro, mais uma questão importante é que esse parâmetro está visível na URL `localhost:8080/gerenciador/novaEmpresa?nome=Teste`. E se tivermos muitos parâmetros, ou precisarmos enviarmos um texto? E em relação a segurança dos dados? Será que essa é a melhor forma? Bom.... iremos ver agora uma outra forma de enviar parâmetros que possa resolver essas nossas questões.

Se olharmos nas ferramentas do desenvolvedor do seu navegador, você irá reparar que a URL utiliza o método GET, ou seja, o método "receber" do inglês. A idéia do GET é exatamente essa, enviar e receber resultados, como uma pesquisa. 

Agora para realizarmos o que a gente precisa, a ação de cadastrar uma nova empresa, nós precisaremos de um novo método, o método POST. A função dele é enviar informações para serem inseridos no nosso servidor.

Agora iremos realizar essa requisição com o POST:
- No seu projeto, precisaremos criar um formulário dentro da pasta que possui as pastas `META-INF` e `WEB-INF`. Esse será o script do nosso formulário:

```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>

        <form action="/gerenciador/novaEmpresa" method="post">

            Nome: <input type="text" name="nome" />

            <input type="submit" />
        </form>

    </body>
</html>
```

- Utilizamos a tag `<form>` para criar um formulário. o atributo `action` serve para inidicar qual a URL de destino e o `method` indica qual o método da requisição.
- Em seguida temos a tag `<input>` que permite escrever um dado. Os atributos `type` indica qual o tipo de dado e `name` qual o nome do parâmetro. O ultimo `input` será para executarmos a ação de enviar os dados.


Prontinho, agora sua aplicação já faz uma requisição com o POST como forma de cadastramento.

### Apenas Post

É possível indicarmos ao nosso Servlet qual será o método que ele receberá. Para isso, em vez de sobreescrevermos o método `service`, nós devemos sobreescrever o método `doPost` para quando quisermos receber requisições do tipo POST, ou então o método `doGet` para recebermos requisição do tipo GET.

```java
@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        System.out.println("Cadastrando nova empresa");

        String nomeEmpresa = request.getParameter("nome");

        PrintWriter out = response.getWriter();
        out.println("<html><body>Empresa " + nomeEmpresa + " cadastrada com sucesso!</body></html>");
    }

}
```