


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<%
    Connection con = null;
    Statement st = null;
          
    String order_id = request.getParameter("order_id");

    try{
        con = Dbutil.conn();
        st = con.createStatement();
        String qur = "update orders set status='Cancelled' where id = '"+order_id+"'";
        int i = st.executeUpdate(qur);
        if(i > 0)
        {
            request.setAttribute("successMessage", "Order Cancelled.");
            request.getRequestDispatcher("orders.jsp").forward(request, response);
        }
    }
    catch(Exception ex)
    {
        request.setAttribute("errorMessage", "Error info : " +ex);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
%>