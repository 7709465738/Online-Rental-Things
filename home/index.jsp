
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
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from category order by id DESC";
        rs = st.executeQuery(qur);
    %>
    <body>
         
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <h2 class="text-center text-primary mt-3">RENT THINGS</h2>
            <h4 class="text-center">Empower Your Experience: Rent, Enjoy, Return</h4>
            
            <div class="row mt-3">
                <div class="col-md-12">
                    <form method="post" action="search.jsp">
                        <div class="input-group">
                            <input type="text" id="search_text" name="search_text" class="form-control" placeholder="Search" />
                            <button type="submit" class="btn btn-primary">Search</button>
                        </div>
                    </form>
                </div>
            </div>
                           
                
            <div class="row mt-2">
            <% while (rs.next()) {%>
                <div class="col-md-4 mb-2">
                    <a href="items.jsp?cat_id=<%=rs.getString("id")%>">
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
                      
            <div class="row mt-5">
                <div class="col-md-12">
                    <h4 class="text-center">Welcome to RentThings!</h4>
                </div>
                <div class="col-md-6 mb-3">
                    At RentThings, we're dedicated to revolutionizing the way you access the items you need, when you need them. Whether it's for a college project, a DIY home improvement task, or simply to try out something new, we've got you covered.
                </div>
                <div class="col-md-6 mb-3">
                    With our user-friendly platform, renting items has never been easier. Browse through our extensive catalog of tools, equipment, electronics, and more, all available for flexible rental periods to suit your schedule.
                </div>
                <div class="col-md-12 mb-3">
                    Why buy when you can rent? Save money, reduce clutter, and embrace a more sustainable lifestyle by renting the things you need for a particular duration. Plus, with our secure payment system and reliable customer service, you can rest assured that your renting experience will be smooth and hassle-free.
                </div>
                <div class="col-md-12 mb-3">
                    Join the RentThings community today and unlock a world of convenience, affordability, and endless possibilities. Rent, enjoy, return - it's that simple!
                </div>
            </div>
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>        
    </body>
    <% 
        } 
        else {
            response.sendRedirect("../account/login.jsp");
        } 
    %>
</html>
