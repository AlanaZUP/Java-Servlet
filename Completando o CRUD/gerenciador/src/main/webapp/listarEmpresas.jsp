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