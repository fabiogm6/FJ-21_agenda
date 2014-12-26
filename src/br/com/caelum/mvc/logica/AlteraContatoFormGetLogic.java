package br.com.caelum.mvc.logica;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;


public class AlteraContatoFormGetLogic implements Logica {
	
	@Override
	public String executa(HttpServletRequest request,
			HttpServletResponse response) {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		//capitulos 10.4 10.5
		Connection connection = (Connection) request.getAttribute("conexao");
		ContatoDao dao = new ContatoDao(connection);
		
		// antes do capitulo 10.4 ficava assim: ContatoDao dao = new ContatoDao();
		Contato contato = dao.getContato(id);		
		request.setAttribute("nome", contato.getNome());
		request.setAttribute("id", contato.getId());
		request.setAttribute("email", contato.getEmail());
		request.setAttribute("endereco", contato.getEndereco());
		String strDataNascimento;
    	try {
    		strDataNascimento = new SimpleDateFormat("dd/MM/yyyy").format(contato.getDataNascimento().getTimeInMillis());
        	}
    	 catch (Exception e) {
    		 strDataNascimento = "";    		 
        }
    	request.setAttribute("dataNascimento", strDataNascimento);
		return "/WEB-INF/jsp/altera-contato.jsp";
	}

}