# Páginas Dinâmicas com JSP

### Primeiro JSP

Vimos nas aulas anteiores o processo de retornar um dado no formato HTML através do Servlet. Imagine agora enviar vários formatações de HTML por esse recurso, você acha que é uma opção viável?

Para facilitar esse processo, nós temos o JSP (`Java Server Page`). O JSP é um arquivo que aceita HTML e também nos permite executar código java, facilitando nosso processo.

Vamos criar então nosso primeiro JSP:
- Junto com as pastas de `WEB-INF` e `META-INF`, crie um novo arquivo com a extensão .jsp, esse será o nosso arquivo JSP que permitirá fazer páginas mais dinâmicas.
- Ele mantém a mesma estrutura do HTML, para inserir um código Java, será necessário colocar dentro das tags `<% %>`.

```jsp
<% 
	String nomeEmpresa = "Alura";
	System.out.println(nomeEmpresa);
%>

<html>
	<body>
		Empresa <% out.println(nomeEmpresa); %> foi cadastrada!
	</body>
</html>
```

- O JSP possui a variável out por default que permite executar ações de print como no exemplo.
- Uma outra opção para facilitar a exibição de variáveis é colocar um `=` após a tag de código Java

```jsp
    <% 
	String nomeEmpresa = "Alura";
	System.out.println(nomeEmpresa);
%>

<html>
	<body>
		Empresa <%= nomeEmpresa %> foi cadastrada!
	</body>
</html>
```

### Despachando Requisição

No tópico anterior nós aprendemos a utilizar o JSP para fazer nossas páginas HTML de modo dinâmico.

Agora, nós iremos mudar nosso Servlet para que ao invés de produzir e retornar o HTML direto, ele envie essa função para o nosso JSP. Para que isso acontecer, nós precisaremos despachar a requisição para o arquivo com o HTML.
- No Servlet que cadastra uma nova empresa, você deve retirar todo retorno com HTML, nós iremos colocar o `RequestDispatcher` para fazer essa transição pro nosso arquivo JSP. Além disso, também precisamos enviar o dado que indique que a empresa foi cadastrada, iremos adicionar no nosso request um attributo que relacione com o nome cadastrado.

```java
@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		System.out.println("Cadastrando nome: " + nome);
		
		Empresa empresa = new Empresa();
		empresa.setNome(nome);
		
		Banco banco = new Banco();
		banco.adiciona(empresa);
		
		request.setAttribute("empresa", empresa.getNome());
		
		RequestDispatcher rd = request.getRequestDispatcher("/novaEmpresaCadastrada.jsp");
	
		rd.forward(request, response);
	}

}
```

- Agora só precisamos editar nosso JSP para identificar o atributo da requisição.

```jsp
<%
	String nomeEmpresa = (String)request.getAttribute("empresa");
	System.out.println(nomeEmpresa);
%>

<html>
	<body>
	Empresa <% out.println(nomeEmpresa); %> foi cadastrada com sucesso no DB!
	</body>
</html>
```

### JSP para listar empresas

Nós vimos como fazer de modo dinâmico o retorno ao cadastrar uma empresa, agora veremos como deixar dinâmico o retorno de uma lista de empresas.

Para isso, iremos modificar nosso Servlet que retorna a lista de modo que ele despache a requisição para o nosso JSP.
- No seu Servlet retire todos os comandos que criam o HTML. Usando o `RequestDispatcher` nós iremos para o JSP que fará o retorno visual com o HTML. Para enviar os dados das empresas, nós iremos criar um atributo no request.

```java
@WebServlet("/listaEmpresas")
public class ListaEmpresasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Banco banco = new Banco();
		
		request.setAttribute("empresas", banco.getEmpresas());
		
		RequestDispatcher rd = request.getRequestDispatcher("listarEmpresas.jsp");
		rd.forward(request, response);
	
	}

}
```

- Agora só precisamos criar nosso JSP de modo que ele receba essa lista de empresas e que consiga apresentá-las dinamicamente.

```jsp
<%@page import="br.com.curso.servlet.Empresa"%>
<%@page import="java.util.List"%>

<html>
	<body>
		<ul>
			<%
				List<Empresa> empresas = (List<Empresa>)request.getAttribute("empresas");
				for(Empresa empresa : empresas){
					out.println("<li>" + empresa.getNome() + "</li>");
				}
			%>
			
			<%
				for(Empresa empresa : empresas){
			%>
					<li> <%= empresa.getNome() %> </li>
			<%
				}
			%>
		</ul>
	</body>
</html>
```