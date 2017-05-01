<%@page import="servlets.NewUser"%>
<%@page import="servlets.AgregarProducto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String status = (String) request.getAttribute("status");
            if (status.equals(AgregarProducto.STATUS_OK)) { %>
        <p>Product registered.</p> 
        <% } else if (status.equals(AgregarProducto.STATUS_ERROR)) { %>
        <p>Product already exists.</p>
        <% } else if (status.equals(NewUser.STATUS_OK)) { %>
        <p>Usuario creado correctamente</p>
        <% }%>
        <% 
        else if (status.equals(NewUser.STATUS_ERROR)) { %>
        <p>El usuario no se ha creado correctamente y no miento.</p>
        <% }%>


        <a href="index.html">Main menu</a>
    </body>
</html>
