

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
    <body>
         
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <h2 class="text-center text-primary mt-3">RENT THINGS</h2>
            <h4 class="text-center">Empower Your Experience: Rent, Enjoy, Return</h4>
            
            <div class="row mt-3">
                <div class="col-md-12">
                    <img src="https://crankwheel.com/static/images/uploads/2019/06/12/CW_How%20to%20deliver%20the%20perfect%20instant%20online%20product%20demo.jpg" />
                </div>
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
    </body>
</html>
