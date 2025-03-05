<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.datapackage.dao.DriverDao" %>
<%@ page import="com.datapackage.model.Driver" %>

<%
    String driverIdStr = request.getParameter("id");
    if (driverIdStr != null && !driverIdStr.isEmpty()) {
        int driverId = Integer.parseInt(driverIdStr);
        DriverDao driverDao = new DriverDao();
        Driver driver = driverDao.getDriverById(driverId);

        if (driver != null) {
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Driver</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
/* Dark Theme */
body {
	background-color: #1e1e1e;
	color: white;
}

.container {
	margin-top: 50px;
    max-width: 600px;
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

.btn-primary:hover {
	background-color: #0056b3;
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

	<div class="container">
		<a href="manageDrivers.jsp" class="back-btn">⬅ Back to Driver List</a>

		<h2 class="text-center">✏ Edit Driver</h2>

		<!-- Edit Driver Form -->
		<div class="form-container">
			<form action="<%=request.getContextPath()%>/DriverManagementServlet" method="post" enctype="multipart/form-data">
				<input type="hidden" name="action" value="update">
				<input type="hidden" name="id" value="<%= driver.getId() %>">

				<div class="mb-3">
					<label class="form-label">Driver Name</label> 
					<input type="text" name="driverName" class="form-control" value="<%= driver.getDriverName() %>" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Phone Number</label> 
					<input type="tel" name="phone" class="form-control" value="<%= driver.getPhone() %>" required>
				</div>

				<div class="mb-3">
					<label class="form-label">License Number</label> 
					<input type="text" name="licenseNumber" class="form-control" value="<%= driver.getLicenseNumber() %>" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Update Driver Image (optional)</label> 
					<input type="file" name="imageFile" class="form-control" accept="image/*">
				</div>

				<button type="submit" class="btn btn-primary w-100">Update Driver</button>
			</form>
		</div>

	</div>

</body>
</html>

<%
        } else {
            response.sendRedirect("manageDrivers.jsp?error=notFound");
        }
    } else {
        response.sendRedirect("manageDrivers.jsp?error=invalidId");
    }
%>
