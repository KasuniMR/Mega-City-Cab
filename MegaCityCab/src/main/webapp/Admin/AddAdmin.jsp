<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.datapackage.model.AddAdmin"%>
<%@ page import="com.datapackage.dao.AddAdminDao"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Manage Admins</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
body { background-color: #1e1e1e; color: #f8f9fa; }
.container { margin-top: 30px; }
.form-container { background: #2a2a2a; padding: 20px; border-radius: 10px; box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.1); }
.form-control, .btn { background-color: #333; color: white; border: none; }
.form-control::placeholder { color: #bbb; }
.table { background-color: #2a2a2a; color: white; border-radius: 8px; }
.table-dark th { background-color: #121212; }
.table tbody tr:hover { background-color: rgba(255, 255, 255, 0.1); transition: 0.3s; }
.btn-primary { background-color: #007bff; }
.btn-secondary { background-color: #007bff; }
.btn-danger { background-color: #dc3545; }
.btn-warning { background-color: #ffc107; color: black; }
h2, h3 { text-align: center; font-weight: bold; color: #ffcc00; }
.back-btn { display: block; width: fit-content; margin-bottom: 20px; background-color: #28a745; color: white; padding: 10px 20px; border-radius: 5px; text-decoration: none; transition: 0.3s; }
</style>
</head>
<body>
    <div class="container">
        <a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" class="back-btn">⬅ Back to Admin Home</a>
        <h2>👤 Manage Admins</h2>

        <div class="form-container">
            <h4>Add a New Admin</h4>
            <form action="<%=request.getContextPath()%>/AddAdminServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Username</label> 
                    <input type="text" name="username" class="form-control" placeholder="Enter username" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label> 
                    <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Password</label> 
                    <input type="password" name="password" class="form-control" placeholder="Enter password" required>
                </div>
                <div class="d-flex justify-content-between">
                    <button type="submit" class="btn btn-primary">Add Admin</button>
                    <button type="reset" class="btn btn-secondary">Clear</button>
                </div>
            </form>
        </div>

        <h3 class="mt-5">Admin List</h3>
        
        <% 
            // Fetch updated admin list from database (not from session)
            AddAdminDao adminDao = new AddAdminDao();
            List<AddAdmin> adminList = adminDao.getAllAdmins();
        %>

        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% if (adminList != null && !adminList.isEmpty()) { 
                    for (AddAdmin admin : adminList) {
                        if (admin != null) {
                %>
                <tr>
                    <td><%= admin.getId() %></td>
                    <td><%= admin.getUsername() %></td>
                    <td><%= admin.getEmail() %></td>
                    <td>
                        <a href="<%=request.getContextPath()%>/Admin/EditAdmin.jsp?id=<%=admin.getId()%>" class="btn btn-warning btn-sm">✏️ Edit</a> 
                        <a href="<%=request.getContextPath()%>/DeleteAdminServlet?id=<%=admin.getId()%>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?');">🗑️ Delete</a>
                    </td>
                </tr>
                <% } } 
                } else { %>
                <tr>
                    <td colspan="4" class="text-center">No admins added yet.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
