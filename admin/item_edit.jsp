
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Edit Item</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        Statement st_cat = null;
        con = Dbutil.conn();
        st_cat = con.createStatement();
        ResultSet rs_cat;
        String qur_cat="select * from category order by name ASC";
        rs_cat = st_cat.executeQuery(qur_cat);
        
        Statement st = null;
        String product_items = request.getParameter("item_id");
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from product_items where id= '"+product_items+"'";
        rs = st.executeQuery(qur);
        if(rs.next()) {
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Edit Item</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <form class="col-md-12" method="post" action="item_form.jsp">
                    <input type="hidden" name="formType" value="formItemEdit" />
                    <input type="hidden" name="item_id" value="<%=rs.getString("id")%>" />
                    <div class="form-group mb-3 w-50">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" id="name" required placeholder="Name" value="<%=rs.getString("name")%>" />
                    </div>
                    <div class="form-group mb-3 w-50">
                        <label>Category</label>
                        <select class="form-control" name="category" id="category" required>
                            <option disabled selected value="">Select</option>
                            <% while(rs_cat.next()) { %>
                            <option value="<%=rs_cat.getString("id")%>" <% if (rs.getString("category").equals(rs_cat.getString("id"))) { %> selected <% } %>><%=rs_cat.getString("name")%></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="form-group mb-3">
                        <label>Description</label>
                        <textarea name="description" id="description" class="form-control" required placeholder="Description"><%=rs.getString("description")%></textarea>
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
                out.println("Not found");
            }
        } 
        else {
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>

