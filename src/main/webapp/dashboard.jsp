<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch data from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");
    if (schools == null) {
        schools = new ArrayList<>();
        application.setAttribute("schools", schools);
    }

    List<String> roles = (List<String>) application.getAttribute("roles");
    if (roles == null) {
        roles = new ArrayList<>(Arrays.asList("Admin", "Super Admin", "User"));
        application.setAttribute("roles", roles);
    }

    List<Map<String, String>> resources = (List<Map<String, String>>) application.getAttribute("resources");
    if (resources == null) {
        resources = new ArrayList<>();
        application.setAttribute("resources", resources);
    }

    List<Map<String, String>> activities = (List<Map<String, String>>) application.getAttribute("activities");
    if (activities == null) {
        activities = new ArrayList<>();
        application.setAttribute("activities", activities);
    }

    // Count totals dynamically
    int totalSchools = schools.size();
    int totalRoles = roles.size();
    int totalResources = resources.size();
    int totalActivities = activities.size();
    int activeUsers = 10; // Example static data for active users
    int totalContentUploaded = 25; // Example static data for content
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Dashboard</h1>
        <p class="text-center text-secondary">Overview of system statistics and activities:</p>
        <ul class="list-group mt-4">
            <li class="list-group-item">Total Roles: <strong><%= totalRoles %></strong></li>
            <li class="list-group-item">Total Schools: <strong><%= totalSchools %></strong></li>
            <li class="list-group-item">Total Resources: <strong><%= totalResources %></strong></li>
            <li class="list-group-item">Total Activities: <strong><%= totalActivities %></strong></li>
            <li class="list-group-item">Total Content Uploaded: <strong><%= totalContentUploaded %></strong></li>
            <li class="list-group-item">Active Users: <strong><%= activeUsers %></strong></li>
        </ul>
        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch data from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");
    if (schools == null) {
        schools = new ArrayList<>();
        application.setAttribute("schools", schools);
    }

    // Dynamically fetch roles
    List<Map<String, String>> roles = (List<Map<String, String>>) application.getAttribute("roles");
    if (roles == null) {
        roles = new ArrayList<>();
        application.setAttribute("roles", roles);
    }

    List<Map<String, String>> resources = (List<Map<String, String>>) application.getAttribute("resources");
    if (resources == null) {
        resources = new ArrayList<>();
        application.setAttribute("resources", resources);
    }

    List<Map<String, String>> activities = (List<Map<String, String>>) application.getAttribute("activities");
    if (activities == null) {
        activities = new ArrayList<>();
        application.setAttribute("activities", activities);
    }

    // Count totals dynamically
    int totalSchools = schools.size();
    int totalRoles = roles.size(); // Updated dynamically
    int totalResources = resources.size();
    int totalActivities = activities.size();
    int activeUsers = 10; // Example static data for active users
    int totalContentUploaded = 25; // Example static data for content
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Dashboard</h1>
        <p class="text-center text-secondary">Overview of system statistics and activities:</p>
        <ul class="list-group mt-4">
            <li class="list-group-item">Total Roles: <strong><%= totalRoles %></strong></li>
            <li class="list-group-item">Total Schools: <strong><%= totalSchools %></strong></li>
            <li class="list-group-item">Total Resources: <strong><%= totalResources %></strong></li>
            <li class="list-group-item">Total Activities: <strong><%= totalActivities %></strong></li>
            <li class="list-group-item">Total Content Uploaded: <strong><%= totalContentUploaded %></strong></li>
            <li class="list-group-item">Active Users: <strong><%= activeUsers %></strong></li>
        </ul>
        <div class="text-center mt-4">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>



