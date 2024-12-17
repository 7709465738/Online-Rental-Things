<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Logging out...</title>
    </head>
    <body>
        <%
            if (session != null) {
                // Invalidate the session to log out the user
                session.invalidate();
            }
            // Redirect to login page after logout
            response.sendRedirect("login.jsp");
        %>
    </body>
</html>
