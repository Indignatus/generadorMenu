<%-- 
    Document   : editarProducto
    Created on : 01-may-2017, 16:39:44
    Author     : Ivan
--%>
<%@page import="java.util.List"%>
<%@page import="entities.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto</title>
    </head>
    <body>
        <h1>Productos:</h1>
        <form action="EditarProducto" method="POST">
        <p>Productos: <select name="productos">
            <%
            List<Producto> productos = (List<Producto>) request.getAttribute("producto");
            for (Producto p : productos){
                %>
                <option value="<%= p.getNombre() %>">Nombre:<%= p.getNombre() %> Cantidad:<%= p.getCantidad()%> Precio: <%= p.getPrecio()%></option>
                <% } %>
            </select>
        <p></p>
        <p>Introduce el nombre nuevo: <input type="text" name="nombreNuevo"></p>
        <p>Introduce la cantidad: <input type="number" name="cantidadNueva"></p>
        <p>Introduce el precio: <input type="number" name="precioNuevo"></p>
        <p><input type="submit" name="editar" value="Guardar"></p>
        </form>
    </body>
</html>
