<%-- 
    Document   : crearMenu
    Created on : 06-may-2017, 20:42:23
    Author     : sergi
--%>

<%@page import="entities.Producto"%>
<%@page import="java.util.List"%>
<%@page import="servlets.ManagerMenu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            if (user != null) {
        %>
        <% List <Producto> listaProductos = (List<Producto>) request.getAttribute("parameterListaProducto");
         if (listaProductos != null) {
        %>  
        
        <h1>Creación de menuses</h1>
        <form action="ManagerMenu">
            <p>Name <input type="text" name="name"></p>
            <select name ='type'>
                <option value='lunes'> lunes </option>
                <option value='martes'> martes </option>
                <option value='miercoles'> miercoles </option>
                <option value='jueves'> jueves </option>
                <option value='viernes'> viernes </option>
                <option value='savado'> sávado </option>
                <option value='domingo'> domingo </option>
            </select>

            <p>Temporada <input type="text" name="temporada"></p>
            <select name ='primerPlato'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%p.getIdProducto();%>'> <%p.getNombre();%> </option>
                <% }%>
            </select>
            <select name ='segundoPlato'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%p.getIdProducto();%>'> <%p.getNombre();%> </option>
                <% }%>
            </select>
            <select name ='postre'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%p.getIdProducto();%>'> <%p.getNombre();%> </option>
                <% }%>
            </select>
            <select name ='bebida'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%p.getIdProducto();%>'> <%p.getNombre();%> </option>
                <% }%>
            </select>
            <p>Precio <input type="number" name="precio"></p>
        </form>
        <% } %>
        <% } else {
        %>
        <h1>No hay usuario validado.</h1>
        <%
            }%>
    </body>
</html>
