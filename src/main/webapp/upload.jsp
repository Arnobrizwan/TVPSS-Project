<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Content</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-center text-primary">Content Submission</h1>
        <!-- Form for uploading content -->
        <form action="uploadHandler.jsp" method="post" enctype="multipart/form-data" class="mt-4">
            <!-- Content Title -->
            <div class="mb-3">
                <label for="title" class="form-label">Content Title:</label>
                <input type="text" id="title" name="title" class="form-control" placeholder="Enter a title for your content" required>
            </div>
            <!-- File Selection -->
            <div class="mb-3">
                <label for="file" class="form-label">Choose File:</label>
                <input type="file" id="file" name="file" class="form-control" accept=".jpg, .png, .mp4, .pdf" required>
                <small class="text-muted">Supported formats: .jpg, .png, .mp4, .pdf</small>
            </div>
            <!-- Submit Button -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-success">Upload</button>
                <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
            </div>
        </form>
    </div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Content</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Upload Content</h1>
        <form action="uploadHandler.jsp" method="post" enctype="multipart/form-data" class="mt-4">
            <div class="mb-3">
                <label for="title" class="form-label">Title:</label>
                <input type="text" id="title" name="title" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="file" class="form-label">File:</label>
                <input type="file" id="file" name="file" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Upload</button>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </form>
    </div>
</body>
</html>

