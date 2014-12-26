<%-- comentário em JSP aqui --%>

 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>  


<html>

<body>

	<c:import url="cabecalho.jsp" />

	<!-- cria o DAO -->
	<jsp:useBean id="dao" class="br.com.caelum.jdbc.dao.ContatoDao" />
		<h1>Exemplo displaytag tabelas</h1>
		<hr />
	
	<display:table name="${dao.lista}" class="mars">  
	<%-- isis mars its simple report mark --%>
	    <display:column property="nome"/> 
	    <display:column property="email" format="{0}" />     
        <display:column title="-Endereço-" property="endereco" />  
        <display:column title="Nascimento" property="dataNascimento.time" format="{0,date,dd-MMM-yyyy}" sortable="true" />       
	</display:table>  

	<c:import url="rodape.jsp" />

</body>
</html>

