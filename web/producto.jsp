<%-- 
    Document   : producto
    Created on : 02-may-2017, 20:03:43
    Author     : dam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="agregarProducto.jsp">
            <input type="submit" value="Agregar Producto">
        </form>
        <form action="EditarProducto">
            <input type="submit" value="Editar Producto">
        </form>
        <form action="VerProducto">
            <input type="hidden" name="borrar" value="borrar">
            <input type="submit" value="Borrar Producto">
        </form>
        <form action="VerProducto">
            <input type="submit" value="Ver Producto">
        </form>
    </body>
</html>
