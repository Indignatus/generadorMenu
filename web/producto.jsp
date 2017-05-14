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
        <div align="center">
            <h1>Panel de Producto</h1>
            <br>
        <form action="agregarProducto.jsp">
            <input type="submit"  value="Agregar Producto" style='width:200px; height:25px'>
        </form>
            </div>
        <div align="center">
        <form action="EditarProducto">
            <input type="submit" value="Editar Producto" style='width:200px; height:25px'>
        </form>
        </div>
        <div align="center">
        <form action="VerProducto">
            <input type="hidden" name="borrar" value="borrar">
            <input type="submit" value="Borrar Producto" style='width:200px; height:25px'>
        </form>
        </div>
        <div align="center">
        <form action="VerProducto">
            <input type="submit" value="Ver Producto" style='width:200px; height:25px'>
        </form>
        </div>
    </body>
</html>
