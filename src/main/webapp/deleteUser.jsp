<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch roles and associated users from the application context
    Map<String, List<String>> roleUsers = (Map<String, List<String>>) application.getAttribute("roleUsers");
    if (roleUsers == null) {
        response.sendRedirect("roles.jsp"); // Redirect to roles.jsp if roleUsers map is not initialized
        return;
    }

    // Get role and user to delete
    String role = request.getParameter("role");
    String user = request.getParameter("user");

    // Check if role and user parameters are valid
    if (role != null && user != null) {
        if (roleUsers.containsKey(role) && roleUsers.get(role).contains(user)) {
            roleUsers.get(role).remove(user); // Remove user from the role
            application.setAttribute("roleUsers", roleUsers); // Update the application context
            request.setAttribute("successMessage", "User '" + user + "' successfully removed from role: " + role);
        } else {
            request.setAttribute("errorMessage", "Error: Role or User not found.");
        }
    } else {
        request.setAttribute("errorMessage", "Error: Invalid role or user parameters.");
    }

    // Redirect back to roles.jsp with messages
    response.sendRedirect("roles.jsp");
%>



