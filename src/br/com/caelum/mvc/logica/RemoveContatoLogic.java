package br.com.caelum.mvc.logica;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class RemoveContatoLogic implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		long id = Long.parseLong(req.getParameter("id"));
		String mnome  = req.getParameter("nome");
		Contato contato = new Contato();
		contato.setId(id);
		contato.setNome(mnome);
		
		//capitulos 10.4 10.5
		Connection connection = (Connection) req.getAttribute("conexao");
		
		ContatoDao dao = new ContatoDao(connection);
		
		dao.exclui(contato);
		
		//return "mvc?logica=ListaContatosLogic"; - funciona também
		return "/WEB-INF/jsp/contato-excluido.jsp";
		
		// o return abaixo foi mudado no exercicio 9.9
		// return "lista-contatos.jsp";
		
	}
}