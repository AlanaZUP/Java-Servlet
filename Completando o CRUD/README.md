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