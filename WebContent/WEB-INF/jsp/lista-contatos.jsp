<%-- comentário em JSP aqui --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<%-- tag para o campo datanascimento --%>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<%-- fabio --%> 

<html> 
<head>
</head>
<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
    <h1>Adicionar Contatos</h1>
    <hr />		

	<table border="1">
		<tr bgcolor="aaeeee">
				<td>id</td>
				<td>Nome</td>
				<td>Email</td>
				<td>Endereco</td>
				<td>Data de Nascimento</td>
				<td>Alterar</td>
				<td>Remover</td>
		</tr>
		<c:forEach var="contato" items="${contatos}" varStatus="id">
				<tr bgcolor="#${id.count % 2 == 0 ? 'D2DFF8' : 'DFF8D2' }">
					<%-- teste de cores http://ffffff.eu/index.php?b=AAEE88 --%>
					<td>${contato.id}</td>
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
							pattern="dd/MM/yyyy" /></td>

 <%-- Funciona também para data !!!
 					<td>
 					<c:if test="${not empty contato.dataNascimento}"> 					
 						<fmt:formatDate value="${contato.dataNascimento.time}"
								pattern="dd/MMM/yyyy" />							
					</c:if>
					<c:if test="${empty contato.dataNascimento}">
						Data não Informada
					</c:if>		
					</td>
--%>
						
					<td> <a href="mvc?logica=AlteraContatoFormGetLogic&id=${contato.id}">Alterar</a> </td>
					<td> <a href="mvc?logica=RemoveContatoLogic&id=${contato.id}">Remover</a> </td>
							
				</tr>
			</c:forEach>
		
	</table>
<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html>



