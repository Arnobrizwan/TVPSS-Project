<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .accordion-button {
            background-color: #007bff;
            color: white;
        }
        .accordion-button:not(.collapsed) {
            background-color: #0056b3;
            color: white;
        }
        .accordion-button:focus {
            box-shadow: none;
        }
        .list-group-item {
            background-color: #f0f8ff;
        }
        .btn-sm {
            min-width: 80px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-primary text-center">Manage Roles</h1>

        <%
            // Fetch or initialize roles dynamically
         Map<String, List<String>> roleUsers = (Map<String, List<String>>) application.getAttribute("roleUsers");
if (roleUsers == null) {
    roleUsers = new HashMap<>();
    roleUsers.put("Admin", new ArrayList<>(Arrays.asList("Admin1")));
    roleUsers.put("Teacher", new ArrayList<>(Arrays.asList("Teacher1","Teacher2")));
    roleUsers.put("Student", new ArrayList<>(Arrays.asList("Student1", "Student2")));
    application.setAttribute("roleUsers", roleUsers); // Save initialized roles
}

        %>

        <!-- Success/Error Messages -->
        <% if (request.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success">
                <%= request.getAttribute("successMessage") %>
            </div>
        <% } else if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <!-- Display roles dynamically -->
        <div class="accordion mt-4" id="rolesAccordion">
            <% for (Map.Entry<String, List<String>> entry : roleUsers.entrySet()) { %>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="heading<%= entry.getKey() %>">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= entry.getKey() %>" aria-expanded="true" aria-controls="collapse<%= entry.getKey() %>">
                            <%= entry.getKey() %> (Users: <%= entry.getValue().size() %>)
                        </button>
                    </h2>
                    <div id="collapse<%= entry.getKey() %>" class="accordion-collapse collapse show" aria-labelledby="heading<%= entry.getKey() %>" data-bs-parent="#rolesAccordion">
                        <div class="accordion-body">
                            <!-- Display list of users for this role -->
                            <ul class="list-group">
                                <% for (String user : entry.getValue()) { %>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <%= user %>
                                        <!-- Remove user button -->
                                        <form action="deleteUser.jsp" method="post" class="d-inline">
                                            <input type="hidden" name="role" value="<%= entry.getKey() %>">
                                            <input type="hidden" name="user" value="<%= user %>">
                                            <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                        </form>
                                    </li>
                                <% } %>
                            </ul>

                            <!-- Add new user form -->
                            <form action="addPeople.jsp" method="post" class="mt-3">
                                <input type="hidden" name="role" value="<%= entry.getKey() %>">
                                <div class="input-group">
                                    <input type="text" name="username" class="form-control form-control-sm" placeholder="Add new user" required>
                                    <button class="btn btn-success btn-sm" type="submit">Add</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>

        <a href="index.jsp" class="btn btn-secondary mt-4">Back to Home</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

