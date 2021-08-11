# JSTL e Expression Language

### Conhecendo Expression Language

Além do formato do JSP visto na última aula, há uma outra opção para utilizar variáveis dinâmicas nos HTML. As `Expression Language` permitem essa dinâmica de uma forma mais fácil, apenas colocando `${ }` e dentro o nome do atributo que vc gostaria de acessar da requisição, poupando muitas linhas do nosso código.

```jsp
<html>
	<body>
	Empresa ${ empresa } foi cadastrada com sucesso no DB!
	</body>
</html>
```

### Conhecendo JSTL

Para que nós possamo fazer laços de repetição no JSP, nós precisaremos de uma biblioteca chamada JSTL (`Java Standart TagLib`), essa bilioteca contém tags que nós podemos usar para simplificar nosso código JSP.
- Para usar essa biblioteca, será necessário baixar o JAR da biblioteca JSTL por este [link](https://caelum-online-public.s3.amazonaws.com/986-servlets-parte1/05/jstl-1.2.jar). Você deve baixar este arquivo direto na sua pasta `webapp -> WEB-INF -> lib`. Feito isso nós poderemos usar essa biblioteca em nossos arquivos.
- Com a biblioteca baixada você deve importa-la no seu arquivo JSP 
```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
```

- Feito isso você poderá usar as tags da biblioteca.
- Para fazermos o laço de repetição que exibirá as empresas, usaremos a tag forEach.
```java
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
	<body>
		Listar Empresas: </br>
		<ul>
			<c:forEach items="${empresas }" var="empresa">
				<li>${empresa.nome}</li>
			</c:forEach>		
		</ul>
	</body>
</html>
```

Prontinho, agora você já tem uma página HTML dinâmica utilizando o JSP e o JSTL.

### Usando a taglib core

Falamos sobre o core, que realiza o controle de fluxo, mas na verdade a biblioteca possui mais tags com outros focos. Um exemplo é o `fmt`, que serve para a formatação de datas, números e i18n, isto é internacionalização. Teremos, ainda, mais duas sub-bibliotecas: `sql` e `xml`
Além das funções que nós vimos no tópico anterior, é possível fazer outras ações com o cor do JSTL.

Para utilizarmos o **core** e o **fmt** sempre teremos de ter as seguintes declarações no início da página:

core - controle de fluxo `<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>`

fmt - formatação/i18n (internacionalização) `<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>`

Agora vamos analisar o código do nosso arquivo em `formNovaEmpresa.jsp`. Escrever o nome do contexto no arquivo JSP não é uma boa prática, uma vez que ele pode variar e gerar problemas em outras páginas. Para lidarmos com esse fluxo dinâmico, usaremos a biblioteca Taglib, mais especificamente, a tag `<c:url />`. Nela, inseriremos o atributo value, e, em seguida, iremos inserir um único caminho possível para chegar até o Servlet.

```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/novaEmpresa" var="linkServlet" />

<html>
	<head>
		<meta charset="utf-8">
		<title>Nova Empresa</title>
	</head>
	<body>
		<form action="${linkServlet }" method="post">
			Nome: <input type="text" name="nome" />
			
			<input type="submit" />
		</form>
	</body>
</html>
```

Analisando da mesma forma o arquivo `novaEmpresaCadastrada.jsp`, veremos que quando acessamos essa página sem enviar uma empresa, ela aparece coma seguinte mensagem `Empresa cadastrada com sucesso!`. Reapre que não há nada, portanto ela devia está com uma mensagem apropriada para a situação. Para fazer isso, iremos escrever a tag `<c:if>`, e inseriremos em seu corpo a condição.Precisaremos definir a condição por meio do atributo `test`.

```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<body>
		<c:if test="${not empty empresa }">
			Empresa ${ empresa } foi cadastrada com sucesso no DB!
		</c:if>
		
		<c:if test="${empty empresa }">
			Nenhuma empresa foi cadastrada.
		</c:if>
	</body>
</html>
```

### Usando a taglib fmt

Nesta aula estudaremos a sub-biblioteca `fmt` do JSTL, que lida especificamente com formatação. Iremos implementar uma nova funcionalidade ao cadastrarmos uma empresa, a data de abertura dessa empresa. Para isso, usaremos o fmt.

- Começaremos trabalhando em `listaEmpresas.jsp`. Junto com o nome, iremos incluir também a data.
```jsp
<body>
    Lista de empresas: <br />

    <ul>
        <c:forEach items="${empresas}" var="empresa">
            <li>${empresa.nome } ${empresa.dataAbertura }</li>
        </c: forEach>
    </ul>
</body>
```

- Na classe Empresa, iremos representar a data de abertura. Usaremos o Date criando o atributo dataAbertura. Para podermos fazer um teste rápido, iremos inicializar diretamente a Date.
```java
package br.com.alura.gerenciador.servlet;

import java.util.Date;

public class Empresa { 

    private Integer id;
    private String nome;
    private Date dataAbertura = new Date();
```

- Ao fazer a requisição, você verá a lista de empresas e a data de abertura na formatação padrão. Para poder formatar, usaremos a fmt.

```jsp
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
	<body>
		Listar Empresas: </br>
		<ul>
			<c:forEach items="${empresas }" var="empresa">
				<li>${empresa.nome} <fmt:formatDate value="${empresa.dataAbertura }" pattern="dd/MM/yyyy"/> </li>
			</c:forEach>		
		</ul>
	</body>
</html>
```

