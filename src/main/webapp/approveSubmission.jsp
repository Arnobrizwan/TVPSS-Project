<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve the submission ID to approve
    String submissionId = request.getParameter("submissionId");

    // Fetch the submissions from the application context
    List<Map<String, String>> submissions = (List<Map<String, String>>) application.getAttribute("submissions");

    if (submissions != null && submissionId != null) {
        // Find and remove the submission
        boolean removed = submissions.removeIf(submission -> submission.get("id").equals(submissionId));
        application.setAttribute("submissions", submissions);

        // Check if the submission was successfully approved
        if (removed) {
            request.setAttribute("message", "Submission ID " + submissionId + " has been approved successfully.");
        } else {
            request.setAttribute("message", "Error: Submission ID " + submissionId + " not found.");
        }
    } else {
        request.setAttribute("message", "Error: Unable to process the approval.");
    }

    response.sendRedirect("validateInfo.jsp");
%>



