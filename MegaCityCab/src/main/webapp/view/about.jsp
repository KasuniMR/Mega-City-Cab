<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car Rental - About Us</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

<style>
body {
    background-color: #121212;
    color: #e0e0e0;
    font-family: 'Poppins', sans-serif;
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
.btn-primary {
    background-color: #4caf50;
    border: none;
}
.btn-primary:hover {
    background-color: #388e3c;
}
.about {
    padding: 50px 0;
}
.about h2 {
    font-size: 36px;
    color: #4caf50;
    margin-bottom: 20px;
}
.about p {
    font-size: 18px;
    line-height: 1.6;
}
.about img {
    border-radius: 10px;
}
.icon-box i {
    font-size: 50px;
    margin-bottom: 15px;
    color: #4caf50;
}
.footer a {
    color: #e0e0e0;
    text-decoration: none;
}
.footer a:hover {
    color: #4caf50;
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
                    <li class="nav-item"><a class="nav-link active" href="#">About</a></li>
                    <li class="nav-item"><a class="nav-link" href="services.jsp">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="booking.jsp">Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- About Section -->
	<section class="container mt-5">
		<div class="row align-items-center">
			<div class="col-md-6">
				<h2 class="fw-bold">About Us</h2>
				<p class="lead">A small river named Duden flows by their place
					and supplies it with the necessary regelialia. It is a
					paradisematic country, in which roasted parts of sentences fly into
					your mouth. On her way she met a copy. The copy warned the Little
					Blind Text, that where it came from it would have been rewritten a
					thousand times and everything that was left from its origin would
					be the word "and" and the Little Blind Text should turn around and
					return to its own, safe country. A small river named Duden flows by
					their place and supplies it with the necessary regelialia. It is a
					paradisematic country, in which roasted parts of sentences fly into
					your mouth.</p>
				<a href="ContactUs.jsp" class="btn btn-primary">Get in Touch</a>
			</div>
			<div class="col-md-6 text-center">
				<img src="<%=request.getContextPath() + "/images/rent.jpg"%>"
					class="img-fluid rounded" alt="About Us">
			</div>
		</div>
	</section>

	<!-- Why Choose Us Section -->
	<section class="container mt-5">
		<h2 class="text-center fw-bold">Why Choose Us?</h2>
		<div class="row text-center mt-4">
			<div class="col-md-4">
				<i class="fas fa-car fa-3x text-primary"></i>
				<h4 class="mt-3">Wide Range of Vehicles</h4>
				<p>We offer a variety of cars, from economy to luxury, to suit
					your preferences and budget.</p>
			</div>
			<div class="col-md-4">
				<i class="fas fa-dollar-sign fa-3x text-success"></i>
				<h4 class="mt-3">Affordable Prices</h4>
				<p>Enjoy competitive rates and exclusive deals on car rentals
					with no hidden fees.</p>
			</div>
			<div class="col-md-4">
				<i class="fas fa-headset fa-3x text-warning"></i>
				<h4 class="mt-3">24/7 Customer Support</h4>
				<p>Our dedicated support team is available around the clock to
					assist you with any queries.</p>
			</div>
		</div>
	</section>

    <!-- Footer -->
<footer class="bg-dark text-white py-5 mt-5">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5 class="fw-bold">MEGA CITY<span class="text-success">CAB</span></h5>
                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                <div class="d-flex">
                    <a href="#" class="text-white me-3"><i class="fab fa-twitter fa-lg"></i></a>
                    <a href="#" class="text-white me-3"><i class="fab fa-facebook-f fa-lg"></i></a>
                    <a href="#" class="text-white"><i class="fab fa-instagram fa-lg"></i></a>
                </div>
            </div>
            <div class="col-md-3">
                <h5>Information</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white">About</a></li>
                    <li><a href="#" class="text-white">Services</a></li>
                    <li><a href="#" class="text-white">Term and Conditions</a></li>
                    <li><a href="#" class="text-white">Best Price Guarantee</a></li>
                    <li><a href="#" class="text-white">Privacy & Cookies Policy</a></li>
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
                <p><i class="fas fa-map-marker-alt me-2"></i>Level 3, 61, Janadhipathi Mawatha, 00100, Colombo</p>
                <p><i class="fas fa-phone me-2"></i>+2 392 3929 210</p>
                <p><i class="fas fa-envelope me-2"></i>kasunirajapaksha.net@gmail.com</p>
            </div>
        </div>
        <div class="text-center mt-4">
            <p>Copyright &copy;2025 All rights reserved | This template is made with <i class="fas fa-heart text-danger"></i> by Kasuni</p>
        </div>
    </div>
</footer>

    
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>