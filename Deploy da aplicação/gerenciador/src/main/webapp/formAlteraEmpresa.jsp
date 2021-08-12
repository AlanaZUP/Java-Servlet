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