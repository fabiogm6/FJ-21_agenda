<%-- comentário em JSP aqui --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
</head>
<body>
	<c:import url="cabecalho.jsp" />
	
	<!-- cria o DAO -->
		<jsp:useBean id="dao" class="br.com.caelum.jdbc.dao.ContatoDao" />

	<table border="1">
	<c:forEach var="contato" items="${dao.lista}" varStatus="id">
			<tr bgcolor="#${id.count % 2 == 0 ? 'D2DFF8' : 'DFF8D2' }">
				<%-- teste de cores http://ffffff.eu/index.php?b=AAEE88 --%>

				<td>${id.count}</td>
				<td>${contato.nome}</td>

				<td>
					<c:if test="${not empty contato.email}">
						<a href="mailto:${contato.email}">${contato.email}</a>
					</c:if> 
					<c:if test="${empty contato.email}">
						E-mail não informado
					</c:if>
				</td>
				<td>${contato.endereco}</td>
				
				<td><fmt:formatDate value="${contato.dataNascimento.time}"
						pattern="dd/MMM/yyyy" /></td>
						
				<td> <a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a>
						
			</tr>
		</c:forEach>
	</table>
<c:import url="rodape.jsp" />
</body>
</html>

<%-- Podemos no atributo da data 'pattern' colocar outras 
informacoes com relacao ao objeto java.util.Date
que queremos mostrar, por exemplo:
• m - Minutos
• s - Segundos
• H - Horas (0-23)
• D - Dia no ano, por exemplo, 230 
--%>


<%-- 
ao invés do c:if pode usar o c:choose
<c:choose>
	<c:when test="${not empty contato.email}">
		<a href="mailto:${contato.email}">${contato.email}</a>
	</c:when>
	<c:otherwise>
		E-mail não informado
	</c:otherwise>
</c:choose>
--%>

<%-- 
1) não funcionava assim conforme apostila caelum:
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

2) aí testei também: 
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

3) e experimentei no web.xml movimentando o 'version 3.0' do fim para o inicio
ficou assim: 

<?xml version="1.0" encoding="UTF-8"?>
<web-app version="3.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://java.sun.com/xml/ns/javaee" xsi:schemaLocation="http://java.sun.com/xml/ns/javaee http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd" id="WebApp_ID">
  <display-name>fj21-agenda</display-name>

4) o que acho que funcionou realmente foi colocar o 
standard.jar e jstl.jar (que se encontram no tomcat CATALINA-HOME/webapps/examples/WEB-INF/lib)
dentro do dir web_inf/lib 
da minha aplicação

estas dicas peguei em: 
http://www.guj.com.br/java/38075-declarando-taglib-no-webxml-

--%>
 