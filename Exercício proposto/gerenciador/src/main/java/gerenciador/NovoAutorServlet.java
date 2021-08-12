package gerenciador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/novoAutor")
public class NovoAutorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramNome = request.getParameter("nome");
		String paramEmail = request.getParameter("email");
		
		System.out.println("Adicionando Autor: " + paramNome + ", email: " + paramEmail);
		
		Autor autor = new Autor();
		autor.setNome(paramNome);
		autor.setEmail(paramEmail);
		
		Banco banco = new Banco();
		banco.addAutor(autor);
		
		response.sendRedirect("/gerenciador/listaAutores");
		
	}

}
