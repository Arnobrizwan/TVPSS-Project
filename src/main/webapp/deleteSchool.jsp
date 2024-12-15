<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Get the school ID from the request parameter
    String schoolId = request.getParameter("schoolId");

    // Fetch the school list from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");

    if (schools != null && schoolId != null) {
        // Debugging: Print schoolId and schools before deletion
        out.println("School ID to delete: " + schoolId);
        out.println("Schools before deletion: " + schools);

        // Remove the school with the matching ID
        boolean removed = schools.removeIf(school -> school.get("id").equals(schoolId));
        application.setAttribute("schools", schools); // Update the application context

        // Debugging: Print the result of removal
        if (removed) {
            out.println("School ID " + schoolId + " deleted successfully!");
        } else {
            out.println("School ID " + schoolId + " not found!");
        }
    } else {
        out.println("Invalid schoolId or schools list is null.");
    }

    // Redirect back to manageSchool.jsp
    response.sendRedirect("manageSchool.jsp");
%>

