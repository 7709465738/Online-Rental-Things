

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>
    <body>
    <%
//        if(session.getAttribute("user_id") != null) {
//            if(Integer.parseInt(session.getAttribute("user_role").toString()) == 2) {
//                response.sendRedirect("teacher/index.jsp");
//            }
//            else if(Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
//                response.sendRedirect("admin/index.jsp");
//            }
//        }
//        else{
//            response.sendRedirect("account/login.jsp");
//        }
        response.sendRedirect("home/index.jsp");
    %>
    </body>
</html>
