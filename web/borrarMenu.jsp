<%-- 
    Document   : borrarMenu
    Created on : 14-may-2017, 0:50:24
    Author     : Ivan
--%>
<%@page import="java.util.List"%>
<%@page import="entities.Menu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Cual quieres eliminar?</p>
    <form action="BorrarMenu" method="POST">
        <p>Productos: <select name="menus">
            <%
            List<Menu> menus = (List<Menu>) request.getAttribute("listaMenu");
            for (Menu m : menus){
                %>
                <option value="<%= m.getIdMenu() %>">Nombre:<%= m.getNombre() %> </option>
                <% } %>
            </select>
        <p><input type="submit" name="borrarmenu" value="Borrar"></p>
    </form>
    </body>
</html>