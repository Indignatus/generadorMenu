<%-- 
    Document   : borrarProducto
    Created on : 01-may-2017, 16:52:39
    Author     : Ivan
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Cual quieres eliminar?</p>
    <form action="BorrarProducto" method="POST">
        <p>Productos: <select name="productos">
            <%
            List<Producto> productos = (List<Producto>) request.getAttribute("producto");
            for (Producto p : productos){
                %>
                <option value="<%= p.getNombre() %>">Nombre:<%= p.getNombre() %> Cantidad:<%= p.getCantidad()%> Precio: <%= p.getPrecio()%></option>
                <% } %>
            </select>
        <p><input type="submit" name="Borrar Producto" value="Borrar"></p>
    </form>
    </body>
</html>
