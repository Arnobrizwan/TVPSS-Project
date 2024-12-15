<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve activity index from the request
    String activityIndexParam = request.getParameter("activityIndex");

    // Retrieve the list of activities from the application context
    List<Map<String, String>> activities = (List<Map<String, String>>) application.getAttribute("activities");

    String message = "Activity not found.";
    if (activityIndexParam != null && activities != null) {
        try {
            // Parse the index
            int activityIndex = Integer.parseInt(activityIndexParam);

            // Ensure the index is valid
            if (activityIndex >= 0 && activityIndex < activities.size()) {
                // Remove the activity
                Map<String, String> removedActivity = activities.remove(activityIndex);
                application.setAttribute("activities", activities); // Update the application context
                message = "Activity '" + removedActivity.get("name") + "' deleted successfully!";
            } else {
                message = "Error: Activity index out of bounds.";
            }
        } catch (NumberFormatException e) {
            message = "Error: Invalid activity index.";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Activity</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary">Delete Activity</h1>
        <p class="<%= message.contains("successfully") ? "text-success" : "text-danger" %>"><%= message %></p>
        <a href="manageActivity.jsp" class="btn btn-secondary">Back to Manage Activities</a>
    </div>
</body>
</html>



