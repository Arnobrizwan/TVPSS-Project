<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch roles from the application context
    List<Map<String, String>> roles = (List<Map<String, String>>) application.getAttribute("roles");
    if (roles == null) {
        response.sendRedirect("roles.jsp");
        return;
    }

    // Get the index of the role to delete
    String roleIndexParam = request.getParameter("roleIndex");
    if (roleIndexParam != null) {
        try {
            int roleIndex = Integer.parseInt(roleIndexParam);
            if (roleIndex >= 0 && roleIndex < roles.size()) {
                roles.remove(roleIndex); // Remove the role
                application.setAttribute("roles", roles); // Update the application context
            }
        } catch (NumberFormatException e) {
            // Handle invalid index
        }
    }

    response.sendRedirect("roles.jsp"); // Redirect back to roles.jsp
%>

