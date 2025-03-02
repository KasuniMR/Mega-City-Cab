<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Materialize CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<style>
/* Custom styles for alignment */
.signup-container {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh; /* Full height */
}

.signup-image {
	max-width: 100%; /* Makes sure image is responsive */
	border-radius: 10px; /* Optional: Rounds image corners */
	box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.2);
	/* Optional: Adds shadow */
}

.link-style {
	text-decoration: none;
	color: #2196F3;
	font-weight: bold;
	display: block;
	margin-top: 15px;
	text-align: center;
}

.link-style:hover {
	color: #0b7dda; /* Darker blue on hover */
}
</style>
</head>
<body>
<div class="container">
		<div class="row signup-container">
    <div class="login-container">
    <div class="col s12 m5">
				<img src="images/car1.jpg" class="responsive-img signup-image">
			</div>
        <h2>Admin Login</h2>
        <form action="${pageContext.request.contextPath}/AdminLoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            
            <a href="${pageContext.request.contextPath}/AdminHome.jsp">
				<button type="submit">Login</button>
			</a>
			<button type="reset">Clear</button>
            
        </form>
        
        <%-- Display error message if login fails --%>
        <% String errorMessage = (String) request.getAttribute("errorMessage");
           if (errorMessage != null) { %>
            <p style="color: red;"><%= errorMessage %></p>
        <% } %>
    </div>
      </div>
</div>
    
    <script
			src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</body>
</html>