package gerenciador;

import java.util.ArrayList;
import java.util.List;

public class Banco {
	
	private static List<Autor> listaAutores = new ArrayList<Autor>();
	private static Integer sequencial = 1;
	
	static {
		Autor autor1 = new Autor();
		autor1.setNome("Alana");
		autor1.setEmail("alana@email.com");
		autor1.setId(sequencial++);		

		Autor autor2 = new Autor();
		autor2.setNome("Gustavo");
		autor2.setEmail("gustavo@email.com");
		autor2.setId(sequencial++);

		listaAutores.add(autor1);
		listaAutores.add(autor2);
	}

	public List<Autor> getListaAutores() {
		return listaAutores;
	}

	public void addAutor(Autor autor) {
		autor.setId(sequencial++);
		listaAutores.add(autor);
	}
	
}
