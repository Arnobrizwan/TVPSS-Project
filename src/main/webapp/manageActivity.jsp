<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Activities</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Manage Activities</h1>

        <!-- Form to Add Activity -->
        <form action="saveActivity.jsp" method="post" class="mt-4">
            <div class="mb-3">
                <label for="activityName" class="form-label">Activity Name:</label>
                <input type="text" id="activityName" name="activityName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="activityDate" class="form-label">Activity Date:</label>
                <input type="date" id="activityDate" name="activityDate" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="activityDescription" class="form-label">Activity Description:</label>
                <textarea id="activityDescription" name="activityDescription" class="form-control" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-success">Add Activity</button>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </form>

        <!-- List of Existing Activities -->
        <h2 class="text-secondary mt-5">Existing Activities</h2>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Activity Name</th>
                    <th>Date</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the list of activities stored in the application context
                    List<Map<String, String>> activities = (List<Map<String, String>>) application.getAttribute("activities");
                    if (activities == null) {
                        activities = new ArrayList<>();
                        application.setAttribute("activities", activities);
                    }

                    if (!activities.isEmpty()) {
                        int count = 1;
                        for (int i = 0; i < activities.size(); i++) {
                            Map<String, String> activity = activities.get(i);
                %>
                <tr>
                    <td><%= count++ %></td>
                    <td><%= activity.get("name") %></td>
                    <td><%= activity.get("date") %></td>
                    <td><%= activity.get("description") %></td>
                    <td>
                       <form action="deleteActivity.jsp" method="post" style="display: inline;">
    <input type="hidden" name="activityIndex" value="<%= i %>">
    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
</form>

                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center text-danger">No activities found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

