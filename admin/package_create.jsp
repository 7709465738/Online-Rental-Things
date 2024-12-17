

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Create Package</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        Statement st_cat = null;
        con = Dbutil.conn();
        st_cat = con.createStatement();
        ResultSet rs_cat;
        String qur_cat="select * from product_items order by name ASC";
        rs_cat = st_cat.executeQuery(qur_cat);
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">New Package</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <form class="col-md-12" method="post" action="package_form.jsp">
                    <input type="hidden" name="formType" value="formPackageCreate" />
                    <div class="form-group mb-3 w-50">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" id="name" required placeholder="Name" />
                    </div>
                    <div class="form-group mb-3 w-50">
                        <label>Amount</label>
                        <input type="number" class="form-control" name="amount" id="amount" placeholder="Amount" required />
                    </div>                   
                    <div class="form-group mb-3 w-50">
                        <label>Item</label>
                        <select class="form-control" name="item" id="item" required>
                            <option disabled selected value="">Select</option>
                            <% while(rs_cat.next()) { %>
                            <option value="<%=rs_cat.getString("id")%>"><%=rs_cat.getString("name")%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label>Description</label>
                        <textarea name="description" id="description" class="form-control" required placeholder="Description"></textarea>
                    </div>
                    <div class="form-group mb-3">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <a href="package.jsp" class="btn btn-outline-dark">Back</a>
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

