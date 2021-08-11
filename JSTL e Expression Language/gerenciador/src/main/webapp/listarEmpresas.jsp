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