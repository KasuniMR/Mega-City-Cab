<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.datapackage.dao.DriverDao"%>
<%@ page import="com.datapackage.model.Driver"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Drivers</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
/* Dark Theme */
body {
	background-color: #1e1e1e;
	color: white;
}

.container {
	margin-top: 30px;
}

.form-container {
	background: #2a2a2a;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0px 4px 10px rgba(255, 255, 255, 0.1);
	color: white;
}

.table {
	background-color: #2a2a2a;
	color: white;
}

.table thead {
	background-color: #444;
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
		<!-- Back to Admin Home Button -->
		<a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp"
			class="back-btn">⬅ Back to Dashboard</a>

		<h2 class="text-center">🚌 Manage Drivers</h2>

		<!-- Add Driver Form -->
		<div class="form-container">
			<h4>Add New Driver</h4>
			<form action="<%=request.getContextPath()%>/DriverManagementServlet"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="action" value="add">

				<div class="mb-3">
					<label class="form-label">Driver Name</label> <input type="text"
						name="driverName" class="form-control"
						placeholder="Enter full name" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Phone Number</label> <input type="tel"
						name="phone" class="form-control" placeholder="Enter phone number"
						required>
				</div>

				<div class="mb-3">
					<label class="form-label">License Number</label> <input type="text"
						name="licenseNumber" class="form-control"
						placeholder="Enter license number" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Upload Driver Image</label> <input
						type="file" name="imageFile" class="form-control" accept="image/*"
						required>
				</div>

				<button type="submit" class="btn btn-primary w-100">Add
					Driver</button>
			</form>
		</div>

		<!-- Driver List -->
		<div class="table-responsive mt-5">
			<h3 class="text-center">Driver List</h3>
			<table class="table table-bordered">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Phone</th>
						<th>License</th>
						<th>Image</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					DriverDao driverDao = new DriverDao();
					List<Driver> drivers = driverDao.getAllDrivers();
					for (Driver driver : drivers) {
					%>
					<tr>
						<td><%=driver.getId()%></td>
						<td><%=driver.getDriverName()%></td>
						<td><%=driver.getPhone()%></td>
						<td><%=driver.getLicenseNumber()%></td>
						<td><img
							src="<%=request.getContextPath() + "/images/" + driver.getImage()%>"
							width="80" height="50" class="img-thumbnail"
							onerror="this.onerror=null; this.src='default.jpg';"></td>
						<td>
							<!-- Delete Driver -->
							<form
								action="${pageContext.request.contextPath}/DriverManagementServlet"
								method="post" class="d-inline">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="<%=driver.getId()%>">
								<!-- Edit Button -->
								<a href="editDriver.jsp?id=<%=driver.getId()%>"
									class="btn btn-warning btn-sm">✏ Edit</a>
								<button type="submit" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">🗑 Delete</button>
							</form>
						</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>
