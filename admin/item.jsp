

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Items</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        Statement st = null;
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from product_items order by id DESC";
        rs = st.executeQuery(qur);
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Items</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <div class="row mb-3">
                    <div class="col-md-12">
                        <a href="item_create.jsp" class="btn btn-primary">New Item</a>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table" id="datatable">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Description</th>
                                    <th>Image</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while(rs.next()) { %>
                                <tr>
                                    <td><%=rs.getString("name")%></td>
                                    <%
                                    Statement st2 = con.createStatement();
                                    ResultSet rs2;
                                    String qur2="select * from category where id='"+rs.getString("category")+"' limit 1";
                                    rs2 = st2.executeQuery(qur2);
                                    %>
                                    <% while(rs2.next()) { %>
                                    <td><%=rs2.getString("name")%></td>
                                    <% } %>
                                    <td><%=rs.getString("description")%></td>
                                    <td>
                                        <a class="btn btn-sm btn-info" href="item_image.jsp?item_id=<%=rs.getString("id")%>">Edit</a>
                                    </td>
                                    <td>
                                        <a class="btn btn-sm btn-info" href="item_edit.jsp?item_id=<%=rs.getString("id")%>">Edit</a>
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

