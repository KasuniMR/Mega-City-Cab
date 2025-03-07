<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Car</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
body {
    background-color: #1e1e1e;
    color: white;
}

.container {
    margin-top: 50px;
    max-width: 600px;
}

.card {
    background: #2a2a2a;
    color: white;
    border-radius: 15px;
    box-shadow: 0 4px 12px rgba(255, 255, 255, 0.1);
}

.card-header {
    background: #007bff;
    color: white;
    font-size: 22px;
    font-weight: bold;
    text-align: center;
    border-radius: 15px 15px 0 0;
}

.form-control {
    background: #333;
    color: white;
    border: 1px solid #555;
}

.form-control:focus {
    background: #444;
    color: white;
    border-color: #007bff;
    box-shadow: none;
}

.btn-primary {
    background: #007bff;
    border: none;
    transition: all 0.3s ease-in-out;
}

.btn-primary:hover {
    background: #0056b3;
    transform: scale(1.05);
}

.car-img {
    width: 50%;
    max-height: 200px;
    display: block;
    margin: 15px auto;
    border-radius: 5px;
    border: 3px solid #007bff;
    object-fit: cover;
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
        <div class="card">
            <div class="card-header">Edit Car</div>
            <div class="card-body">
                <form action="${pageContext.request.contextPath}/CarManagementServlet" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
                    <input type="hidden" name="existingImage" value="<%= request.getParameter("image") %>">
                    
                    <div class="mb-3">
                        <label for="brandName" class="form-label">Brand Name:</label>
                        <input type="text" class="form-control" id="brandName" name="brandName" value="<%= request.getParameter("brandName") %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="capacity" class="form-label">Capacity:</label>
                        <input type="number" class="form-control" id="capacity" name="capacity" value="<%= request.getParameter("capacity") %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="price" class="form-label">Price:</label>
                        <input type="text" class="form-control" id="price" name="price" value="<%= request.getParameter("price") %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="licensePlate" class="form-label">License Plate:</label>
                        <input type="text" class="form-control" id="licensePlate" name="licensePlate" value="<%= request.getParameter("licensePlate") %>" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="imageFile" class="form-label">Upload New Image (Optional):</label>
                        <input type="file" class="form-control" id="imageFile" name="imageFile">
                    </div>
                    
                    <% if (request.getParameter("image") != null && !request.getParameter("image").isEmpty()) { %>
                        <p class="text-center">Current Image:</p>
                        <img src="${pageContext.request.contextPath}/images/<%= request.getParameter("image") %>" alt="Car Image" class="car-img">
                    <% } %>
                    
                    <div class="d-flex justify-content-between">
                        <button type="submit" class="btn btn-primary">Update Car</button>
                        <a href="manageCars.jsp" class="btn btn-secondary">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
