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