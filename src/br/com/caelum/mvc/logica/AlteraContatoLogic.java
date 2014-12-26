package br.com.caelum.mvc.logica;

import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.caelum.jdbc.dao.ContatoDao;
import br.com.caelum.jdbc.modelo.Contato;

public class AlteraContatoLogic implements Logica {
	
	// fabio
		@Override
		public String  executa(HttpServletRequest req, HttpServletResponse resp)
				throws Exception {
			
			// buscando os parametros no request
			String numero = req.getParameter("id");
			String nome = req.getParameter("nome");
	        String endereco = req.getParameter("endereco");
	        String email = req.getParameter("email");
	        String dataEmTexto = req.getParameter("dataNascimento");
	        
	        Calendar dataNascimento = null;
			// fazendo conversão de data
	        try {
	            Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
	            dataNascimento = Calendar.getInstance();
	            dataNascimento.setTime(date);
	        } catch (Exception e) {        
	        	dataNascimento= null;
	        }	        
	        // monta um objeto contato
			Contato contato = new Contato();
			contato.setNome(nome);
			contato.setEndereco(endereco);
			contato.setEmail(email);		
			contato.setDataNascimento(dataNascimento);
		
			// salva o contato
			//capitulos 10.4 10.5
			Connection connection = (Connection) req.getAttribute("conexao");
			ContatoDao dao = new ContatoDao(connection);
			
			Long id = Long.parseLong(numero);
			contato.setId(id);
			dao.altera(contato);			
			
			return "/WEB-INF/jsp/contato-alterado.jsp";
			
			// RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/lista-contatos.jsp");
			// rd.forward(req, resp);		
		}

	}