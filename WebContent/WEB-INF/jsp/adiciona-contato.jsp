<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="caelum" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>

<head> <%-- necessário para o jquery: datepicker --%>
		<link href="js/jquery-ui.css" rel="stylesheet">
		<link href="js/jquery.css" rel="stylesheet">
		<script src="js/external/jquery/jquery.js"></script>
		<script src="js/jquery-ui.js"></script>
</head>

<body>
	<c:import url="/WEB-INF/jsp/cabecalho.jsp" />
    <h1>Adicionar Contatos</h1>
    <hr />
    
    <form action="mvc" method="POST" autocomplete="off" onsubmit="return valida(this);" >
        Nome: <input type="text" name="nome" id="tx_nome" onchange="chkNome(this.value)" onblur="chkNome(this.value)" maxlength="50" /><br />
        E-mail: <input type="text" name="email" id="tx_email"  onchange="chkemail(this.value)" onblur="chkemail(this.value)" maxlength="50"/><br />
        Endereço: <input type="text" name="endereco" id="tx_endereco"  onchange="chkendereco(this.value)" onblur="chkendereco(this.value)" maxlength="50"/><br />
        Data Nascimento: 
		<fmt:formatDate value="${dataNascimento}" var="dataFormatada" />
		<caelum:campoData id="dataNascimento" val="${dataFormatada}"/>        

		<input type="hidden" name="logica" value="AdicionaContatoLogic"/>  
        <input type="submit" value="Gravar" />
    </form>    
    
    <p id="mensform"> Mensagem: Pressione Gravar para registrar </p>
    
    <script>
    
    function valida(form) {
   
    	if (form.nome.style.background == "yellow" || form.nome.value=="") {
    		document.getElementById('mensform').innerHTML = "Favor preencher os campos destacados";
    		form.nome.focus();
    		return false;
    		}    	
    	
    	var filtro_mail = /^.+@.+\..{2,3}$/
   		if (!filtro_mail.test(form.email.value) || form.email.value=="") {
   		form.email.value="teste@teste.com";
   		form.email.focus();
   		return false;
   		}

    	if (form.endereco.style.background == "yellow" || form.nendereco.value=="") {
    		document.getElementById('mensform').innerHTML = "Favor preencher os campos destacados";
    		form.nome.focus();
    		return false;
    		}    	
    	
    	if (form.dataNascimento.style.background == "yellow" || form.dataNascimento.value=="" || form.dataNascimento.value.length != 10){
    		document.getElementById('mensform').innerHTML = "Favor preencher os campos destacados";
    		form.dataNascimento.focus();
    		return false;
    		}
    }
    
    function chkNome(val) {
        if (val == "") 
        	{document.getElementById("tx_nome").style.background = "yellow";
        	document.getElementById('mensform').innerHTML = "Nome: Não deixe em branco";
        	}
        	
        else 
        	{document.getElementById("tx_nome").style.background = "white";}
    }    

    function chkemail(val) {
        if (val == "") 
        	{document.getElementById("tx_email").style.background = "yellow";
        	document.getElementById('mensform').innerHTML = "email: Não deixe em branco";
        	}
        else 
        	{document.getElementById("tx_email").style.background = "white";}
        
    	var filtro_mail = /^.+@.+\..{2,3}$/
       		if (!filtro_mail.test(val) || val=="") 
       		{document.getElementById("tx_email").style.background = "yellow";
       		 document.getElementById('mensform').innerHTML = "e-Mail: Inválido então eu preenchi para você";
       		 document.getElementById("tx_email").value="teste@teste.com";
       		}
    }    

    function chkendereco(val) {
        if (val == "") 
        	{document.getElementById("tx_endereco").style.background = "yellow";
        	document.getElementById('mensform').innerHTML = "Endereço: Não deixe em branco";
        	}
        else 
        	{document.getElementById("tx_endereco").style.background = "white";}
    }    

	/* OUTROS EXEMPLOS
	function IsNum(v)
	{
	   var ValidChars = "0123456789";
	   var IsNumber=true;
	   var Char;
	   for (i = 0; i < v.length && IsNumber == true; i++) 
	      { 
	      Char = v.charAt(i); 
	      if (ValidChars.indexOf(Char) == -1) 
	         {
	         IsNumber = false;
	         }
	      }
	   return IsNumber;
	   
		}
	
	if (form.idade.value=="" || !IsNum(form.idade.value)) {
		alert("Preencha a idade corretamente.");
		form.idade.focus();
		return false;
		}
	
	if (form.tel.value=="") {
		alert("Preencha o telefone corretamente.");
		form.tel.focus();
		return false;
		}
	
	if (form.senha.value=="" || form.senha.value.length < 6) {
		alert("Preencha a senha corretamente.");
		form.senha.focus();
		return false;
		}

	if (form.conf_senha.value=="" || form.conf_senha.value.length < 6) {
		alert("Preencha a confirmação de senha corretamente.");
		form.conf_senha.focus();
		return false;
		}
	if (form.senha.value!=form.conf_senha.value) {
		alert("A senha e a confirmação tem de ser iguais.");
		form.conf_senha.focus();
		return false;
		}
	
	if (form.sexo[0].checked==false && form.sexo[1].checked==false) {
	alert("Selecione o sexo.");
	return false;
	}
	*/
    
    
	</script>
    
<c:import url="/WEB-INF/jsp/rodape.jsp" />
</body>
</html> 




