<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch dynamic submissions data from the application context
    List<Map<String, String>> submissions = (List<Map<String, String>>) application.getAttribute("submissions");
    
    if (submissions == null) {
        submissions = new ArrayList<>();
        // Initialize with some sample submissions if empty
        submissions.add(Map.of("id", "1", "type", "School Info", "details", "New School Added: Johor High School"));
        submissions.add(Map.of("id", "2", "type", "Resource", "details", "Requested 5 new projectors"));
        submissions.add(Map.of("id", "3", "type", "Activity", "details", "Proposed Science Fair on 25th March"));
        application.setAttribute("submissions", submissions);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Validate Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Validate Submissions</h1>
        
        <!-- Submissions Table -->
        <table class="table table-striped table-hover mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Submission Type</th>
                    <th>Details</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (submissions != null && !submissions.isEmpty()) { %>
                    <% for (Map<String, String> submission : submissions) { %>
                        <tr>
                            <td><%= submission.get("id") %></td>
                            <td><%= submission.get("type") %></td>
                            <td><%= submission.get("details") %></td>
                            <td>
                                <!-- Approve Button -->
                                <form action="approveSubmission.jsp" method="post" style="display: inline;">
                                    <input type="hidden" name="submissionId" value="<%= submission.get("id") %>">
                                    <button type="submit" class="btn btn-success btn-sm">Approve</button>
                                </form>
                                <!-- Reject Button -->
                                <form action="rejectSubmission.jsp" method="post" style="display: inline;">
                                    <input type="hidden" name="submissionId" value="<%= submission.get("id") %>">
                                    <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                <% } else { %>
                    <tr>
                        <td colspan="4" class="text-center text-danger">No submissions available</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
        
        <a href="index.jsp" class="btn btn-secondary mt-4">Back to Home</a>
    </div>
</body>
</html>


