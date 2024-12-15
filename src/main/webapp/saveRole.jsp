<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save Role</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Saving Role...</h1>
        <%
            // Fetch roles from the application context
            List<Map<String, String>> roles = (List<Map<String, String>>) application.getAttribute("roles");
            if (roles == null) {
                roles = new ArrayList<>();
                application.setAttribute("roles", roles);
            }

            // Get form data
            String role = request.getParameter("role");
            String description = request.getParameter("description");

            if (role != null && !role.trim().isEmpty() && description != null && !description.trim().isEmpty()) {
                // Check if the role already exists
                boolean roleExists = roles.stream().anyMatch(r -> r.get("name").equalsIgnoreCase(role));
                
                if (!roleExists) {
                    // Add new role
                    Map<String, String> newRole = new HashMap<>();
                    newRole.put("name", role);
                    newRole.put("description", description);
                    roles.add(newRole);

                    // Success message
                    request.setAttribute("successMessage", "Role '" + role + "' added successfully!");
                } else {
                    // Error message for duplicate role
                    request.setAttribute("errorMessage", "Role '" + role + "' already exists. Please try a different name.");
                }
            } else {
                // Error message for invalid input
                request.setAttribute("errorMessage", "Error: Role name or description is missing!");
            }
        %>
        <!-- Display success or error messages -->
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success mt-3">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } else if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger mt-3">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        <div class="text-center mt-4">
            <a href="roles.jsp" class="btn btn-secondary">Back to Role Management</a>
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>
    </div>
</body>
</html>



