# Redirecionando o fluxo

### Quando o Dispatcher não atende

Atualmente após cadastrar uma empresa retornamos um HTML informando que foi cadastrada, agora iremos implementar de modo que logo após de cadastrar a empresa nós visualizamos uma confirmação que foi cadastrada e também a lista atual e empresas no Banco.

Para fazer isso com o que sabemos até agora, iremos mudar no nosso `NovaEmpresaServlet` o dispatch que antes era para a página `novaEmpresaCadastrada.jsp` para a página `listarEmpresa.jsp`.

```java
@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String date= request.getParameter("dataAbertura");
		Date dateAbertura = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			dateAbertura = sdf.parse(date);
		} catch (ParseException e) {
			throw new ServletException(e);
		}
		
		System.out.println("Cadastrando nome: " + nome);
		
		Empresa empresa = new Empresa();
		empresa.setNome(nome);
		empresa.setDataAbertura(dateAbertura);
		
		Banco banco = new Banco();
		banco.adiciona(empresa);
		
		request.setAttribute("empresa", empresa.getNome());
		
		RequestDispatcher rd = request.getRequestDispatcher("/listaEmpresas");
	
		rd.forward(request, response);
	}

}
```
 
Feito isso, observe que ele não retornará as empresas, pois não temos nenhum atributo empresas. 

Para resolver esse problema devemos pegar os dados guardado no nosso Banco, mas espera, nós já não temos um Servlet que faz esse processo? O Servlet `ListaEmpresasServlet` retorna todas as empresas cadastradas no nosso Banco. Portanto, em vez de implementarmos novamente esse processo, iremos aproveitar o que já foi criado e em vez de irmos para o `listarEmpresas.jsp`, vamos mandar nosso dispatch para nosso Servlet `ListaEmpresasServlet`. Ao executar você receberá o erro `405` isso acontece pois nosso `ListaEmpresasservlet` está configurado para receber apenas o método GET, e como nossa requisição é para cadastrar, logo é um POST, ele não aceita. Devemos então alterar para em vez de sobreescrever o método `doGet`, ele passe a sobreescrever o `service`, que aceitará tanto métodos POST quanto métodos GET.

```java
@WebServlet("/novaEmpresa")
public class NovaEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nome = request.getParameter("nome");
		String date= request.getParameter("dataAbertura");
		Date dateAbertura = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			dateAbertura = sdf.parse(date);
		} catch (ParseException e) {
			throw new ServletException(e);
		}
		
		System.out.println("Cadastrando nome: " + nome);
		
		Empresa empresa = new Empresa();
		empresa.setNome(nome);
		empresa.setDataAbertura(dateAbertura);
		
		Banco banco = new Banco();
		banco.adiciona(empresa);
		
		request.setAttribute("empresa", empresa.getNome());
		
		RequestDispatcher rd = request.getRequestDispatcher("/listaEmpresas");
	
		rd.forward(request, response);
	}

}

```

```java
@WebServlet("/listaEmpresas")
public class ListaEmpresasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Banco banco = new Banco();
		
		request.setAttribute("empresas", banco.getEmpresas());
		
		RequestDispatcher rd = request.getRequestDispatcher("listarEmpresas.jsp");
		rd.forward(request, response);
	
	}

}

```

Agora ele já retorna com a lista das empresas cadastradas. Mas repare que ao fazer o reload da página, ele irá registrar o dado novamente, o que é uma prática ruim para o nosso sistema.

