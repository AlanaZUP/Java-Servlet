package gerenciador;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listaAutores")
public class ListaAutoresServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Banco banco = new Banco();
		List<Autor> autores = banco.getListaAutores();
		
		System.out.println("Lista autores:");
		for (Autor autor : autores) {
			System.out.println(autor.getNome() + " - " + autor.getEmail());
		}
		
		request.setAttribute("autores", autores);
		RequestDispatcher rd = request.getRequestDispatcher("/formAutor.jsp");
		rd.forward(request, response);
		
	}

}
