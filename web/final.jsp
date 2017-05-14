<%@page import="servlets.BorrarMenu"%>
<%@page import="servlets.NewUser"%>
<%@page import="servlets.AgregarProducto"%>
<%@page import="servlets.BorrarProducto"%>
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
        <p><a href="agregarProducto.jsp">Añadir otro Producto</a></p>
        <p><a href="producto.jsp">Volver al Menú</a></p>
        
        <% } else if (status.equals(AgregarProducto.STATUS_ERROR)) { %>
        
        <p>Product already exists.</p>
        <p><a href="agregarProducto.jsp">Intentar añadir un Producto otra vez</a></p>
        <p><a href="producto.jsp">Volver al Menú de Seleccion de Productos</a></p>
        
        <% } else if (status.equals(NewUser.STATUS_OK)) { %>
        
        <p>Usuario creado correctamente</p>
        <p><a href="index.html">Volver al Menú de Login</a></p>
        
        <% } else if (status.equals(NewUser.STATUS_ERROR)) { %>
        
        <p>El usuario no se ha creado correctamente y no miento.</p>
        <p><a href="newUser.jsp">Intentar crear un nuevo usuario otra vez</a></p>
        <p><a href="index.html">Volver al Menú de Login</a></p>
        
        <% } else if (status.equals(BorrarProducto.STATUS_OK)) { %>
        
        <p>Producto borrado correctamente</p>
        <p><a href="borrarProducto.jsp">Borrar otro Producto</a></p>
        <p><a href="producto.jsp">Volver al Menú de Seleccion</a></p>

        <% } else if (status.equals(BorrarProducto.STATUS_ERROR)) { %>
        
        <p>El Producto no se ha podido borrar correctamente</p>
        <p><a href="borrarProducto.jsp">Intentar volver a borrar un Producto</a></p>
        <p><a href="producto.jsp">Volver al Menú de Seleccion</a></p>

        <% } else if (status.equals(BorrarMenu.STATUS_OK)) { %>
        
        <p>Menu borrado correctamente</p>
        <p><a href="borrarMenu.jsp">Borrar otro Menu</a></p>
        <p><a href="menu.jsp">Volver al Menú de Seleccion</a></p>

        <% } else if (status.equals(BorrarMenu.STATUS_ERROR)) { %>
        
        <p>El Menu no se ha podido borrar correctamente</p>
        <p><a href="borrarMenu.jsp">Intentar volver a borrar un Menu</a></p>
        <p><a href="menu.jsp">Volver al Menú de Seleccion</a></p>

        <% } else if (status.equals("Borrado correctamente")) { %>
        
        <p>Usuario Borrado correctamente.</p>
        <p><a href="login.jsp">Volver al menu anterior</a></p>
        
        <% } else if (status.equals("Borrado incorrectamente")) { %>
        
        <p>El usuario no se ha borrado correctamente y no miento.</p>
        <p><a href="login.jsp">Volver al menú de Login</a></p>

        <% }%>

    </body>
</html>
