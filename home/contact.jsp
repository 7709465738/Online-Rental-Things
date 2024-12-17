
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
                        
             <div class="row">
                 <div class="col-md-6 offset-md-3">
                     <h2 class="text-center">Contact Us</h2>
                     <form method="post" action="contact_form.jsp">
                         <div class="form-group">
                             <label for="name">Name:</label>
                             <input type="text" class="form-control" id="name" name="name" required placeholder="Enter your name">
                         </div>
                         <div class="form-group">
                             <label for="email">Email address:</label>
                             <input type="email" class="form-control" id="email" name="email" required placeholder="Enter your email">
                         </div>
                         <div class="form-group">
                             <label for="message">Message:</label>
                             <textarea class="form-control" id="message" name="message" rows="3" required placeholder="Enter your message"></textarea>
                         </div>
                         <button type="submit" class="btn btn-primary">Submit</button>
                     </form>
                 </div>
             </div>
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>
    </body>
</html>
