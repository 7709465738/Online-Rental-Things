<%-- 
    Document   : msgs
    Created on : 23-Mar-2024, 3:59:50 pm
    Author     : Afsar Shaikh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
<%-- Display the error message if it exists --%>
<% if (errorMessage != null && !errorMessage.isEmpty()) { %>
    <div class="alert alert-danger">
        <%= errorMessage %>
    </div>
<% } %>

<% String successMessage = (String) request.getAttribute("successMessage"); %>
<%-- Display the error message if it exists --%>
<% if (successMessage != null && !successMessage.isEmpty()) { %>
    <div class="alert alert-success">
        <%= successMessage %>
    </div>
<% } %>
