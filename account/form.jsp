<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, db.Dbutil"%>
<%@page import="java.security.MessageDigest"%>
<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    String formType = request.getParameter("formType");

    try
     {
        con = Dbutil.conn();

        if ("formLogin".equals(formType)) {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // Hash the password before checking
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            String hashedPassword = new String(md.digest());

            String query = "SELECT * FROM users WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, hashedPassword);

            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("user_id", rs.getString("id"));
                session.setAttribute("user_name", rs.getString("name"));
                session.setAttribute("user_role", rs.getString("role"));

                int role = rs.getInt("role");
                if (role == 3 || role == 2) {
                    response.sendRedirect("../home/index.jsp");
                } else if (role == 1) {
                    response.sendRedirect("../admin/index.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "Invalid email or password.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } else if ("formRegister".equals(formType)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String password = request.getParameter("password");

            // Hash the password before storing
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            String hashedPassword = new String(md.digest());

            String query = "INSERT INTO users (name, email, mobile, password, role) VALUES (?, ?, ?, ?, 3)";
            ps = con.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, mobile);
            ps.setString(4, hashedPassword);

            int result = ps.executeUpdate();

            if (result > 0) {
                request.setAttribute("successMessage", "Registration successful. Please log in.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
    } catch (Exception ex) {
        // Log the exception
        ex.printStackTrace();
        request.setAttribute("errorMessage", "An error occurred. Please try again later.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
