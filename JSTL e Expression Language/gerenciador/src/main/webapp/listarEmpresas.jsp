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