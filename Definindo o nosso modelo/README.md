# Definindo o nosso modelo

Nossa meta agora é criar um modelo que represente as empresas utilizando uma classe.
- Dentro do seu pacote, crie uma classe Empresa com um atributo `nome` e uma identificação `id`

``` java
package br.com.curso.servlet;

public class Empresa {
	
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	private String nome;

}

```

- Para usarmos essa classe no nosso Servlet, devemos criar uma variável do tipo Empresa, essa variável receberá como nome o valor que o servlet receberá

```java
@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nome = request.getParameter("nome");
		System.out.println("Cadastrando nome: " + nome);
		
		Empresa empresa = new Empresa();
		empresa.setNome(nome);
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("A Empresa " + nome + " foi cadastrada!");
		out.println("</body>");
		out.println("</html>");
	}

}
```

- Agora simularemos o nosso banco que armazenará essa empresa.
- Para isso, crie uma classe Banco no pacote, essa classe deverá ter um atributo que é a lista de empresa, e também terá método para adicinar uma empresa e retornar a quantidade de empresas cadastradas.

```java
package br.com.curso.servlet;

import java.util.ArrayList;
import java.util.List;

public class Banco {
	
	private static List<Empresa> lista = new ArrayList<Empresa>();
	
	public void adiciona(Empresa empresa) {
		lista.add(empresa);
	}
	
	public List<Empresa> getEmpresas(){
		return Banco.lista;
	}

}

```

- Por último, no nosso Servlet agora iremos adiiconar a função para cadastrar no banco a empresa recebida.

``` java
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
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("A Empresa " + nome + " foi cadastrada!");
		out.println("</body>");
		out.println("</html>");
	}

}
```