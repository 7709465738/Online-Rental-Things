

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil,java.io.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Create Item</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        Statement st = null;
        String package_id = request.getParameter("package_id");
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from packages where id= '"+package_id+"'";
        rs = st.executeQuery(qur);
        if(rs.next()) {
        session.setAttribute("package_id", rs.getString("id"));
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Update image for <%=rs.getString("name")%></h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <form class="col-md-12" method="post" action="package_image_form.jsp" enctype="multipart/form-data">
                    <div class="form-group mb-3 w-50">
                        <label>Image</label>
                        <input type="file" accept=".jpg,.jpeg,.png" class="form-control" name="image" id="image" placeholder="Name" />
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
    <%      }
            else {
                out.println("Not found");
            }
        } 
        else {
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>


</html>
