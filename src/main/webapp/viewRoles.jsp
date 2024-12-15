<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-primary">Role List</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Role Name</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve in-memory roles
                    List<Map<String, String>> roles = (List<Map<String, String>>) application.getAttribute("roles");
                    if (roles != null && !roles.isEmpty()) {
                        int count = 1;
                        for (Map<String, String> role : roles) {
                            out.println("<tr>");
                            out.println("<td>" + (count++) + "</td>");
                            out.println("<td>" + role.get("name") + "</td>");
                            out.println("<td>" + role.get("description") + "</td>");
                            out.println("</tr>");
                        }
                    } else {
                        out.println("<tr><td colspan='3' class='text-center text-danger'>No roles found</td></tr>");
                    }
                %>
            </tbody>
        </table>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Roles</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-primary text-center">Role List</h1>
        <table class="table table-bordered mt-3">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Role Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Retrieve in-memory roles
                    List<Map<String, String>> roles = (List<Map<String, String>>) application.getAttribute("roles");
                    if (roles != null && !roles.isEmpty()) {
                        int count = 1;
                        for (int i = 0; i < roles.size(); i++) {
                            Map<String, String> role = roles.get(i);
                %>
                <tr>
                    <td><%= count++ %></td>
                    <td><%= role.get("name") %></td>
                    <td><%= role.get("description") %></td>
                    <td>
                        <!-- Delete Button -->
                        <form action="deleteRole.jsp" method="post" style="display: inline;">
                            <input type="hidden" name="roleIndex" value="<%= i %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4" class="text-center text-danger">No roles found</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
    </div>
</body>
</html>

