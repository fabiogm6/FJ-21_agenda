package br.com.caelum.agenda.filtro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import br.com.caelum.jdbc.ConnectionFactory;

@WebFilter("/*")
public class FiltroConexao implements Filter {
	// implementação do init e destroy, se necessário

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		try {
			// capitulo 10.5
			// pendurando a connection na requisição
			// será usado em AdicionaContatoLogic, AlteraContatoLogic, AlteraContatoFormLogic, ListaContatosLogic, RemoveContatoLogic
			// assim o connectionFactory é usado uma vez só
			Connection connection = new ConnectionFactory().getConnection();
			// "pendura um objeto no Request"
			request.setAttribute("conexao", connection);
			chain.doFilter(request, response);
			connection.close();
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
