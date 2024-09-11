<%-- 
    Document   : calendario.jsp
    Created on : 10 de set. de 2024, 22:07:39
    Author     : hugod
--%>

<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Calendário do Mês</h1>
    <%
        String anoParam = request.getParameter("ano");
        String mesParam = request.getParameter("mes");

        int ano = (anoParam != null) ? Integer.parseInt(anoParam) : Calendar.getInstance().get(Calendar.YEAR);
        int mes = (mesParam != null) ? Integer.parseInt(mesParam) : Calendar.getInstance().get(Calendar.MONTH) + 1;

        Calendar calendario = new GregorianCalendar(ano, mes - 1, 1);

        int diaSemanaInicio = calendario.get(Calendar.DAY_OF_WEEK);
        int diasNoMes = calendario.getActualMaximum(Calendar.DAY_OF_MONTH);
    %>

    <table>
        <tr>
            <th>Domingo</th>
            <th>Segunda</th>
            <th>Terça</th>
            <th>Quarta</th>
            <th>Quinta</th>
            <th>Sexta</th>
            <th>Sábado</th>
        </tr>
        <tr>
        <%
            
            for (int i = 1; i < diaSemanaInicio; i++) {
                out.print("<td></td>");
            }

            
            for (int dia = 1; dia <= diasNoMes; dia++) {
                out.print("<td>" + dia + "</td>");

                
                if ((dia + diaSemanaInicio - 1) % 7 == 0) {
                    out.println("</tr><tr>");
                }
            }

            for (int i = (diaSemanaInicio + diasNoMes - 1) % 7; i < 7 && i != 0; i++) {
                out.print("<td></td>");
            }
        %>
        </tr>
    </table>
    </body>
</html>
