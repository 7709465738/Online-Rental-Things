
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
        if(session.getAttribute("user_id") != null) 
        {
        Connection con = null;
        Statement st = null;
        String item_id = request.getParameter("item_id");
        con = Dbutil.conn();
        st = con.createStatement();
        ResultSet rs;
        String qur="select * from product_items where id='"+item_id+"' limit 1";
        rs = st.executeQuery(qur); 
        }      
    %>
    <body>
         
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <h2 class="text-center text-primary mt-3">RENT THINGS</h2>
            <h4 class="text-center">Empower Your Experience: Rent, Enjoy, Return</h4>
                        
            
           <div class="row"> 
                <% while (rs.next())
                 { 
                    %>
                <div class="col-md-4 mb-2">
                    <div class="card">
                            <div class="card-body">
                                <img src="http://localhost:8080/rent-thing/img/<%=rs.getString("image")%>" class="w-100" />                                
                            </div>
                        </div>         
                 </div>   
                 <div class="col-md-8 mb-2">
                   <div class="card">
                            <div class="card-body">                                
                                <h4><%=rs.getString("name")%></h4>  
                                <p><%=rs.getString("description")%></p>
                            </div>
                        </div>        
                </div>  
                            
                <%
                    Statement st2 = null;
                    st2 = con.createStatement();
                    ResultSet rs2;
                    String qur2="select * from packages where item_id='"+rs.getString("id")+"'";
                    rs2 = st2.executeQuery(qur2);   
                %>
                <h3 class="text-center">Packages</h3>  
                <div class="row mt-4">
                <% while (rs2.next()) 
                {
                    
                    
                    %>
                    <div class="col-md-3 mb-2">
                        <a href="checkout.jsp?item_id=<%=rs.getString("id")%>&package_id=<%=rs2.getString("id")%>&cat_id=<%=rs.getString("category")%>">
                            <div class="card">
                                <div class="card-body">
                                    <img src="http://localhost:8080/rent-thing/img/<%=rs2.getString("image")%>" class="w-100" />
                                    <h4 class="text-center"><%=rs2.getString("name")%></h4>        
                                </div>
                            </div>     
                        </a>            
                     </div>
                <% } %>
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
