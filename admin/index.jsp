

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,db.Dbutil,java.text.DateFormat,java.util.Locale,java.util.Calendar,java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Dashboard</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <%
        if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) {
        Connection con = null;
        con = Dbutil.conn();
    %>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-12 mb-3">
                    <h2 class="text-primary">Admin Home</h2>
                </div>
            </div>
            <div class="row">                
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-info shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Total Users</div>
                                    <%                                    
                                    Statement st_totalusers = null;                                    
                                    st_totalusers = con.createStatement();
                                    ResultSet rs_totalusers;
                                    String qur_totalusers="select COUNT(*) AS user_count from users where role=3";
                                    rs_totalusers = st_totalusers.executeQuery(qur_totalusers);
                                    if(rs_totalusers.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalusers.getString("user_count")%></div>
                                    <%}%>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Pending Requests Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Total Items</div>
                                    <%                                    
                                    Statement st_totalitems = null;                                    
                                    st_totalitems = con.createStatement();
                                    ResultSet rs_totalitems;
                                    String qur_totalitems="select COUNT(*) AS item_count from product_items";
                                    rs_totalitems = st_totalitems.executeQuery(qur_totalitems);
                                    if(rs_totalitems.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalitems.getString("item_count")%></div>
                                    <%}%>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Total Categories</div>
                                     <%                                    
                                    Statement st_totalcategory = null;                                    
                                    st_totalcategory = con.createStatement();
                                    ResultSet rs_totalcategory;
                                    String qur_totalcategory="select COUNT(*) AS category_count from category";
                                    rs_totalcategory = st_totalcategory.executeQuery(qur_totalcategory);
                                    if(rs_totalcategory.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalcategory.getString("category_count")%></div>
                                    <%}%>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                        Total Packages</div>
                                     <%                                    
                                    Statement st_totalpackage = null;                                    
                                    st_totalpackage = con.createStatement();
                                    ResultSet rs_totalpackage;
                                    String qur_totalpackage="select COUNT(*) AS package_count from packages";
                                    rs_totalpackage = st_totalpackage.executeQuery(qur_totalpackage);
                                    if(rs_totalpackage.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalpackage.getString("package_count")%></div>
                                    <%}%>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Earnings (today)</div>
                                    <%                                    
                                    Statement st_totalamounttoday = null;                                    
                                    st_totalamounttoday = con.createStatement();
                                    ResultSet rs_totalamounttoday;
                                   
                                    String qur_totalamounttoday="select SUM(amount) AS total from orders where date=CURDATE()";
                                    rs_totalamounttoday = st_totalamounttoday.executeQuery(qur_totalamounttoday);
                                    if(rs_totalamounttoday.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalamounttoday.getString("total")%></div>
                                    <%}%>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Earnings (Monthly)</div>
                                     <%                                    
                                    Statement st_totalamountmonthly = null;                                    
                                    st_totalamountmonthly = con.createStatement();
                                    ResultSet rs_totalamountmonthly;
                                                                       
                                    String qur_totalamountmonthly="select SUM(amount) AS total from orders WHERE YEAR(date) = YEAR(CURDATE()) AND MONTH(date) = MONTH(CURDATE())";
                                    rs_totalamountmonthly = st_totalamountmonthly.executeQuery(qur_totalamountmonthly);
                                    if(rs_totalamountmonthly.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalamountmonthly.getString("total")%></div>
                                    <%}%>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Earnings (Monthly) Card Example -->
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-success shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Earnings (Annual)</div>
                                    <%                                    
                                    Statement st_totalamountyearly = null;                                    
                                    st_totalamountyearly = con.createStatement();
                                    ResultSet rs_totalamountyearly;
                                                                       
                                    String qur_totalamountyearly="select SUM(amount) AS total from orders WHERE YEAR(date) = YEAR(CURDATE())";
                                    rs_totalamountyearly = st_totalamountyearly.executeQuery(qur_totalamountyearly);
                                    if(rs_totalamountyearly.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalamountyearly.getString("total")%></div>
                                    <%}%>
                                </div>                               
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                        Total Orders (Today)</div>
                                     <%                                    
                                    Statement st_totalcounttoday = null;                                    
                                    st_totalcounttoday = con.createStatement();
                                    ResultSet rs_totalcounttoday;
                                   
                                    String qur_totalcounttoday="select COUNT(*) AS total from orders where date=CURDATE()";
                                    rs_totalcounttoday = st_totalcounttoday.executeQuery(qur_totalcounttoday);
                                    if(rs_totalcounttoday.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalcounttoday.getString("total")%></div>
                                    <%}%>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                        Total Orders (Monthly)</div>
                                     <%                                    
                                    Statement st_totalcountmonthly = null;                                    
                                    st_totalcountmonthly = con.createStatement();
                                    ResultSet rs_totalcountmonthly;
                                                                       
                                    String qur_totalcountmonthly="select COUNT(*) AS total from orders WHERE YEAR(date) = YEAR(CURDATE()) AND MONTH(date) = MONTH(CURDATE())";
                                    rs_totalcountmonthly = st_totalcountmonthly.executeQuery(qur_totalcountmonthly);
                                    if(rs_totalcountmonthly.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalcountmonthly.getString("total")%></div>
                                    <%}%>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 mb-4">
                    <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
                                        Total Orders (Annual)</div>
                                    <%                                    
                                    Statement st_totalcountyearly = null;                                    
                                    st_totalcountyearly = con.createStatement();
                                    ResultSet rs_totalcountyearly;
                                                                       
                                    String qur_totalcountyearly="select COUNT(*) AS total from orders WHERE YEAR(date) = YEAR(CURDATE())";
                                    rs_totalcountyearly = st_totalcountyearly.executeQuery(qur_totalcountyearly);
                                    if(rs_totalcountyearly.next())
                                    {
                                    %>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800"><%=rs_totalcountyearly.getString("total")%></div>
                                    <%}%>
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
                
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

