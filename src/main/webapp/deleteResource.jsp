<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch the resource index to delete
    String resourceIndexParam = request.getParameter("resourceIndex");

    // Fetch the resources list from the application context
    List<Map<String, String>> resources = (List<Map<String, String>>) application.getAttribute("resources");
    if (resources != null && resourceIndexParam != null) {
        try {
            int resourceIndex = Integer.parseInt(resourceIndexParam);

            if (resourceIndex >= 0 && resourceIndex < resources.size()) {
                // Remove the resource at the given index
                resources.remove(resourceIndex);
                application.setAttribute("resources", resources);
            }
        } catch (NumberFormatException e) {
            out.println("<p>Error: Invalid resource index.</p>");
        }
    }

    // Redirect back to manageResource.jsp
    response.sendRedirect("manageResource.jsp");
%>
