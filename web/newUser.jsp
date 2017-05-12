<%-- 
    Document   : newUser
    Created on : 09-abr-2017, 14:29:07
    Author     : sergi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="NewUser" method="POST">
            <p>Name: <input type="text" name="name"></p>
            <p>Pass: <input type="text" name="pass"></p>
        
            <p><input type="submit" value="New" name="newuser"></p>
        </form>
    </body>
</html>
