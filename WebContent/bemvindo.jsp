<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>

<c:import url="/WEB-INF/jsp/cabecalho.jsp" />

	<h1>Olá !</h1>

	<br />
	<br />
	<br />

	<%-- comentário em JSP aqui: nossa primeira página JSP --%>
	<%
	String mensagem = "Bem vindo ao sistema de agenda do FJ-21!";
	%>
	<% out.println(mensagem); %>
	<br />
	<%
	String desenvolvido = "Desenvolvido por (Fábio GM)";
	%>
	<%= desenvolvido %>
	
	
	<%-- vai para o console do TomCat
		<%
			System.out.println("Tudo foi executado!");
		%>
	--%>
	
	<c:import url="/WEB-INF/jsp/rodape.jsp" />
		
</body>

</html>