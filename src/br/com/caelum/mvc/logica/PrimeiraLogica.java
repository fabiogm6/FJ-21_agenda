package br.com.caelum.mvc.logica;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PrimeiraLogica implements Logica {
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {

		System.out.println("Executando a l�gica ... ...");
		System.out.println("Primeira L�gica: Retornando o nome da p�gina JSP ...");
		return "/WEB-INF/jsp/primeira-logica.jsp";
	
		//RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/primeira-logica.jsp");
		//rd.forward(req, res);
	
	}
} 