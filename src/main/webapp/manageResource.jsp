<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Resources</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Manage Resources</h1>

        <!-- Add Resource Form -->
        <form action="saveResource.jsp" method="post" class="mt-4">
            <div class="mb-3">
                <label for="name" class="form-label">Resource Name:</label>
                <input type="text" id="name" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="type" class="form-label">Resource Type:</label>
                <select id="type" name="type" class="form-select" required>
                    <option value="" disabled selected>Select Type</option>
                    <option value="Equipment">Equipment</option>
                    <option value="Material">Material</option>
                    <option value="Software">Software</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="availability" class="form-label">Availability:</label>
                <input type="number" id="availability" name="availability" class="form-control" min="1" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Resource</button>
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </form>

        <!-- Resource List -->
        <h2 class="text-secondary mt-5">Existing Resources</h2>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Resource Name</th>
                    <th>Type</th>
                    <th>Availability</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve the list of resources stored in the application scope
                    List<Map<String, String>> resources = (List<Map<String, String>>) application.getAttribute("resources");
                    if (resources != null && !resources.isEmpty()) {
                        int count = 1;
                        for (int i = 0; i < resources.size(); i++) {
                            Map<String, String> resource = resources.get(i);
                %>
                <tr>
                    <td><%= count++ %></td>
                    <td><%= resource.get("name") %></td>
                    <td><%= resource.get("type") %></td>
                    <td><%= resource.get("availability") %></td>
                    <td>
                        <!-- Delete Button -->
                        <form action="deleteResource.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="resourceIndex" value="<%= i %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center text-danger">No resources found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
    // Fetch resources from the application context
    List<Map<String, String>> resources = (List<Map<String, String>>) application.getAttribute("resources");
    if (resources == null) {
        resources = new ArrayList<>();
        application.setAttribute("resources", resources);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Resources</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="text-primary text-center">Manage Resources</h1>

        <!-- Add New Resource Form -->
        <form action="saveResource.jsp" method="post" class="mt-4">
            <div class="mb-3">
                <label for="resourceName" class="form-label">Resource Name:</label>
                <input type="text" id="resourceName" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="resourceType" class="form-label">Type:</label>
                <select id="resourceType" name="type" class="form-control" required>
                    <option value="Equipment">Equipment</option>
                    <option value="Material">Material</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="resourceAvailability" class="form-label">Availability:</label>
                <input type="number" id="resourceAvailability" name="availability" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Add Resource</button>
        </form>

        <!-- List of Resources -->
        <h2 class="text-secondary mt-5">Existing Resources</h2>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Resource Name</th>
                    <th>Type</th>
                    <th>Availability</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (!resources.isEmpty()) {
                    int count = 1;
                    for (int i = 0; i < resources.size(); i++) {
                        Map<String, String> resource = resources.get(i);
                %>
                <tr>
                    <td><%= count++ %></td>
                    <td><%= resource.get("name") %></td>
                    <td><%= resource.get("type") %></td>
                    <td><%= resource.get("availability") %></td>
                    <td>
                        <!-- Delete Button -->
                        <form action="deleteResource.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="resourceIndex" value="<%= i %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <% }
                } else { %>
                <tr>
                    <td colspan="5" class="text-center text-danger">No resources found</td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="index.jsp" class="btn btn-secondary mt-4">Back to Home</a>
    </div>
</body>
</html>


