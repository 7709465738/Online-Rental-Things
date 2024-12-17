

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Assign order to delivery boy</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        Statement st_cat = null;
        String order_id = request.getParameter("order_id");
        con = Dbutil.conn();
        st_cat = con.createStatement();
        ResultSet rs_cat;
        String qur_cat="select * from users where role=2 order by name ASC";
        rs_cat = st_cat.executeQuery(qur_cat);
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Assign Order to delivery boy</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <form class="col-md-12" method="post" action="orders_form.jsp">
                    <input type="hidden" name="formType" value="formAssign" />                    
                    <input type="hidden" name="order_id" value="<%=order_id%>" />
                    <div class="form-group mb-3 w-50">
                        <label>Category</label>
                        <select class="form-control" name="user_id" id="user_id" required>
                            <option disabled selected value="">Select</option>
                            <% while(rs_cat.next()) { %>
                            <option value="<%=rs_cat.getString("id")%>"><%=rs_cat.getString("name")%></option>
                            <% } %>
                        </select>
                    </div>                   
                    <div class="form-group mb-3">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <a href="item.jsp" class="btn btn-outline-dark">Back</a>
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
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>