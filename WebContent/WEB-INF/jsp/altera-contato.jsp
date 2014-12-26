<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<html>
<head> <%-- necessário para o jquery: datepicker --%>
		<link href="js/jquery-ui.css" rel="stylesheet">
		<link href="js/jquery.css" rel="stylesheet">
		<script src="js/external/jquery/jquery.js"></script>
		<script src="js/jquery-ui.js"></script>
</head>
	<body>
	
		<c:import url="cabecalho.jsp" />
	
		<h1>Altera Contato</h1>
		<hr />
		
	<form action="mvc" method="post">
		Id: <input type="text" name="id" value="${id}" readonly style="border:none"/><br/>
		Nome: <input type="text" name="nome" value="${nome}" /><br/>
		E-mail: <input type="text" name="email" value="${email}" /><br/>
		Endereço: <input type="text" name="endereco" value="${endereco}"/><br/>
		Data Nascimento: 
		<fmt:formatDate value="${dataNascimento}" var="dataFormatada" />
		<caelum:campoData id="dataNascimento" val="${dataFormatada}"/> 
		
		<input type="hidden" name="logica" value="AlteraContatoLogic"/>
		<input type="submit" value="Gravar"/>
	
	</form>
		
		<c:import url="rodape.jsp" />
	
	</body>
</html>