package br.com.caelum.mvc.logica;

//import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdicionaContatoFormLogic implements Logica {
	
	public String executa(HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		
		//RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/jsp/adiciona-contato.jsp");
		//rd.forward(req, res);
		
		return "/WEB-INF/jsp/adiciona-contato.jsp";
		
	}
}