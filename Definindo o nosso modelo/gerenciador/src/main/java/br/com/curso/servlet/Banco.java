package br.com.curso.servlet;

import java.util.ArrayList;
import java.util.List;

public class Banco {
	
	private static List<Empresa> lista = new ArrayList<Empresa>();
	
	static {
		Empresa empresa1 = new Empresa();
		empresa1.setNome("ZUP");

		Empresa empresa2 = new Empresa();
		empresa2.setNome("Alura");
		
		lista.add(empresa1);
		lista.add(empresa2);
	}
	
	public void adiciona(Empresa empresa) {
		lista.add(empresa);
	}
	
	public List<Empresa> getEmpresas(){
		return Banco.lista;
	}

}
