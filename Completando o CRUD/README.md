# Completando o CRUD

### Apresentando as funcionalidades

<br>

|       |  |       
| :---        |    :----   |   
| **C**reate | criação do registro/objeto |
| **R**ead | leitura de registro(s), objeto(s) |
| **U**pdate | atualizar registro/objeto |
| **D**elete | remover ergistro/objeto |

<br>

### Removendo empresa

Iremos agora adicionar a funcionalidade para editar uma empresa.

Para isso, ao retornar todas as empresas no nosso `listarEmpresas.jsp` devemos adicionar um link que execute essa ação de `editar`. Ao executar essa ação, ele deve enviar uma identificação da empresa que deve ser editada, e irá nos encaminhar para um formulário já preenchido com as informações atuais da empresa. Devemos então criar um Servlet que realize essa visualização com os dados a serem executados, vamos chamá-lo de `MostraEmpresaServlet`, ele receberá a identificação da empresa que será editada e retornar uma visualização com os dados dessa empresa. Para isso ele fará um dispatch para o formulário que possua essas informações. Ao submeter o formulário, ele deverá ir para um Servlet que realmente fará essa edição na empresa.

```java
@WebServlet("/alteraEmpresa")
public class AlteraEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Alterando emrpesa");
		
		String nome = request.getParameter("nome");
		String date= request.getParameter("dataAbertura");
		Integer id = Integer.valueOf(request.getParameter("id"));
		
		Date dateAbertura = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			dateAbertura = sdf.parse(date);
		} catch (ParseException e) {
			throw new ServletException(e);
		}
		
		Banco banco = new Banco();
		Empresa empresa = banco.buscaEmpresaPeloId(id);
		empresa.setNome(nome);
		empresa.setDataAbertura(dateAbertura);
		
		response.sendRedirect("listaEmpresas");
	}

}
```

```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:url value="/alteraEmpresa?id=${empresa.id }" var="linkServlet" />

<html>
	<head>
		<meta charset="utf-8">
		<title>Nova Empresa</title>
	</head>
	<body>
		<form action="${linkServlet }" method="post">
			Nome: <input type="text" name="nome" value="${empresa.nome }"/>
			Data Abertura: <input type="text" name="dataAbertura" value="<fmt:formatDate value="${empresa.dataAbertura }" pattern="dd/MM/yyyy"/>">
			<input type="hidden" name="id" value="${empresa.id }">
			<input type="submit" />
		</form>
	</body>
</html>
```

```java
@WebServlet("/mostraEmpresa")
public class MostraEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String paramId = request.getParameter("id");
		Integer id = Integer.valueOf(paramId);
		
		Banco banco = new Banco();
		
		Empresa empresa = banco.buscaEmpresaPeloId(id);
		
		System.out.println(empresa.getNome());
		
		request.setAttribute("empresa", empresa);
		
		RequestDispatcher rd = request.getRequestDispatcher("/formAlteraEmpresa.jsp");
		rd.forward(request, response);
	
	}

}
```


```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
	<body>
		Listar Empresas: </br>
		<ul>
			<c:forEach items="${empresas }" var="empresa">
			
				<c:url value="/removeEmpresa?id=${empresa.id}" var="removeEmpresa"></c:url>
				<c:url value="/mostraEmpresa?id=${empresa.id}" var="mostraEmpresa"></c:url>
				<li>
					${empresa.id } - ${empresa.nome}  <fmt:formatDate value="${empresa.dataAbertura }" pattern="dd/MM/yyyy"/> 
					<a href="${mostraEmpresa }">edita</a>
					<a href="${removeEmpresa }">Remover</a>
				</li>
			</c:forEach>		
		</ul>
	</body>
</html>
```

Para remover nossa empresa iremos  implementaremos um método que irá excluir do nosso Banco, portanto esse método será criado dentro do nosso Banco.

```java

	public void removeEmpresa(Integer id) {
		
		Iterator<Empresa> it = lista.iterator();
		
		while(it.hasNext()) {
			Empresa emp = it.next();
			if (emp.getId() == id) {
				it.remove();
			}
		}
		
	}
```

Perfeito, agora só falta implementar nosso Servlet que irá executar a ação de deletar a empresa. Devemos então criar no nosso package principal um Servlet `RemoveEmpresServlet`, ele irá sobreescrever o método `doGet()`.

```java
@WebServlet("/removeEmpresa")
public class RemoveEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramId = request.getParameter("id");
		Integer id = Integer.valueOf(paramId);
		
		Banco banco = new Banco();
		banco.removeEmpresa(id);
		
		response.sendRedirect("listaEmpresas");
	
	}

}

```

Prontinho, agora já podemos excluir uma empresa do nosso banco de dados.

<br>

### Formulário de alteração

Iremos agora adicionar a funcionalidade para remover uma empresa.

Para isso, ao retornar todas as empresas no nosso `listarEmpresas.jsp` devemos adicionar um link que execute essa ação de `remover`. Ao executar essa ação, ele deve enviar uma identificação da empresa que deve ser excluída, utilizaremos com identificador o Id da empresa. Devemos então construir a regra que irá criar automaticamente esse identificador para cada empresa cadastrada, logo essa função será criada dentro dos métodos que adicionam a empresa no banco.

```java
	private static Integer chaveSequencial = 1;
	
	static {
		Empresa empresa1 = new Empresa();
		empresa1.setNome("ZUP");
		empresa1.setId(chaveSequencial++);

		Empresa empresa2 = new Empresa();
		empresa2.setNome("Alura");
		empresa2.setId(chaveSequencial++);
		
		lista.add(empresa1);
		lista.add(empresa2);
	}
	
	public void adiciona(Empresa empresa) {
		empresa.setId(chaveSequencial++);
		lista.add(empresa);
	}
```

```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
	<body>
		Listar Empresas: </br>
		<ul>
			<c:forEach items="${empresas }" var="empresa">
			
				<c:url value="/removeEmpresa?id=${empresa.id}" var="removeEmpresa"></c:url>
				<li>
					${empresa.id } - ${empresa.nome}  <fmt:formatDate value="${empresa.dataAbertura }" pattern="dd/MM/yyyy"/> 
					<a href="${removeEmpresa }">Remover</a>
				</li>
			</c:forEach>		
		</ul>
	</body>
</html>
```

Para remover nossa empresa iremos  implementaremos um método que irá excluir do nosso Banco, portanto esse método será criado dentro do nosso Banco.

```java

	public void removeEmpresa(Integer id) {
		
		Iterator<Empresa> it = lista.iterator();
		
		while(it.hasNext()) {
			Empresa emp = it.next();
			if (emp.getId() == id) {
				it.remove();
			}
		}
		
	}
```

Perfeito, agora só falta implementar nosso Servlet que irá executar a ação de deletar a empresa. Devemos então criar no nosso package principal um Servlet `RemoveEmpresServlet`, ele irá sobreescrever o método `doGet()`.

```java
@WebServlet("/removeEmpresa")
public class RemoveEmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramId = request.getParameter("id");
		Integer id = Integer.valueOf(paramId);
		
		Banco banco = new Banco();
		banco.removeEmpresa(id);
		
		response.sendRedirect("listaEmpresas");
	
	}

}

```

Prontinho, agora já podemos excluir uma empresa do nosso banco de dados.