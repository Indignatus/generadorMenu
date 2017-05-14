<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            if (user != null) {
        %>
        <div>
            <%
                if (user.equals("admin")) {
            %>
            <div align="center">
            <h1>Bienvenido!</h1>
            <br>
            <!-- Crear un nuevo usuario -->
            <form action="newUser.jsp">
                <input type="submit" value="Crear Nuevo Usuario" name="crearuser">
            </form>
            </div>
            <div align="center">
            <!-- Ver la lista de usuarios -->
            <form action="NewUser">
                <input type="submit" value="Ver Lista de Usuarios" name="veruser">
            </form>  
            </div>
            <%  }   %>
            <div align="center">
            <!-- Ir a la seleccion de opciones del Menú -->
            <form action="menu.jsp">
            <input type="submit" value="Menu">
            </form>
            </div>
            <div align="center">
            <!-- Ir a la seleccion de opciones de Productos -->
            <form action="producto.jsp">
            <input type="submit" value="Producto">
            </form>
            </div>
            <!-- Ir al principio (Menu Principal Login) -->
            <div align="center">
            <form action="index.html">
                <input type="submit" value="Volver Atras" name="login">
            </form>
            </div>
        </div>
        <% } else {
        %>
        <h1>No hay usuario validado.</h1>
        <%
            }%>
    </body>
</html>
