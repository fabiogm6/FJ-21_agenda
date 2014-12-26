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

public class AdicionaContatoLogic implements Logica {
	
// fabio
	@Override
	public String  executa(HttpServletRequest req, HttpServletResponse resp)
			throws Exception {
		
		// buscando os parametros no request
		String nome = req.getParameter("nome");
        String endereco = req.getParameter("endereco");
        String email = req.getParameter("email");
        String dataEmTexto = req.getParameter("dataNascimento");        
        dataEmTexto = dataEmTexto.trim();
        System.out.println("dataEmTexto:'"+dataEmTexto+"'");
        Calendar dataNascimento = null;
		// fazendo conversão de data
        try {
            Date date = new SimpleDateFormat("dd/MM/yyyy").parse(dataEmTexto);
            dataNascimento = Calendar.getInstance();
            dataNascimento.setTime(date);
        } catch (Exception e) {        
        	dataNascimento= null;
        }         
//        catch (ParseException e) {
//        System.out.println("Erro de conversão da data");
//        dataNascimento.setTime(null);
//        }
        
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
		dao.adiciona(contato);
		
		return "/WEB-INF/jsp/contato-adicionado.jsp";
		
		// RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/lista-contatos.jsp");
		// rd.forward(req, resp);		
	}

}