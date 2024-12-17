
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp">Rent Thing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="about.jsp">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.jsp">Contact</a>
                </li>
                <% if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 1) { %>
                <li class="nav-item dropdown" data-bs-theme="light">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">My Account</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../admin/orders.jsp">Orders</a>
                        <a class="dropdown-item" href="../admin/category.jsp">Category</a>
                        <a class="dropdown-item" href="../admin/item.jsp">Items</a>
                        <a class="dropdown-item" href="../admin/package.jsp">Packages</a>
                        <a class="dropdown-item" href="../admin/messages.jsp">Messages</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../account/logout.jsp">Logout</a>
                    </div>
                </li>
                 <% } else if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 2) { %>
                <li class="nav-item dropdown" data-bs-theme="light">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">My Account</a>
                    <div class="dropdown-menu">
                        
                        <a class="dropdown-item" href="orders_delivery_boy.jsp">Orders</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../account/logout.jsp">Logout</a>
                    </div>
                </li>
                <% } else if(session.getAttribute("user_id") != null && Integer.parseInt(session.getAttribute("user_role").toString()) == 3) { %>
                <li class="nav-item dropdown" data-bs-theme="light">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">My Account</a>
                    <div class="dropdown-menu">
                        
                        <a class="dropdown-item" href="orders.jsp">Orders</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../account/logout.jsp">Logout</a>
                    </div>
                </li>
                <% } else { %>
                <li class="nav-item dropdown" data-bs-theme="light">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Guest</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="../account/login.jsp">Login</a>
                        <a class="dropdown-item" href="../account/register.jsp">Register</a>
                    </div>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>