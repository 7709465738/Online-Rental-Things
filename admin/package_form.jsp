

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<%
    Connection con = null;
    Statement st = null;
    
    String formType = request.getParameter("formType");
    
    if ("formPackageCreate".equals(formType)) {
        String name = request.getParameter("name");
        String item = request.getParameter("item");
        String description = request.getParameter("description");
        String amount = request.getParameter("amount");        
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            String qur = "insert into packages(name, description, item_id, amount) values('"+name+"','"+description+"','"+item+"','"+amount+"')";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Package added successfully.");
                request.getRequestDispatcher("package.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("package_create.jsp").forward(request, response);
        }
    } 

    if ("formPackageEdit".equals(formType)) {
        String name = request.getParameter("name");
        String item = request.getParameter("item");
        String description = request.getParameter("description");
        String amount = request.getParameter("amount");        
        String package_id = request.getParameter("package_id");
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            String qur = "update packages set name='"+name+"', description='"+description+"', item_id='"+item+"', amount='"+amount+"' where id = '"+package_id+"'";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Package updated successfully.");
                request.getRequestDispatcher("package.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("package.jsp").forward(request, response);
        }
    } 
%>
    