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
        <div align="center">
            <h1>Panel de Menu</h1>
            <br>
            <form action="managerMenu">
                <input type="hidden" value="mostrarProducto" name="parameter">
                <input type="submit" value="Crear Menu" style='width:200px; height:25px'>
            </form>
        </div>
        <!-- Mostrar Menus -->
        <div align="center">
            <form action="mostrarMenu.jsp">
                <input type="submit" value="mostrarMenu" name="mostrarMenu" style='width:200px; height:25px'>
            </form>
        </div>
        <div align="center">
        <form action="managerMenu">
            <input type="hidden" name="borrar" value="borrar">
            <input type="submit" value="BorrarMenu" style='width:200px; height:25px'>
        </form>
        </div>    
        <div align="center">
        <form action="EditarMenu">
            <input type="submit" value="EditarMenu" style='width:200px; height:25px'>
        </form>
        </div>
    </body>
</html>
