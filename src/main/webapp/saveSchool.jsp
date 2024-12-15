<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch the school list from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");

    if (schools == null) {
        schools = new ArrayList<>();
        application.setAttribute("schools", schools);
    }

    // Get form parameters
    String schoolName = request.getParameter("schoolName");
    String schoolAddress = request.getParameter("schoolAddress");
    String principalName = request.getParameter("principalName");
    String totalStudents = request.getParameter("totalStudents");

    if (schoolName != null && !schoolName.trim().isEmpty() &&
        schoolAddress != null && !schoolAddress.trim().isEmpty() &&
        principalName != null && !principalName.trim().isEmpty() &&
        totalStudents != null && !totalStudents.trim().isEmpty()) {

        // Check for duplicate school entries
        boolean isDuplicate = schools.stream()
            .anyMatch(school -> school.get("name").equalsIgnoreCase(schoolName));

        if (!isDuplicate) {
            // Add the school if it's not a duplicate
            String newId = String.valueOf(schools.size() + 1); // Generate a new ID
            Map<String, String> newSchool = new HashMap<>();
            newSchool.put("id", newId);
            newSchool.put("name", schoolName);
            newSchool.put("address", schoolAddress);
            newSchool.put("principal", principalName);
            newSchool.put("students", totalStudents);
            schools.add(newSchool);

            // Success message
            request.setAttribute("successMessage", "School '" + schoolName + "' added successfully!");
        } else {
            // Error message for duplicate school
            request.setAttribute("errorMessage", "Error: School '" + schoolName + "' already exists!");
        }
    } else {
        // Error message for missing input
        request.setAttribute("errorMessage", "Invalid input. Please fill out all fields.");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save School</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Save School</h1>

        <!-- Success or Error Message -->
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success mt-4">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } else if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger mt-4">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <div class="text-center mt-4">
            <a href="enterSchool.jsp" class="btn btn-success">Add Another School</a>
            <a href="manageSchool.jsp" class="btn btn-primary">Go to Manage Schools</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch the school list from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");

    if (schools == null) {
        schools = new ArrayList<>();
        application.setAttribute("schools", schools);
    }

    // Get form parameters
    String schoolName = request.getParameter("schoolName");
    String schoolAddress = request.getParameter("schoolAddress");
    String principalName = request.getParameter("principalName");
    String totalStudents = request.getParameter("totalStudents");

    if (schoolName != null && !schoolName.trim().isEmpty() &&
        schoolAddress != null && !schoolAddress.trim().isEmpty() &&
        principalName != null && !principalName.trim().isEmpty() &&
        totalStudents != null && !totalStudents.trim().isEmpty()) {

        // Check for duplicate school entries
        boolean isDuplicate = schools.stream()
            .anyMatch(school -> school.get("name").equalsIgnoreCase(schoolName));

        if (!isDuplicate) {
            // Add the school if it's not a duplicate
            String newId = String.valueOf(schools.size() + 1); // Generate a new ID
            Map<String, String> newSchool = new HashMap<>();
            newSchool.put("id", newId);
            newSchool.put("name", schoolName);
            newSchool.put("address", schoolAddress);
            newSchool.put("principal", principalName);
            newSchool.put("students", totalStudents);
            schools.add(newSchool);

            // Success message
            request.setAttribute("successMessage", "School '" + schoolName + "' added successfully!");
        } else {
            // Error message for duplicate school
            request.setAttribute("errorMessage", "Error: School '" + schoolName + "' already exists!");
        }
    } else {
        // Error message for missing input
        request.setAttribute("errorMessage", "Invalid input. Please fill out all fields.");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save School</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .card {
            margin: 50px auto;
            max-width: 600px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        h1 {
            color: #007bff;
        }
        .alert {
            font-size: 1rem;
            padding: 15px;
        }
        .btn {
            margin: 5px;
            font-size: 1rem;
        }
        .btn:hover {
            transform: scale(1.05);
            transition: 0.2s ease-in-out;
        }
    </style>
</head>
<body>
    <div class="card">
        <h1 class="text-center">Save School</h1>
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success text-center">
                <i class="fas fa-check-circle"></i> <%= request.getAttribute("successMessage") %>
            </div>
        <% } else if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger text-center">
                <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>
        <div class="text-center mt-4">
            <a href="enterSchool.jsp" class="btn btn-success"><i class="fas fa-plus-circle"></i> Add Another School</a>
            <a href="manageSchool.jsp" class="btn btn-primary"><i class="fas fa-cogs"></i> Go to Manage Schools</a>
            <a href="index.jsp" class="btn btn-secondary"><i class="fas fa-home"></i> Back to Home</a>
        </div>
    </div>
</body>
</html>

