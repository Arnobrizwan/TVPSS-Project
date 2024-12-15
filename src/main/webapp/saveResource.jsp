<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch form data
    String name = request.getParameter("name");
    String type = request.getParameter("type");
    String availability = request.getParameter("availability");

    // Fetch the resources list from the application context
    List<Map<String, String>> resources = (List<Map<String, String>>) application.getAttribute("resources");
    if (resources == null) {
        resources = new ArrayList<>();
        application.setAttribute("resources", resources);
    }

    // Add the new resource
    Map<String, String> newResource = new HashMap<>();
    newResource.put("name", name);
    newResource.put("type", type);
    newResource.put("availability", availability);
    resources.add(newResource);

    // Redirect back to manageResource.jsp
    response.sendRedirect("manageResource.jsp");
%>


