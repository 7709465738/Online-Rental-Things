

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
    <div class="container">
        <a class="navbar-brand" href="../home/index.jsp">Rent Thing</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarColor01">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../home/about.jsp">About</a>
                </li>
                <li class="nav-item dropdown" data-bs-theme="light">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">My Account</a>
                    <div class="dropdown-menu">                        
                        <a class="dropdown-item" href="orders.jsp">Orders</a>
                        <a class="dropdown-item" href="category.jsp">Category</a>
                        <a class="dropdown-item" href="item.jsp">Items</a>
                        <a class="dropdown-item" href="package.jsp">Packages</a>
                        <a class="dropdown-item" href="messages.jsp">Messages</a>
                        <a class="dropdown-item" href="delivery_boys.jsp">Delivery Boys</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="../account/logout.jsp">Logout</a>
                    </div>
                </li>
            </ul>

        </div>
    </div>
</nav>