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