<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <body>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                con = Dbutil.conn();
                String checkAdminQuery = "SELECT * FROM users WHERE role = 1 LIMIT 1";
                ps = con.prepareStatement(checkAdminQuery);
                rs = ps.executeQuery();

                if (!rs.next()) {
                    String name = "Admin";
                    String email = "admin@gmail.com";
                    String mobile = "9999000090";
                    String password = "admin@123"; // Ideally, hash this password before inserting

                    String insertAdminQuery = "INSERT INTO users (name, email, mobile, password, role) VALUES (?, ?, ?, ?, 1)";
                    try (PreparedStatement insertPs = con.prepareStatement(insertAdminQuery)) {
                        insertPs.setString(1, name);
                        insertPs.setString(2, email);
                        insertPs.setString(3, mobile);
                        insertPs.setString(4, password); // Ensure to hash this
                        insertPs.executeUpdate();
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
                // Log the error and show a generic message to the user
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            }
        %>
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-4">
                    <h2>Login</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                    <form method="post" action="form.jsp">
                        <input type="hidden" name="formType" value="formLogin" />
                        <div class="form-group mb-2">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email" class="form-control" required />
                        </div>
                        <div class="form-group mb-2">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Enter your password" class="form-control" required />
                        </div>
                        <div class="form-group mb-2">
                            <button type="submit" name="btnLogin" id="btnLogin" class="btn btn-primary">Login</button>
                        </div>
                    </form>
                    <div class="mt-3">
                        Don't have an account? <a href="register.jsp">Register</a> now
                    </div>
                </div>
                <div class="offset-md-1 col-md-7">
                    <img src="../img/1.jpg" alt="Login illustration" class="w-100"/>
                </div>
            </div>
        </div>
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>
    </body>
</html>
