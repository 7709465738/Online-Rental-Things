<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Register</title>
        <%@ include file="../partials/allcss.jsp" %>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <div class="row mt-3">
                <!-- Registration Form Section -->
                <div class="col-md-4">
                    <h2>Register</h2>
                    <%@ include file="../partials/msgs.jsp" %>
                    <form method="post" action="form.jsp" novalidate>
                        <!-- Hidden field to identify form type -->
                        <input type="hidden" name="formType" value="formRegister" />
                        
                        <!-- Name Input -->
                        <div class="form-group mb-2">
                            <label for="name">Name</label>
                            <input type="text" id="name" name="name" placeholder="Enter your full name" class="form-control" required />
                        </div>
                        
                        <!-- Email Input -->
                        <div class="form-group mb-2">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" placeholder="Enter your email" class="form-control" required />
                        </div>
                        
                        <!-- Mobile Input -->
                        <div class="form-group mb-2">
                            <label for="mobile">Mobile</label>
                            <input type="tel" id="mobile" name="mobile" placeholder="Enter your mobile number" pattern="[0-9]{10}" class="form-control" required />
                        </div>
                        
                        <!-- Password Input -->
                        <div class="form-group mb-2">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" placeholder="Create your password" class="form-control" required minlength="6" />
                        </div>
                        
                        <!-- Submit Button -->
                        <div class="form-group mb-2">
                            <button type="submit" name="btnRegister" id="btnRegister" class="btn btn-primary">Register</button>
                        </div>
                    </form>
                    <!-- Redirect to Login -->
                    <div class="mt-3">
                        Already have an account? <a href="login.jsp">Login</a> now
                    </div>
                </div>
                
                <!-- Image Section -->
                <div class="offset-md-1 col-md-7">
                    <img src="../img/4.jpg" alt="Registration Illustration" class="w-100" />
                </div>
            </div>
        </div>
        
        <%@ include file="../partials/footer.jsp" %>
        <%@ include file="../partials/alljs.jsp" %>
    </body>
</html>
