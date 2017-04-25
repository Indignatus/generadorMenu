<%--
    Document   : final
    Created on : 25-abr-2017, 18:08:36
    Author     : dam
--%>
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
        <% } %>
        <a href="index.html">Main menu</a>
    </body>
</html>
