

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Update Status</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 2) {
        Connection con = null;        
        Statement st = null;
        String order_id = request.getParameter("order_id");
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from orders where id= '"+order_id+"' limit 1";
        rs = st.executeQuery(qur);
        if(rs.next()) {
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Update Status</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <form class="col-md-12" method="post" action="update_order_status_from.jsp">
                    <input type="hidden" name="formType" value="formOrderEdit" />
                    <input type="hidden" name="order_id" value="<%=rs.getString("id")%>" />
                    
                    <%
                    Statement st2 = con.createStatement();
                    ResultSet rs2;
                    String qur2="select * from product_items where id='"+rs.getString("item_id")+"' limit 1";
                    rs2 = st2.executeQuery(qur2);
                    %>
                    <% while(rs2.next()) { %>
                    <div class="form-group mb-3 w-50">
                        <label>Item Name</label>
                        <input type="text" disabled class="form-control" name="name" id="name" required placeholder="Name" value="<%=rs2.getString("name")%>" />
                    </div>
                    <% } %>
                    
                    <%
                    Statement st3 = con.createStatement();
                    ResultSet rs3;
                    String qur3="select * from packages where id='"+rs.getString("package_id")+"' limit 1";
                    rs3 = st3.executeQuery(qur3);
                    %>
                    <% while(rs3.next()) { %>
                    <div class="form-group mb-3 w-50">
                        <label>Package Name</label>
                        <input type="text" disabled class="form-control" name="pkgname" id="pkgname"  placeholder="Name" value="<%=rs3.getString("name")%>" />
                    </div>
                    <% } %>
                                        
                    <div class="form-group mb-3 w-50">
                        <label>Status</label>
                        <select class="form-control" name="status" id="status" required>
                            <option disabled selected value="">Select</option>
                            <option value="Out for delivery">Out for delivery</option>                            
                            <option value="Delivered">Delivered</option>                            
                        </select>
                    </div>                    
                    <div class="form-group mb-3">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <a href="orders.jsp" class="btn btn-outline-dark">Back</a>
                    </div>
                </form>
            </div>
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>
        <script src="https://cdn.ckeditor.com/4.17.1/standard/ckeditor.js"></script>
    </body>
    <%      
            }
            else {
                out.println("Not found");
            }
        } 
        else {
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>