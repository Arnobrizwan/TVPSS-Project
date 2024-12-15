<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve the list of schools from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");

    if (schools == null) {
        // Initialize with an empty list if not present
        schools = new ArrayList<>();
        application.setAttribute("schools", schools);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Schools</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-container {
            margin-top: 30px;
        }
        .btn-container {
            display: flex;
            justify-content: flex-start;
            gap: 10px;
            margin-top: 20px;
        }
        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }
        .form-select {
            height: 45px;
            font-size: 1rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-primary text-center">Manage Schools</h1>

        <!-- School Table -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>School Name</th>
                        <th>Address</th>
                        <th>Principal</th>
                        <th>Total Students</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (!schools.isEmpty()) {
                        for (Map<String, String> school : schools) { %>
                            <tr>
                                <td><%= school.get("id") %></td>
                                <td><%= school.get("name") %></td>
                                <td><%= school.get("address") %></td>
                                <td><%= school.get("principal") != null ? school.get("principal") : "N/A" %></td>
                                <td><%= school.get("students") != null ? school.get("students") : "N/A" %></td>
                                <td>
                                    <!-- Delete Button for Each School -->
                                    <form action="deleteSchool.jsp" method="post" class="d-inline">
                                        <input type="hidden" name="schoolId" value="<%= school.get("id") %>">
                                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                    </form>
                                </td>
                            </tr>
                    <% }
                    } else { %>
                        <tr>
                            <td colspan="6" class="text-center text-danger">No schools available</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Buttons Below Table -->
        <div class="btn-container">
            <a href="enterSchool.jsp" class="btn btn-success">Add New School</a>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Retrieve the list of schools from the application context
    List<Map<String, String>> schools = (List<Map<String, String>>) application.getAttribute("schools");

    if (schools == null) {
        // Initialize with an empty list if not present
        schools = new ArrayList<>();
        application.setAttribute("schools", schools);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Schools</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
        }
        .table-container {
            margin-top: 30px;
            overflow-x: auto;
        }
        .table {
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            text-align: center;
        }
        .table td {
            text-align: center;
        }
        .btn-container {
            margin-top: 20px;
            display: flex;
            gap: 10px;
            justify-content: center;
        }
        .btn {
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-danger {
            padding: 5px 10px;
        }
        .no-data {
            color: #dc3545;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="text-center">Manage Schools</h1>

        <!-- School Table -->
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>School Name</th>
                        <th>Address</th>
                        <th>Principal</th>
                        <th>Total Students</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (!schools.isEmpty()) {
                        for (Map<String, String> school : schools) { %>
                            <tr>
                                <td><%= school.get("id") %></td>
                                <td><%= school.get("name") %></td>
                                <td><%= school.get("address") %></td>
                                <td><%= school.get("principal") != null ? school.get("principal") : "N/A" %></td>
                                <td><%= school.get("students") != null ? school.get("students") : "N/A" %></td>
                                <td>
                                    <!-- Delete Button for Each School -->
                                    <form action="deleteSchool.jsp" method="post" class="d-inline">
                                        <input type="hidden" name="schoolId" value="<%= school.get("id") %>">
                                        <button type="submit" class="btn btn-danger btn-sm">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                    <% }
                    } else { %>
                        <tr>
                            <td colspan="6" class="text-center no-data">No schools available</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Buttons Below Table -->
        <div class="btn-container">
            <a href="enterSchool.jsp" class="btn btn-success"><i class="fas fa-plus-circle"></i> Add New School</a>
            <a href="index.jsp" class="btn btn-secondary"><i class="fas fa-home"></i> Back to Home</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



