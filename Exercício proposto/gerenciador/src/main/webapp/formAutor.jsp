<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/novoAutor" var="novoAutor"></c:url>

<html>
	<head>
		<title>Adiciona Autores</title>
	</head>
	<body>
		<form action="${novoAutor }" method="post">
			<div>
				Nome: <input type="text" name="nome">
			</div>
			<br>
			<div>
				Email <input type="email" name=email>
			</div>
			<br>
			<input type="submit">
		</form>
		
		<c:if test="${not empty autores }">
			<ul>
				<c:forEach items="${autores}" var="autor">
					<li>${autor.nome} - ${autor.email }</li>	
				</c:forEach>
		
			</ul>
		</c:if>
	</body>
</html>