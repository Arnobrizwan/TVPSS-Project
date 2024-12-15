<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.nio.file.*, javax.servlet.http.Part" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Handler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Processing File Upload...</h1>
        <%
            String title = null;
            Part filePart = null;

            try {
                // Retrieve form data
                title = request.getParameter("title");
                filePart = request.getPart("file");

                if (title != null && !title.isEmpty() && filePart != null) {
                    // Save uploaded file to the "uploads" directory
                    String uploadPath = application.getRealPath("/") + "uploads";
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdir();
                    }

                    // Get file name and save it
                    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                    String filePath = uploadPath + File.separator + fileName;

                    filePart.write(filePath);

                    out.println("<div class='alert alert-success text-center'>");
                    out.println("<p>File '<strong>" + fileName + "</strong>' uploaded successfully!</p>");
                    out.println("<p>Saved to: " + filePath + "</p>");
                    out.println("</div>");
                } else {
                    out.println("<div class='alert alert-danger text-center'>");
                    out.println("<p>Error: Title or file missing. Please try again.</p>");
                    out.println("</div>");
                }
            } catch (Exception e) {
                out.println("<div class='alert alert-danger text-center'>");
                out.println("<p>Exception occurred: " + e.getMessage() + "</p>");
                out.println("</div>");
            }
        %>
        <div class="text-center mt-4">
            <a href="upload.jsp" class="btn btn-secondary">Back to Upload Page</a>
        </div>
    </div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String title = request.getParameter("title");
    String fileName = request.getParameter("file");

    // Simulate file upload success
    String message = "File '" + fileName + "' uploaded successfully with title '" + title + "'!";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Upload Handler</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary">Upload Handler</h1>
        <p class="text-success"><%= message %></p>
        <a href="upload.jsp" class="btn btn-secondary">Back to Upload</a>
    </div>
</body>
</html>




