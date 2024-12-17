

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Create Delivery Boy</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) { 
 Connection con = null;
            Statement st = null;
            String user_id = request.getParameter("user_id");
            con = Dbutil.conn();
            st = con.createStatement();
            ResultSet rs;
            String qur="select * from users where id= '"+user_id+"'";
            rs = st.executeQuery(qur);
            if(rs.next()) {
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Edit Delivery boy</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                <form class="col-md-12" method="post" action="delivery_boys_form.jsp">
                    <input type="hidden" name="formType" value="formEdit" />
                    <input type="hidden" name="user_id" value="<%=rs.getString("id")%>" />
                    <div class="form-group mb-3 w-50">
                        <label>Name</label>
                        <input type="text" class="form-control" name="name" id="name" value="<%=rs.getString("name")%>" required placeholder="Name" />
                    </div>
                    <div class="form-group mb-3 w-50">
                        <label>Email</label>
                        <input type="text" class="form-control" name="email" id="email" value="<%=rs.getString("email")%>" required placeholder="Email" />
                    </div>
                    <div class="form-group mb-3 w-50">
                        <label>Mobile</label>
                        <input type="text" class="form-control" name="mobile" id="mobile" value="<%=rs.getString("mobile")%>" required placeholder="Mobile" />
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

