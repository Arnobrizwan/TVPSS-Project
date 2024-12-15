<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TVPSS Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
        }
        h1 {
            font-size: 2.5rem;
        }
        .btn {
            min-width: 200px;
            padding: 10px 15px;
            font-size: 1rem;
        }
        .btn-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }
        .btn:hover {
            transform: scale(1.05);
            transition: 0.2s ease;
        }
    </style>
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="text-primary mb-3">Welcome to TVPSS Management System</h1>
        <p class="text-secondary mb-4">Enhancing educational resources and technology within Johor's schools.</p>
        <div class="btn-container">
            <a href="roles.jsp" class="btn btn-primary">Manage Roles</a>
            <a href="enterSchool.jsp" class="btn btn-success">Enter School Information</a>
            <a href="manageSchool.jsp" class="btn btn-info">Manage Schools</a>
            <a href="dashboard.jsp" class="btn btn-secondary">View Dashboard</a>
            <a href="manageResource.jsp" class="btn btn-warning">Manage Resources</a>
            <a href="manageActivity.jsp" class="btn btn-danger">Manage Activities</a>
            <a href="validateInfo.jsp" class="btn btn-primary">Validate Information</a>
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
    <title>TVPSS Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 900px;
        }
        h1 {
            font-size: 2.8rem;
            font-weight: bold;
        }
        .btn {
            min-width: 220px;
            padding: 12px 20px;
            font-size: 1rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .btn-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }
        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: 0.2s ease;
        }
        .icon {
            font-size: 1.5rem;
        }
        .footer {
            margin-top: 30px;
            font-size: 0.9rem;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container text-center mt-5">
        <h1 class="text-primary mb-3">Welcome to TVPSS Management System</h1>
        <p class="text-secondary mb-4">Enhancing educational resources and technology within Johor's schools.</p>
        <div class="btn-container">
            <a href="roles.jsp" class="btn btn-primary">
                <i class="icon fas fa-user-cog"></i> Manage Roles
            </a>
            <a href="enterSchool.jsp" class="btn btn-success">
                <i class="icon fas fa-school"></i> Enter School Information
            </a>
            <a href="manageSchool.jsp" class="btn btn-info">
                <i class="icon fas fa-building"></i> Manage Schools
            </a>
            <a href="dashboard.jsp" class="btn btn-secondary">
                <i class="icon fas fa-chart-line"></i> View Dashboard
            </a>
            <a href="manageResource.jsp" class="btn btn-warning">
                <i class="icon fas fa-boxes"></i> Manage Resources
            </a>
            <a href="manageActivity.jsp" class="btn btn-danger">
                <i class="icon fas fa-calendar-alt"></i> Manage Activities
            </a>
            <a href="validateInfo.jsp" class="btn btn-primary">
                <i class="icon fas fa-check-circle"></i> Validate Information
            </a>
        </div>
        <div class="footer text-center mt-4">
            <p>&copy; 2024 TVPSS Management System. All Rights Reserved.</p>
        </div>
    </div>
</body>
</html>





