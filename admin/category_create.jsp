<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Create Category</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <body>
        <%
            // Check user session and role
            if (session.getAttribute("user_id") != null && 
                Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        %>
        
        <%@ include file="navbar.jsp" %>
        
        <div class="container mt-3">
            <div class="row">
                <!-- Page Title -->
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">New Category</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                </div>
                
                <!-- Category Form -->
                <form class="col-md-4" method="post" action="category_form.jsp">
                    <!-- Hidden input to indicate form type -->
                    <input type="hidden" name="formType" value="formCategoryCreate" />
                    
                    <!-- Category Name Input -->
                    <div class="form-group mb-3">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" name="name" id="name" required placeholder="Enter category name" />
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
            }
             else {
                // Redirect to login page if user is not logged in or not an admin
                response.sendRedirect("../account/login.jsp");
            }
        %>
    </body>
</html>
