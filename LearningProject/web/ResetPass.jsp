<%-- 
    Document   : ResetPass
    Created on : Sep 15, 2022, 10:03:54 PM
    Author     : NamDepTraiVL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="resetpass" method="post">                    
            Username: <input type="text" name="username">
            <input type="submit" value="reset">
            ${test}
        </form>
    </body>
</html>
