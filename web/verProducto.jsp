<%-- 
    Document   : verProducto
    Created on : 02-may-2017, 20:06:54
    Author     : dam
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
    <h1>Productos:</h1>
    <table border="1">
        <tr>
            <th>Nombre Producto</th>
            <th>Cantidad</th>
            <th>Precio</th>
        </tr>
        <%
            List<Producto> productos = (List<Producto>) request.getAttribute("producto");
            for (Producto p : productos){
        %>
        <tr>
            <td><%= p.getNombre() %></td>
            <td><%= p.getCantidad()%></td>
            <td><%= p.getPrecio()%></td>
        </tr>
        <% } %>
    </table>
    </body>
</html>
