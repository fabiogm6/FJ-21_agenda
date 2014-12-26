package br.com.caelum.mvc.logica;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class ListaContatosLogic implements Logica {
	
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		//capitulos 10.4 10.5
		Connection connection = (Connection) req.getAttribute("conexao");
		
		List<Contato> contatos = new ContatoDao(connection).getLista();
		// antes do capitulo 10.4 ficava assim: List<Contato> contatos = new ContatoDao().getLista();
		
		req.setAttribute("contatos", contatos);
		
		return "/WEB-INF/jsp/lista-contatos.jsp";
		
	}
}