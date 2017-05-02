<%-- 
    Document   : borrarProducto
    Created on : 01-may-2017, 16:52:39
    Author     : Ivan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="BorrarProducto" method='POST'>
            <p>Nombre: <input type="text" name="nombre" required></p>
            <p><input type="submit" value="Borrar" name="borrarproducto"></p>
        </form>
    </body>
</html>
