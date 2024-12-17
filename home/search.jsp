
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Rent Thing</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    
     <%
        if(session.getAttribute("user_id") != null) {
        Connection con = null;
        Statement st = null;
        String search_text = request.getParameter("search_text");
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from product_items where name LIKE '%"+search_text+"%' order by id DESC";
        rs = st.executeQuery(qur);
    %>
    <body>
         
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <h2 class="text-center text-primary mt-3">RENT THINGS</h2>
            <h4 class="text-center">Empower Your Experience: Rent, Enjoy, Return</h4>
                        
            
            <div class="row mt-4">
            <% while (rs.next()) {%>
                <div class="col-md-4 mb-2">
                    <a href="item_details.jsp?item_id=<%=rs.getString("id")%>">
                        <div class="card">
                            <div class="card-body">
                                <img src="http://localhost:8080/rent-thing/img/<%=rs.getString("image")%>" class="w-100" />
                                <h4 class="text-center"><%=rs.getString("name")%></h4>        
                            </div>
                        </div>     
                    </a>            
                 </div>
            <% } %>
            </div>
                                 
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>
    </body>
    <% 
        } 
        else {
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>
