<%-- lista-contatos-scriptlet.jsp  comentário em JSP aqui --%>

<html>
<body>
 
<%@ page import="java.text.DateFormat, java.util.*,
br.com.caelum.jdbc.dao.*,
br.com.caelum.jdbc.modelo.*" %>
<%= "beleza" %>

        <table>
        <%-- cabeçalho --%>
               <tr>
                      <td> <%="Nome"%> </td>
                      <td> <%="Email"%> </td>
                      <td> <%="Endereco"%> </td>
                      <td> <%="DataNascimento"%> </td>
               </tr>
        </table>
       
        <table>
               <%
                     ContatoDao dao = new ContatoDao();
                      List<Contato> contatos = dao.getLista();
                      for (Contato contato : contatos) {
               %>
               <tr>
                      <td> <%=contato. getNome()%></ td>
                      <td> <%=contato. getEmail()%></ td>
                      <td> <%=contato. getEndereco()%></ td>
                      <%DateFormat f = DateFormat.getDateInstance(DateFormat.SHORT); %>
                      <td> <%=f.format(contato. getDataNascimento().getTime())%></ td>
                      <%-- <%=contato.getDataNascimento().getTime()%> --%>
               </tr>
               <%
                     }
               %>
        </table>
</body>
</html>
