package br.com.caelum.jdbc.teste;

import java.text.DateFormat;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class TestaLista {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ContatoDao dao = new ContatoDao();
		
		List<Contato> contatos = dao.getLista();

		for (Contato contato : contatos) {
			System.out.println("Nome: " + contato.getNome());
			System.out.println("Email: " + contato.getEmail());
			System.out.println("Endereço: " + contato.getEndereco());
			System.out.println("Data de Nascimento: "
					+ contato.getDataNascimento().getTime() );			
			System.out.println("Ano de Nascimento: "
					+ contato.getDataNascimento().get(Calendar.YEAR) );
			
			DateFormat f = DateFormat.getDateInstance(DateFormat.FULL);
			System.out.println(f.format(contato.getDataNascimento().getTime()));

			f = DateFormat.getDateInstance(DateFormat.MEDIUM);
			System.out.println(f.format(contato.getDataNascimento().getTime()));
		
			f = DateFormat.getDateInstance(DateFormat.SHORT);
			System.out.println(f.format(contato.getDataNascimento().getTime()));
			System.out.println("-----------");
		}
	}

}
