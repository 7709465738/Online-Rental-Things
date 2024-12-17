

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
        if(session.getAttribute("user_id") != null) {
        Connection con = null;
        Statement st = null;
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from orders order by id DESC";
        rs = st.executeQuery(qur);
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Orders</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>               
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table" id="datatable">
                            <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Date</th>
                                    <th>Item</th>
                                    <th>Package</th>
                                    <th>Amount</th>
                                    <th>Payment Type</th>
                                    <th>Duration</th>
                                    <th>Due Date</th>
                                    <th>Status</th>
                                    <th>Address</th>
                                    <th>Delivery Boy</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% while(rs.next()) { %>
                                <tr>
                                    <td><%=rs.getString("id")%></td>
                                    <td><%=rs.getString("date")%></td>
                                    
                                    <%
                                    Statement st2 = con.createStatement();
                                    ResultSet rs2;
                                    String qur2="select * from product_items where id='"+rs.getString("item_id")+"' limit 1";
                                    rs2 = st2.executeQuery(qur2);
                                    %>
                                    <% while(rs2.next()) { %>
                                    <td><%=rs2.getString("name")%></td>
                                    <% } %>
                                     
                                    <%
                                    Statement st3 = con.createStatement();
                                    ResultSet rs3;
                                    String qur3="select * from packages where id='"+rs.getString("package_id")+"' limit 1";
                                    rs3 = st3.executeQuery(qur3);
                                    %>
                                    <% while(rs3.next()) { %>
                                    <td><%=rs3.getString("name")%></td>
                                    <% } %>
                                    
                                    <td><%=rs.getString("amount")%></td>
                                    <td><%=rs.getString("paytype")%></td>
                                    <td><%=rs.getString("duration")%></td>
                                    <td><%=rs.getString("due_date")%></td>
                                    <td><%=rs.getString("status")%></td>
                                    <td><%=rs.getString("address")%></td>
                                    <td>
                                    <%
                                    Statement st4 = con.createStatement();
                                    ResultSet rs4;
                                    String qur4="select * from users where id='"+rs.getString("delivery_boy")+"' limit 1";
                                    rs4 = st4.executeQuery(qur4);
                                    %>
                                    <% while(rs4.next()) { %>
                                    <%=rs4.getString("name")%>
                                    <% } %>                   
                                    </td>
                                    <td>
                                        <%
                                            String status = rs.getString("status");
                                            if ("Delivered".equals(status) || "Active".equals(status) || "Inactive".equals(status)){
                                        %>
                                        <a class="btn btn-sm btn-info" href="update_order_status.jsp?order_id=<%=rs.getString("id")%>">Update Status</a>
                                        <% } %>
                                        <%                                            
                                            if ("Order Placed".equals(status)){                                            
                                        %>
                                        <a class="btn btn-sm btn-info" href="orders_assign_delivery_boy.jsp?order_id=<%=rs.getString("id")%>">Assign delivery boy</a>
                                        <% } %>
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