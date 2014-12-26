<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<img src="<c:url value="/imagens/caelum.png"/>" />

<%-- necessário para o displaytag --%>
    <style type="text/css" media="all">
      @import url("css/maven-base.css"); @import url("css/maven-theme.css"); @import url("css/site.css"); @import
      url("css/screen.css");
    </style>

<%--
ou 1)
<c:url value="/imagens/caelum.png" var="imagem"/>
<img src="${imagem}"/>

ou 2) 
<img src="imagens/caelum.png" />
 --%>

<h2>Agenda de Contatos do Fabio GM</h2>
<hr />