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