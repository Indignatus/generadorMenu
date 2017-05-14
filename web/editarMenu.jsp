<%-- 
    Document   : editarMenu
    Created on : 14-may-2017, 16:14:38
    Author     : Ivan
--%>
<%@page import="entities.Producto"%>
<%@page import="java.util.List"%>
<%@page import="entities.Menu"%>
<%@page import="servlets.ManagerMenu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu:</title>
    </head>
    <body>
        <% List <Producto> listaProductos = (List<Producto>) request.getAttribute("parameterListaProducto");
         if (listaProductos != null) {
        %>
        <h1>Menu:</h1>
        <form action="EditarMenu" method="POST">
        <p>Productos: <select name="menu">
            <%
            List<Menu> menu = (List<Menu>) request.getAttribute("menu");
            for (Menu m : menu){
                %>
                <option value="<%= m.getIdMenu() %>">Nombre:<%= m.getNombre() %> </option>
                <% } %>
            </select>
        <p></p>
        <p>Introduce el nuevo nombre del Menu: <input type="text" name="nombreNuevoMenu"></p>
        <p>Introduce la nueva semana:
            <select name ='type'>
                <option value='lunes'> lunes </option>
                <option value='martes'> martes </option>
                <option value='miercoles'> miercoles </option>
                <option value='jueves'> jueves </option>
                <option value='viernes'> viernes </option>
                <option value='savado'> sávado </option>
                <option value='domingo'> domingo </option>
            </select>
        </p>
        <p>Introduce un nuevo nombre de Temporada: <input type="text" name="nombreNuevaTemporada"></p>
        <p>Introduce un nuevo primer plato: 
            <select name ='nuevoPrimerPlato'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%=p.getIdProducto()%>'> <%=p.getNombre()%> </option>
                <% }%>
            </select></p>
        <p>Introduce un nuevo segundo plato: 
            <select name ='nuevoSegundoPlato'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%=p.getIdProducto()%>'> <%=p.getNombre()%> </option>
                <% }%>
            </select>
        </p>
        <p>Introduce un nuevo postre:
            <select name ='nuevoPostre'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%=p.getIdProducto()%>'> <%=p.getNombre()%> </option>
                <% }%>
            </select>
        </p>
        <p>Introduce un nuevo bebida:
            <select name ='nuevaBebida'>
                <% for (Producto p : listaProductos) { %>
                <option value='<%=p.getIdProducto()%>'> <%=p.getNombre()%> </option>
                <% }%>
            </select>
        </p>
        <p>Introduce el nuevo precio: <input type="number" name="nuevoPrecio"></p>
        <p><input type="submit" name="editar" value="Guardar"></p>
        </form>
            <% }else { %>
            No hay productos disponibles
            <% } %>
    </body>
</html>
