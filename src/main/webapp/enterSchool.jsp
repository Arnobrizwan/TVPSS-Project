<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter School Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Enter School Information</h1>

        <!-- Form to Add New School -->
        <form action="saveSchool.jsp" method="post" class="mt-4">
            <div class="mb-3">
                <label for="schoolName" class="form-label">School Name:</label>
                <input type="text" id="schoolName" name="schoolName" class="form-control" placeholder="Enter school name" required>
            </div>
            <div class="mb-3">
                <label for="schoolAddress" class="form-label">School Address:</label>
                <input type="text" id="schoolAddress" name="schoolAddress" class="form-control" placeholder="Enter school address" required>
            </div>
            <div class="mb-3">
                <label for="principalName" class="form-label">Principal's Name:</label>
                <input type="text" id="principalName" name="principalName" class="form-control" placeholder="Enter principal's name" required>
            </div>
            <div class="mb-3">
                <label for="totalStudents" class="form-label">Total Students:</label>
                <input type="number" id="totalStudents" name="totalStudents" class="form-control" placeholder="Enter total number of students" min="1" required>
            </div>
            <button type="submit" class="btn btn-success">Save School</button>
        </form>

        <div class="text-center mt-4">
            <a href="manageSchool.jsp" class="btn btn-primary">Go to Manage Schools</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter School Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .form-card {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 50px auto;
        }
        .form-card h1 {
            font-size: 1.8rem;
            font-weight: bold;
            margin-bottom: 20px;
            color: #007bff;
        }
        .form-group label {
            font-weight: bold;
        }
        .btn {
            padding: 10px 20px;
            font-size: 1rem;
        }
        .btn:hover {
            transform: scale(1.05);
            transition: 0.2s ease;
        }
        .btn-primary, .btn-secondary {
            margin: 5px;
        }
        .input-group-text {
            background-color: #f1f1f1;
            border: none;
            border-right: 1px solid #ced4da;
        }
    </style>
</head>
<body>
    <div class="form-card">
        <h1 class="text-center">Enter School Information</h1>
        <form action="saveSchool.jsp" method="post">
            <div class="mb-3">
                <label for="schoolName" class="form-label">School Name:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-school"></i></span>
                    <input type="text" id="schoolName" name="schoolName" class="form-control" placeholder="Enter school name" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="schoolAddress" class="form-label">School Address:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-map-marker-alt"></i></span>
                    <input type="text" id="schoolAddress" name="schoolAddress" class="form-control" placeholder="Enter school address" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="principalName" class="form-label">Principal's Name:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user-tie"></i></span>
                    <input type="text" id="principalName" name="principalName" class="form-control" placeholder="Enter principal's name" required>
                </div>
            </div>
            <div class="mb-3">
                <label for="totalStudents" class="form-label">Total Students:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-users"></i></span>
                    <input type="number" id="totalStudents" name="totalStudents" class="form-control" placeholder="Enter total number of students" min="1" required>
                </div>
            </div>
            <button type="submit" class="btn btn-success w-100"><i class="fas fa-save"></i> Save School</button>
        </form>
        <div class="text-center mt-4">
            <a href="manageSchool.jsp" class="btn btn-primary"><i class="fas fa-arrow-right"></i> Go to Manage Schools</a>
            <a href="index.jsp" class="btn btn-secondary"><i class="fas fa-home"></i> Back to Home</a>
        </div>
    </div>
</body>
</html>


