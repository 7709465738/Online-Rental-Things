
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<%
    Connection con = null;
    Statement st = null;
    
    String formType = request.getParameter("formType");
    
    if ("formCreate".equals(formType)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            //ResultSet rs;
            String qur = "insert into users(name,email,mobile,password,role) values('"+name+"','"+email+"','"+mobile+"','"+password+"','2')";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Delivery boy added successfully.");
                request.getRequestDispatcher("delivery_boys.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("delivery_boys_create.jsp").forward(request, response);
        }
    } 

    if ("formEdit".equals(formType)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");        
        String user_id = request.getParameter("user_id");
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            //ResultSet rs;
            String qur = "update users set name='"+name+"',email='"+email+"',mobile='"+mobile+"' where id='"+user_id+"'";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Delivery boy updated successfully.");
                request.getRequestDispatcher("delivery_boys.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("delivery_boys_edit.jsp").forward(request, response);
        }
    } 
%>