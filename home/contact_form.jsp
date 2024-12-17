

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>

<%
    Connection con = null;
    Statement st = null;
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    try{
        con = Dbutil.conn();
        st = con.createStatement();
        String qur = "insert into contact(name, email, message) values('"+name+"','"+email+"','"+message+"')";
        int i = st.executeUpdate(qur);
        if(i > 0)
        {
            request.setAttribute("successMessage", "Messaage send successfully.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
        }
    }
    catch(Exception ex)
    {
        request.setAttribute("errorMessage", "Error info : " +ex);
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }
%>
