package br.com.caelum.jdbc.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.caelum.jdbc.ConnectionFactory;
import br.com.caelum.jdbc.modelo.Contato;

public class ContatoDao {
	// a conexão com o banco de dados
	private Connection connection;

	public ContatoDao(Connection connection) {
		/* apostila capitulo 10.4
Precisamos, de alguma forma, criar a conexão e fazer com que essa mesma conexão possa ser usada por
todos os seus DAOs em uma determinada requisição. Assim, podemos criar nossas conexões com o banco de
dados dentro de nossas Servlets (ou lógicas, no caso do nosso frameworkMVC visto no capítulo anterior) e
apenas passá-las para o DAO que vamos utilizar. Para isso, nossos DAOs deverão ter um construtor que receba
Connection.
		 */
		this.connection = connection;
		}
// 	depois do capitulo 10.4 pode eliminar isto aqui: 
// no caso do exercicio só é usado no TestaInsere.java e TestaLista.java 
// no pacote br.com.caelum.jdbc.teste
// tente comentar as linhas abaixo e veja que os .java ficam com erro
	public ContatoDao() {
		this.connection = new ConnectionFactory().getConnection();
	}	
	
	public void adiciona(Contato contato) {
		try {
			String sql = "insert into contatos "
					+ "(nome,email,endereco,dataNascimento)" + " values (?,?,?,?)";
			// prepared statement para inserção
			PreparedStatement stmt = connection.prepareStatement(sql);
			// seta os valores
			stmt.setString(1, contato.getNome());
			stmt.setString(2, contato.getEmail());
			stmt.setString(3, contato.getEndereco());			
			Calendar tdataNascimento = contato.getDataNascimento();
			if (tdataNascimento==null)
			{
				stmt.setDate(4, null);
			}
			else
			{
				stmt.setDate(4, new Date(tdataNascimento.getTimeInMillis()));	
			}
			//stmt.setDate(4, new Date(contato.getDataNascimento().getTimeInMillis()));

			// executa
			stmt.execute();
			stmt.close();
			//System.out.println("ContatoDao: SQL close Contato");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} 
	}

	public List<Contato> getLista() {

		try {
			List<Contato> contatos = new ArrayList<Contato>();
			PreparedStatement stmt = this.connection
					.prepareStatement("select * from contatos");
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				// criando o objeto Contato
				Contato contato = new Contato();
				contato.setId(rs.getLong("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setEndereco(rs.getString("endereco"));

				try {
					Calendar data = Calendar.getInstance();
					data.setTime(rs.getDate("dataNascimento"));
					contato.setDataNascimento(data);					
				} catch (RuntimeException e) {
					//System.out.println("-------nulo");
					contato.setDataNascimento(null);
				}

				// adicionando o objeto à lista
				contatos.add(contato);
			}
			rs.close();
			stmt.close();
			return contatos;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public Contato getContato(int id) {
		String sql = "select * from contatos where id = ?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setInt(1, id);

			ResultSet rs = stmt.executeQuery();
			Contato contato = new Contato();

			while (rs.next()) {
				contato.setId(rs.getLong("id"));
				contato.setNome(rs.getString("nome"));
				contato.setEmail(rs.getString("email"));
				contato.setEndereco(rs.getString("endereco"));

				Calendar data = Calendar.getInstance();
				try {
					data.setTime(rs.getDate("dataNascimento"));
					contato.setDataNascimento(data);
				}
				catch (Exception e) {        
					contato.setDataNascimento(null);
		        }
			}

			rs.close();
			stmt.close();
			return contato;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void altera(Contato contato) {
		String sql = "update contatos set nome=?, email=?,"
				+ "endereco=?, dataNascimento=? where id=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, contato.getNome());
			stmt.setString(2, contato.getEmail());
			stmt.setString(3, contato.getEndereco());
			stmt.setDate(4, new Date(contato.getDataNascimento()
					.getTimeInMillis()));
			stmt.setLong(5, contato.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void exclui(Contato contato) {
		try {
			PreparedStatement stmt = connection
					.prepareStatement("delete from contatos where id=?");
			stmt.setLong(1, contato.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
