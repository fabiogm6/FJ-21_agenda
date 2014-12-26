package br.com.caelum.mvc.logica;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrimeiraLogica implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		System.out.println("Executando a lógica ... ...");
		System.out.println("Primeira Lógica: Retornando o nome da página JSP ...");
		return "/WEB-INF/jsp/primeira-logica.jsp";
	
		//RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/primeira-logica.jsp");
		//rd.forward(req, res);
	
	}
} 