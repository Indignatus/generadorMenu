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
            <form action="newUser.jsp">
                <input type="submit" value="crearuser" name="crearuser">
            </form>
            <%  }   %>
            <form action="NewUser">
                <input type="submit" value="veruser" name="veruser">
            </form>
            <form action="managerMenu">
                <input type="hidden" value="mostrarProducto" name="parameter">
                <input type="submit" value="Crear Menu">
            </form>

            <form action="index.html">
                <input type="submit" value="login" name="login">
            </form>
            <form action="mostrarMenu.jsp">
                <input type="submit" value="mostrarMenu" name="mostrarMenu">
            </form>

        </div>
        <% } else {
        %>
        <h1>No hay usuario validado.</h1>
        <%
            }%>
    </body>
</html>
