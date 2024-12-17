

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<%
    Connection con = null;
    Statement st = null;
    
    String formType = request.getParameter("formType");
    
        if ("formItemCreate".equals(formType)) {
            String name = request.getParameter("name");
            String category = request.getParameter("category");
            String description = request.getParameter("description");

            try{
                con = Dbutil.conn();
                st = con.createStatement();
                String qur = "insert into product_items(name, description, category) values('"+name+"','"+description+"','"+category+"')";
                int i = st.executeUpdate(qur);
                if(i > 0)
                {
                    request.setAttribute("successMessage", "Item added successfully.");
                    request.getRequestDispatcher("item.jsp").forward(request, response);
                }
            }
            catch(Exception ex)
            {
                request.setAttribute("errorMessage", "Error info : " +ex);
                request.getRequestDispatcher("item_create.jsp").forward(request, response);
            }
        } 

if ("formItemEdit".equals(formType)) {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String description = request.getParameter("description");
        String item_id = request.getParameter("item_id");
        
        try{
            con = Dbutil.conn();
            st = con.createStatement();
            String qur = "update product_items set name='"+name+"', description='"+description+"', category='"+category+"' where id = '"+item_id+"'";
            int i = st.executeUpdate(qur);
            if(i > 0)
            {
                request.setAttribute("successMessage", "Item updated successfully.");
                request.getRequestDispatcher("item.jsp").forward(request, response);
            }
        }
        catch(Exception ex)
        {
            request.setAttribute("errorMessage", "Error info : " +ex);
            request.getRequestDispatcher("item.jsp").forward(request, response);
        }
    } 
%>

    