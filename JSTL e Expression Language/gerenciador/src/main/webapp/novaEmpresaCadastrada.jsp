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