<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.datapackage.dao.CarDao"%>
<%@ page import="com.datapackage.model.Car"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Cars</title>

<!-- Bootstrap CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
/* Dark Mode Styling */
body {
	background-color: #1e1e1e;
	color: #f8f9fa;
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

.form-control, .form-label {
	background-color: #333;
	color: white;
	border: none;
}

.form-control::placeholder {
	color: #bbb;
}

.table {
	background-color: #2a2a2a;
	color: white;
	border-radius: 8px;
	overflow: hidden;
}

.table-dark th {
	background-color: #121212;
}

.table tbody tr:hover {
	background-color: rgba(255, 255, 255, 0.1);
	transition: 0.3s;
}

.btn-primary {
	background-color: #007bff;
	border: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.btn-danger {
	background-color: #dc3545;
}

.btn-warning {
	background-color: #ffc107;
	color: black;
}

.img-thumbnail {
	border-radius: 5px;
}

h2, h3 {
	text-align: center;
	font-weight: bold;
	color: #ffcc00;
}

/* Back Button Styling */
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
	color: white;
	transform: scale(1.05);
}
</style>
</head>
<body>

	<div class="container">
		<!-- Back to Admin Home Button -->
		<a href="${pageContext.request.contextPath}/Admin/AdminHome.jsp" class="back-btn">⬅ Back to Admin Home</a>

		<h2>🚗 Manage Cars</h2>

		<!-- Add Car Form -->
		<div class="form-container">
			<h4>Add a New Car</h4>
			<form action="<%=request.getContextPath()%>/CarManagementServlet"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="action" value="add">

				<div class="mb-3">
					<label class="form-label">Brand Name</label> <input type="text"
						name="brandName" class="form-control"
						placeholder="Enter brand name" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Capacity</label> <input type="number"
						name="capacity" class="form-control" placeholder="Enter capacity"
						required>
				</div>

				<div class="mb-3">
					<label class="form-label">Price</label> <input type="text"
						name="price" class="form-control" placeholder="Enter price"
						required>
				</div>

				<div class="mb-3">
					<label class="form-label">License Plate</label> <input type="text"
						name="licensePlate" class="form-control"
						placeholder="Enter license plate" required>
				</div>

				<div class="mb-3">
					<label class="form-label">Upload Car Image</label> <input
						type="file" name="imageFile" class="form-control" accept="image/*"
						required>
				</div>

				<button type="submit" class="btn btn-primary w-100">Add Car</button>
			</form>
		</div>

		<h3 class="mt-5">Car List</h3>

		<!-- Car List Table -->
		<div class="table-responsive">
			<table class="table table-bordered car-table">
				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Brand</th>
						<th>Capacity</th>
						<th>Price</th>
						<th>License Plate</th>
						<th>Image</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<%
					CarDao carDao = new CarDao();
					List<Car> cars = carDao.getAllCars();
					for (Car car : cars) {
					%>
					<tr>
						<td><%=car.getId()%></td>
						<td><%=car.getBrandName()%></td>
						<td><%=car.getCapacity()%></td>
						<td>Rs.<%=car.getPrice()%></td>
						<td><%=car.getLicensePlate()%></td>
						<td><img
							src="<%=request.getContextPath() + "/images/" + car.getImage()%>"
							width="100" height="60" class="img-thumbnail"
							onerror="this.onerror=null; this.src='default.jpg';"></td>
						<td><a href="editCar.jsp?id=<%=car.getId()%>
						&brandName=<%= car.getBrandName() %>
&capacity=<%= car.getCapacity() %>
&price=<%= car.getPrice() %>
&licensePlate=<%= car.getLicensePlate() %>
&image=<%= car.getImage()%>" 
class="btn btn-warning btn-sm">✏️ Edit</a>
							

							<form
								action="${pageContext.request.contextPath}/CarManagementServlet"
								method="post" class="d-inline">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="<%=car.getId()%>">
								<button type="submit" class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure?')">🗑️ Delete</button>
							</form></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
