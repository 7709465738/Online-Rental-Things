<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<%
    String formType = request.getParameter("formType");

    if (formType != null) {
        try (Connection con = Dbutil.conn()) {
            if ("formCategoryCreate".equals(formType)) {
                // Handle Category Creation
                String name = request.getParameter("name");

                String query = "INSERT INTO category (name) VALUES (?)";
                try (PreparedStatement pstmt = con.prepareStatement(query)) {
                    pstmt.setString(1, name);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        request.setAttribute("successMessage", "Category added successfully.");
                        request.getRequestDispatcher("category.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Failed to add category. Please try again.");
                        request.getRequestDispatcher("category_create.jsp").forward(request, response);
                    }
                }
            } else if ("formCategoryEdit".equals(formType)) {
                // Handle Category Edit
                String name = request.getParameter("name");
                String cat_id = request.getParameter("cat_id");

                String query = "UPDATE category SET name = ? WHERE id = ?";
                try (PreparedStatement pstmt = con.prepareStatement(query)) {
                    pstmt.setString(1, name);
                    pstmt.setString(2, cat_id);
                    int rowsAffected = pstmt.executeUpdate();

                    if (rowsAffected > 0) {
                        request.setAttribute("successMessage", "Category updated successfully.");
                        request.getRequestDispatcher("category.jsp").forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Failed to update category. Please try again.");
                        request.getRequestDispatcher("category.jsp").forward(request, response);
                    }
                }
            } else {
                request.setAttribute("errorMessage", "Invalid form type.");
                request.getRequestDispatcher("category.jsp").forward(request, response);
            }
        } catch (Exception ex) {
            // Catch general exceptions and forward to error page
            request.setAttribute("errorMessage", "An error occurred: " + ex.getMessage());
            request.getRequestDispatcher("category.jsp").forward(request, response);
        }
    } else {
        // If formType is null, redirect to the category page
        response.sendRedirect("category.jsp");
    }
%>
