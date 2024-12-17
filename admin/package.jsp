
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Packages</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        Statement st = null;
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from packages order by id DESC";
        rs = st.executeQuery(qur);
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Packages</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <div class="row mb-3">
                    <div class="col-md-12">
                        <a href="package_create.jsp" class="btn btn-primary">New Package</a>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table" id="datatable">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Amount</th>                                    
                                    <th>Description</th>
                                    <th>Item</th>
                                    <th>Image</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while(rs.next()) { %>
                                <tr>
                                    <td><%=rs.getString("name")%></td>
                                    <td><%=rs.getString("amount")%></td>                                    
                                    <td><%=rs.getString("description")%></td>
                                    <%
                                    Statement st_item = null;
                                    st_item = con.createStatement();
                                    ResultSet rs_item;
                                    String qur_item="select * from product_items where id = '"+rs.getString("item_id")+"' limit 1";
                                    rs_item = st_item.executeQuery(qur_item);
                                    while(rs_item.next()) {
                                    %>
                                    <td><%=rs_item.getString("name")%></td>
                                    <% } %>
                                    <td>
                                        <a class="btn btn-sm btn-info" href="package_image.jsp?package_id=<%=rs.getString("id")%>">Edit</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-info" href="package_edit.jsp?package_id=<%=rs.getString("id")%>">Edit</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>
    </body>
    <% 
        } 
        else {
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>

