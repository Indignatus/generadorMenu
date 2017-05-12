<%-- 
    Document   : menu
    Created on : 02-may-2017, 19:57:53
    Author     : dam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <!-- Crear un nuevo Menú -->
            <form action="managerMenu">
                <input type="hidden" value="mostrarProducto" name="parameter">
                <input type="submit" value="Crear Menu">
            </form>
        
        <!-- Mostrar Menus -->
            <form action="mostrarMenu.jsp">
                <input type="submit" value="mostrarMenu" name="mostrarMenu">
            </form>
        
        <form action="borrarMenu">
            <input type="submit" value="BorrarMenu">
        </form>
        <form action="editarMenu">
            <input type="submit" value="EditarMenu">
        </form>
    </body>
</html>
