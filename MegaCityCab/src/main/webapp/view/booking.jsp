<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.datapackage.dao.CarDao"%>
<%@ page import="com.datapackage.model.Car"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Booking</title>
<script src="https://kit.fontawesome.com/a076d05399.js"
	crossorigin="anonymous"></script>
<!-- Font Awesome -->
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
body {
	font-family: 'Poppins', sans-serif;
	background-color: #121212;
	color: #e0e0e0;
	margin: 0;
	padding: 0;
}
.navbar, .footer {
	background-color: #1e1e1e;
}
.navbar-brand, .nav-link {
	color: #ffffff !important;
}
.nav-link:hover {
	color: #4caf50 !important;
}
.hero {
	background: linear-gradient(to right, #2e7d32, #1b5e20);
	padding: 50px 0;
	text-align: center;
	color: white;
}
.car-container {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 20px;
	padding: 30px;
	max-width: 1200px;
	margin: 0 auto;
}
.car-card {
	background: #1e1e1e;
	border-radius: 12px;
	box-shadow: 0 6px 10px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	transition: transform 0.3s ease-in-out;
	padding: 15px;
	text-align: center;
}
.car-card:hover {
	transform: translateY(-5px);
}
.car-image img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 10px;
}
.car-info h2 {
	font-size: 20px;
	color: #4caf50;
	margin-bottom: 10px;
}
.price {
	font-size: 18px;
	font-weight: bold;
	color: #4caf50;
	margin: 15px 0;
}
.rent-btn {
	background-color: #4caf50;
	color: white;
	border: none;
	padding: 12px;
	border-radius: 20px;
	cursor: pointer;
	width: 100%;
	font-size: 14px;
	transition: background 0.3s ease;
}
.rent-btn:hover {
	background-color: #388e3c;
}
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg shadow-sm">
	<div class="container">
		<a class="navbar-brand fw-bold" href="#">MEGA CITY<span class="text-success">CAB</span></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav ms-auto">
				<li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
				<li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
				<li class="nav-item"><a class="nav-link active" href="booking.jsp">Cars</a></li>
				<li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
				<li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact</a></li>
			</ul>
		</div>
	</div>
</nav>

<!-- Booking Section -->
<section class="hero">
	<div class="container">
		<h1>Our Vehicle Fleet</h1>
		<p>Experience the best car rental service with our diverse fleet of vehicles.</p>
	</div>
</section>

<!-- Car Listing -->
<div class="car-container">
	<%
	CarDao carDao = new CarDao();
	List<Car> cars = carDao.getAllCars();
	for (Car car : cars) {
	%>
	<div class="car-card">
		<div class="car-image">
			<img src="${pageContext.request.contextPath}/images/<%= car.getImage() %>" alt="<%= car.getBrandName() %>">
		</div>
		<div class="car-info">
			<h2><%=car.getBrandName()%></h2>
			<p><i class="fas fa-users"></i> Seats: <%=car.getCapacity()%></p>
			<p><i class="fas fa-gas-pump"></i> Fuel: Petrol</p>
			<p><i class="fas fa-cogs"></i> Transmission: Automatic</p>
			<p class="price">Daily rate from: Rs.<%=car.getPrice()%>/Day</p>
			<button class="rent-btn" onclick="addToCart('<%=car.getBrandName()%>', '<%=car.getPrice()%>', '<%=car.getCapacity()%>', 'Automatic', 'Petrol')">
				Rent Now
			</button>
		</div>
	</div>
	<%
	}
	%>
</div>

<script>
	function addToCart(name, price, seats, transmission, fuel) {
		var url = "Addcart.jsp?name=" + encodeURIComponent(name) + "&price=" + encodeURIComponent(price) + "&seats=" + encodeURIComponent(seats) + "&transmission=" + encodeURIComponent(transmission) + "&fuel=" + encodeURIComponent(fuel);
		window.location.href = url;
	}
</script>

	<!-- Footer -->
	<footer class="bg-dark text-white py-5 mt-5">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<h5 class="fw-bold">MEGA CITY<span class="text-success">CAB</span></h5>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.</p>
					<div class="d-flex">
						<a href="#" class="text-white me-3"><i
							class="fab fa-twitter fa-lg"></i></a> <a href="#"
							class="text-white me-3"><i class="fab fa-facebook-f fa-lg"></i></a>
						<a href="#" class="text-white"><i
							class="fab fa-instagram fa-lg"></i></a>
					</div>
				</div>
				<div class="col-md-3">
					<h5>Information</h5>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white">About</a></li>
						<li><a href="#" class="text-white">Services</a></li>
						<li><a href="#" class="text-white">Term and Conditions</a></li>
						<li><a href="#" class="text-white">Best Price Guarantee</a></li>
						<li><a href="#" class="text-white">Privacy & Cookies
								Policy</a></li>
					</ul>
				</div>
				<div class="col-md-3">
					<h5>Customer Support</h5>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white">FAQ</a></li>
						<li><a href="#" class="text-white">Payment Option</a></li>
						<li><a href="#" class="text-white">Booking Tips</a></li>
						<li><a href="#" class="text-white">How it works</a></li>
						<li><a href="#" class="text-white">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-3">
					<h5>Have a Questions?</h5>
					<p>
						<i class="fas fa-map-marker-alt me-2"></i>203 Fake St. Mountain
						View, San Francisco, California, USA
					</p>
					<p>
						<i class="fas fa-phone me-2"></i>+2 392 3929 210
					</p>
					<p>
						<i class="fas fa-envelope me-2"></i>info@yourdomain.com
					</p>
				</div>
			</div>
			<div class="text-center mt-4">
				<p>
					Copyright &copy;2025 All rights reserved | This template is made
					with <i class="fas fa-heart text-danger"></i> by Kasuni
				</p>
			</div>
		</div>
	</footer>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		function addToCart(name, price, seats, transmission, fuel) {
			var url = "Addcart.jsp?name=" + encodeURIComponent(name)
					+ "&price=" + encodeURIComponent(price) + "&seats="
					+ encodeURIComponent(seats) + "&transmission="
					+ encodeURIComponent(transmission) + "&fuel="
					+ encodeURIComponent(fuel);

			window.location.href = url;
		}
	</script>

</body>
</html>
