<%-- 
    Document   : mostrarUsuarios
    Created on : 01-may-2017, 14:36:29
    Author     : sergi
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="servlets.NewUser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <% List<Object[]> listaUsuarios = (List<Object[]>) request.getAttribute("mostrarUsuarios");
                if (listaUsuarios != null) { %>
            <table>
                <tr>
                    <th> 
                        ID
                    </th>
                    <th>
                        Nombre
                    </th>
                </tr>
                <% for (Object[] la : listaUsuarios) {%>

                <tr>
                    <th>
                        <%=la[0].toString() %>
                    </th>
                    <th>
                        <%=la[1].toString() %>
                    </th>
                    <th>
                        <form action="NewUser" method="POST">
                            <input type="hidden" value= <%=la[0].toString() %> name="borrarId">
                            <input type="submit" value= "borrar"  name="borrar">
                        </form>
                    </th>
                </tr>

                <%}%>   
            </table>
            <%} else { %>
            hola  Sergi 
            <% } %>
        </div>

    </body>
</html>
