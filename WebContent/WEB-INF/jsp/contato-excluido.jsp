<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
    <h1>Contato Excluído com Sucesso ! </h1>
    <hr />
	<p>Id: ${param.id} </p>
	<p>nome: ${param.nome} </p>
	
</body>
</html>