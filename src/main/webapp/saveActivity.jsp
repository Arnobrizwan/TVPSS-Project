<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch the activities list from the application context
    List<Map<String, String>> activities = (List<Map<String, String>>) application.getAttribute("activities");
    if (activities == null) {
        activities = new ArrayList<>();
        application.setAttribute("activities", activities);
    }

    // Get form parameters
    String activityName = request.getParameter("activityName");
    String activityDate = request.getParameter("activityDate");
    String activityDescription = request.getParameter("activityDescription");

    // Validate input and add the activity
    if (activityName != null && activityDate != null && activityDescription != null &&
        !activityName.trim().isEmpty() && !activityDate.trim().isEmpty() && !activityDescription.trim().isEmpty()) {
        String newId = String.valueOf(activities.size() + 1); // Generate a new ID
        Map<String, String> newActivity = Map.of(
            "id", newId,
            "name", activityName,
            "date", activityDate,
            "description", activityDescription
        );
        activities.add(newActivity);

        // Success message
        request.setAttribute("successMessage", "Activity added successfully!");
    } else {
        request.setAttribute("errorMessage", "Invalid input. Please fill out all fields.");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Save Activity</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Save Activity</h1>

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
            <a href="manageActivity.jsp" class="btn btn-secondary">Back to Manage Activities</a>
            <a href="index.jsp" class="btn btn-primary">Back to Home</a>
        </div>
    </div>
</body>
</html>


