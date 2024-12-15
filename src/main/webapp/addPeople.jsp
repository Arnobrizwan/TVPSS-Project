<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch the role name from the query parameter
    String role = request.getParameter("role");

    // Fetch roles and associated users from the application context
    Map<String, List<String>> roleUsers = (Map<String, List<String>>) application.getAttribute("roleUsers");
    if (roleUsers == null || !roleUsers.containsKey(role)) {
        response.sendRedirect("roles.jsp");
        return;
    }

    // Add a new user to the role if submitted
    String newUser = request.getParameter("username");
    if (newUser != null && !newUser.trim().isEmpty()) {
        roleUsers.get(role).add(newUser.trim());
        application.setAttribute("roleUsers", roleUsers);
        request.setAttribute("successMessage", "User '" + newUser + "' added successfully to the role: " + role);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add People</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .btn {
            margin: 10px 0;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Add People to <%= role %></h1>
        
        <!-- Success Message -->
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success mt-3">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } %>

        <!-- Buttons -->
        <div class="text-center mt-4">
    <form action="addPeople.jsp" method="post" class="d-inline-block">
        <input type="hidden" name="role" value="<%= role %>">
        <button type="submit" class="btn btn-success me-2">Add User</button>
    </form>
    <a href="roles.jsp" class="btn btn-secondary d-inline-block">Back to Roles</a>
</div>

</body>
</html>






