<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve the submission ID to reject
    String submissionId = request.getParameter("submissionId");

    // Fetch the submissions from the application context
    List<Map<String, String>> submissions = (List<Map<String, String>>) application.getAttribute("submissions");

    if (submissions != null && submissionId != null) {
        // Remove the submission with the given ID
        boolean removed = submissions.removeIf(submission -> submission.get("id").equals(submissionId));
        application.setAttribute("submissions", submissions);

        if (removed) {
            // Success message if the submission was removed
            request.setAttribute("message", "Submission ID " + submissionId + " has been rejected successfully.");
        } else {
            // Error message if the submission ID was not found
            request.setAttribute("message", "Error: Submission ID " + submissionId + " not found.");
        }
    } else {
        // Error message if submissions list or submissionId is null
        request.setAttribute("message", "Error: Unable to process the request.");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reject Submission</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary">Reject Submission</h1>
        <p class="<%= request.getAttribute("message").toString().contains("Error") ? "text-danger" : "text-success" %>">
            <%= request.getAttribute("message") %>
        </p>
        <a href="validateInfo.jsp" class="btn btn-secondary">Back to Validate Information</a>
    </div>
</body>
</html>


