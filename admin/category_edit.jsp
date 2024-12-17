<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Edit Category</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <body>
        <%
            // Check if the user is logged in and has admin privileges
            if (session.getAttribute("user_id") != null && 
                Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {

                // Initialize database objects
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                // Get the category ID from the request
                String cat_id = request.getParameter("cat_id");
                
                try {
                    con = Dbutil.conn();
                    
                    // Use PreparedStatement to prevent SQL Injection
                    String query = "SELECT * FROM category WHERE id = ?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setString(1, cat_id);
                    
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
        %>

        <%@ include file="navbar.jsp" %>

        <div class="container mt-3">
            <div class="row">
                <!-- Page Title -->
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Edit Category</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>

                <!-- Edit Category Form -->
                <form class="col-md-4" method="post" action="category_form.jsp">
                    <!-- Hidden Inputs for Form Identification and Category ID -->
                    <input type="hidden" name="formType" value="formCategoryEdit" />
                    <input type="hidden" name="cat_id" value="<%=rs.getString("id")%>" />
                    
                    <!-- Category Name Field -->
                    <div class="form-group mb-3">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="name" id="name" 
                               required placeholder="Enter category name" 
                               value="<%=rs.getString("name")%>" />
                    </div>
                    
                    <!-- Submit and Back Buttons -->
                    <div class="form-group mb-3">
                        <button class="btn btn-primary" type="submit">Submit</button>
                        <a href="category.jsp" class="btn btn-outline-dark">Back</a>
                    </div>
                </form>
            </div>
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>

        <%
                    } else {
                        // If category not found, display an error message
                        out.println("<div class='container mt-3'><p class='text-danger'>Category not found.</p></div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='container mt-3'><p class='text-danger'>Error: " + e.getMessage() + "</p></div>");
                } finally {
                    // Close resources
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (con != null) con.close();
                }
            } else {
                // Redirect unauthorized users to the login page
                response.sendRedirect("../account/login.jsp");
            }
        %>
    </body>
</html>
