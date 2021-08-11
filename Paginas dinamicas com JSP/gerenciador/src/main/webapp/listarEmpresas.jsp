<%@page import="br.com.curso.servlet.Empresa"%>
<%@page import="java.util.List"%>

<html>
	<body>
		<ul>
			<%
				List<Empresa> empresas = (List<Empresa>)request.getAttribute("empresas");
				for(Empresa empresa : empresas){
					out.println("<li>" + empresa.getNome() + "</li>");
				}
			%>
			
			<%
				for(Empresa empresa : empresas){
			%>
					<li> <%= empresa.getNome() %> </li>
			<%
				}
			%>
		</ul>
	</body>
</html>