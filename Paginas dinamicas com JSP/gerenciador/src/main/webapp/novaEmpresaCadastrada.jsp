<%
	String nomeEmpresa = (String)request.getAttribute("empresa");
	System.out.println(nomeEmpresa);
%>

<html>
	<body>
	Empresa <% out.println(nomeEmpresa); %> foi cadastrada com sucesso no DB!
	</body>
</html>