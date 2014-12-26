<%@ attribute name="id" required="true" %>
<%@ attribute name="val" required="false" %>

<input type="text" id="${id}" name="${id}" value="${val}"

	maxlength="10"
    onblur="if (this.value=='')
		{
		this.value='';		
		this.style.background = 'white';
		}
	else
		{
		//this.style.background = 'white';
		var mdateinput = this.value;
    	var strdia = mdateinput.substr(0,2);
		var strmes = mdateinput.substr(3,2);
		var strano = mdateinput.substr(6,4);
		var mdate = new Date(strano, strmes-1, strdia);
		if (parseInt(strdia) == mdate.getDate() &&  
				parseInt(strmes) == mdate.getMonth()+1 && 
				parseInt(strano) == mdate.getFullYear())
			{
			this.style.background = 'white';
			}
		else {
			this.value='';
			this.style.background = 'yellow';
			}
		}
	"
	
    onchange="if (this.value=='')
		{
		this.value='';
		//this.style.background = 'white';
		}
	else
		{
		//this.style.background = 'white';
		var mdateinput = this.value;
    	var strdia = mdateinput.substr(0,2);
		var strmes = mdateinput.substr(3,2);
		var strano = mdateinput.substr(6,4);
		var mdate = new Date(strano, strmes-1, strdia);
		if (parseInt(strdia) == mdate.getDate() &&  
				parseInt(strmes) == mdate.getMonth()+1 && 
				parseInt(strano) == mdate.getFullYear())
			{
			this.style.background = 'white';
			}
		else {
			this.value='';
			this.style.background = 'yellow';
			}
		}
	"	

	
	
/> 

<script>	
	$("#${id}").datepicker({dateFormat: 'dd/mm/yy',
		showButtonPanel: true,
		showAnim: "slideDown",
		nextText: "Próximo",
		prevText: "Anterior",
		buttonText: "Escolha",
		closeText: "Feito", 
		currentText: "Hoje", 
		changeYear: true,
		changeMonth: true,
		yearRange: "-80:+1" ,
		minDate: new Date(1930, 1 - 1, 1),
		maxDate: "+2m +1w",
		monthNames: [ "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro" ],
		monthNamesShort: [ "Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez" ],
		dayNames: [ "Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado" ],
		dayNamesMin: [ "Do", "2a", "3a", "4a", "5a", "6a", "Sa" ]	
	});
		
</script>


