<%-- 
    Document   : agregarProducto
    Created on : 25-abr-2017, 17:16:51
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
        <form action="AgregarProducto" method='POST'>
            <p>Nombre: <input type="text" name="nombre" required></p>
            <p>Cantidad: <input type="number" name="cantidad" required></p>
            <p>Precio: <input type="number" name="precio" required></p>
            <p><input type="submit" value="Agregar" name="agregarproducto"></p>
        </form>
    </body>
</html>
