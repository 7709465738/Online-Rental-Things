
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<%
    Connection con = null;
    Statement st = null;
    
    String formType = request.getParameter("formType");
        
    if ("formOrderEdit".equals(formType)) {
        String name = request.getParameter("name");
        String status = request.getParameter("status");        
        String order_id = request.getParameter("order_id");
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            String qur = "update orders set status='"+status+"' where id = '"+order_id+"'";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Status updated successfully.");
                request.getRequestDispatcher("orders_delivery_boy.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("orders_delivery_boy.jsp").forward(request, response);
        }
    } 
        
%>