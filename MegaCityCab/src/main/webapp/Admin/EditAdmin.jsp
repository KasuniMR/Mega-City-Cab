<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.datapackage.dao.AddAdminDao"%>
<%@ page import="com.datapackage.model.AddAdmin"%>

<%
String idStr = request.getParameter("id");
if (idStr != null && !idStr.isEmpty()) {
	int adminId = Integer.parseInt(idStr);
	AddAdminDao dao = new AddAdminDao();
	AddAdmin admin = dao.getAdminById(adminId);

	if (admin != null) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Edit Admin</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<style>
body {
	background-color: #1e1e1e;
	color: white;
}

.card {
	background: #1e1e1e;
	color: white;
	border-radius: 15px;
	box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
	padding: 20px;
}

.card-header {
	background: #007bff;
	color: white;
	font-size: 22px;
	font-weight: bold;
	text-align: center;
	border-radius: 15px 15px 0 0;
	padding: 15px;
}

.form-control {
	background: #333;
	color: #f0f0f0;
	border: 1px solid #555;
}

.form-control:focus {
	background: #444;
	color: white;
	border-color: #007bff;
	box-shadow: none;
}

.btn-custom {
	background: #007bff;
	color: white;
	border: none;
	transition: all 0.3s ease-in-out;
}

.btn-custom:hover {
	background: #0056b3;
	transform: scale(1.05);
}


.back-btn {
	display: block;
	width: fit-content;
	margin-bottom: 20px;
	background-color: #28a745;
	color: white;
	padding: 10px 20px;
	border-radius: 5px;
	text-decoration: none;
	transition: 0.3s;
}

.back-btn:hover {
	background-color: #218838;
	transform: scale(1.05);
}
</style>
</head>
<body>
	<div
		class="container d-flex justify-content-center align-items-center min-vh-100">
		<div class="col-md-6">
			<div class="card">
				<a href="AddAdmin.jsp" class="back-btn">⬅ Back to Admin
					List</a>

				<h2 class="text-center">✏ Edit Admin</h2>
				<div class="card-body text-center">
					<form
						action="${pageContext.request.contextPath}/Admin/UpdateAdminServlet"
						method="post">
						<input type="hidden" name="id" value="<%=admin.getId()%>">
						<div class="mb-3 text-start">
							<label class="form-label">Username</label> <input type="text"
								name="username" class="form-control"
								value="<%=admin.getUsername()%>" required>
						</div>
						<div class="mb-3 text-start">
							<label class="form-label">Email</label> <input type="email"
								name="email" class="form-control"
								value="<%=admin.getEmail()%>" required>
						</div>
						<div class="mb-3 text-start">
							<label class="form-label">Password (leave blank to keep
								current password)</label> <input type="password" name="password"
								class="form-control">
						</div>
						<div class="text-center">
							<button type="submit" class="btn btn-custom">Update</button>
							<a href="${pageContext.request.contextPath}/Admin/AddAdmin.jsp"
								class="btn btn-secondary">Cancel</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<%
} else {
response.sendRedirect("Admin/AddAdmin.jsp?error=notFound");
}
} else {
response.sendRedirect("Admin/AddAdmin.jsp?error=invalidId");
}
%>
