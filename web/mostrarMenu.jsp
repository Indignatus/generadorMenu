<%-- 
    Document   : mostrarMenu
    Created on : 07-may-2017, 2:08:12
    Author     : sergi
--%>

<%@page import="java.util.List"%>
<%@page import="entities.Menu"%>
<%@page import="servlets.ManagerMenu"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="managerMenu">

            <select name ='type'>
                <option value='lunes'> lunes </option>
                <option value='martes'> martes </option>
                <option value='miercoles'> miercoles </option>
                <option value='jueves'> jueves </option>
                <option value='viernes'> viernes </option>
                <option value='sabado'> sávado </option>
                <option value='domingo'> domingo </option>
            </select>
        
                <input type="hidden" value="mostrarMenu" name="mostrarMenu">
                <input type="submit" value="Buscar menu">
         
        </form>
        <%
         
           if ("filtro".equals(request.getAttribute("filtro"))) { %>

        <% List<Menu> menu = (List<Menu>) request.getAttribute("listaMenu");%>
        <% for (Menu m : menu) {  %>

        <h1>Restaurant la Costa</h1>
        <h3><%=m.getNombre() %></h3>
        <h3><%= m.getPrimerPlato().getNombre() %></h3>
        <h3><%= m.getSegundoPlato().getNombre()%></h3>
        <h3><%= m.getBebida().getNombre()%></h3>
        <h3><%= m.getPostre().getNombre()%></h3>
        <h3><%= m.getPrecio()%></h3>
        <br>
        <br>

        <%  }
            }
        %>
    </body>
</html>
