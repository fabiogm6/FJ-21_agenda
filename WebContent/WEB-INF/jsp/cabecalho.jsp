<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<img src="<c:url value="/imagens/caelum.png"/>" />

<body>

<h2>Agenda de Contatos do Fábio GM</h2>

		<form action="mvc" method="post">
		<input type="hidden" name="logica" value="ListaContatosLogic"/>
		<input type="submit" value="Listar Contatos"/>
		</form>	
		
		<form action="mvc" method="post">
		<input type="hidden" name="logica" value="AdicionaContatoFormLogic"/>
		<input type="submit" value="Adicionar Contatos"/>
		</form>	
		<a href="mvc?logica=AdicionaContatoFormLogic">Adicionar Contato</a>	

<hr />
		
</body>