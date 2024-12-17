

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
        String item_id = request.getParameter("item_id");
        String package_id = request.getParameter("package_id");
        String cat_id = request.getParameter("cat_id");
        con = Dbutil.conn();        
        
        Statement st = null;
        st=con.createStatement();         
        String qur="select * from product_items where id='"+item_id+"' limit 1";
        ResultSet rs_items = st.executeQuery(qur);       
        
        Statement st2 = null;
        st2=con.createStatement(); 
        String qur2="select * from packages where id='"+package_id+"' limit 1";
        ResultSet rs_package = st2.executeQuery(qur2);       

        Statement st3 = null;
        st3=con.createStatement(); 
        String qur3="select * from category where id='"+cat_id+"' limit 1";
        ResultSet rs_category = st3.executeQuery(qur3);       
    %>
    <body>
         
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <h2 class="text-center text-primary mt-3">RENT THINGS</h2>
            <h4 class="text-center">Empower Your Experience: Rent, Enjoy, Return</h4>
                        
             <%@ include file="../partials/msgs.jsp" %> 
           <div class="row"> 
                <% while (rs_items.next()) {
                rs_package.next();
                rs_category.next();
                %>
                <div class="col-md-4 mb-2">
                   <div class="card">
                        <div class="card-body">                                
                            <h4><%=rs_items.getString("name")%></h4>  
                            <p><b>Description :</b> <%=rs_items.getString("description")%></p>
                            <h5><%=rs_category.getString("name")%></h5>
                            <h5><%=rs_package.getString("name")%></h5>
                            <p><b>Description :</b> <%=rs_package.getString("description")%></p>                            
                            <p><b>Price :</b> <%=rs_package.getString("amount")%></p>
                            
                            <form class="col-md-12" method="post" action="checkout_code.jsp">     
                                <input type="hidden" name="formType" value="formCheckoutCreate" />
                                
                                <input type="hidden" name="user_id" value="<%=session.getAttribute("user_id")%>" />
                                <input type="hidden" name="item_id" value="<%=rs_items.getString("id")%>" />
                                <input type="hidden" name="package_id" value="<%=rs_package.getString("id")%>" />
                                <input type="hidden" name="amount" value="<%=rs_package.getString("amount")%>" />                                
                                
                                <div class="form-group mb-3">
                                    <label for="name">Duration(days)</label>
                                    <input type="number" class="form-control" id="duration" name="duration" required placeholder="Duration(days">
                                </div>
                                <div class="form-group mb-3">
                                    <label>Address</label>
                                    <textarea name="address" id="address" class="form-control" required placeholder="Address"></textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Payment Method</label>
                                    <select class="form-control" name="paytype" id="paytype" required>
                                        <option selected value="">Select</option>
                                        <option value="Online">Online</option>
                                        <option value="Cash On Delivery">Cash On Delivery</option>
                                    </select>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-12">
                                        <button class="btn btn-primary" type="submit">Checkout</button>                                        
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>        
                </div>                             
                <div class="col-md-8 mb-2">
                    <div class="card">
                        <div class="card-body">
                            <img src="http://localhost:8080/rent-thing/img/<%=rs_items.getString("image")%>" class="w-50" />                                
                        </div>
                    </div>         
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
