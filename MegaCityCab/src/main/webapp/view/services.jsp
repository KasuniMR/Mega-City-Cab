<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Services - Car Rental</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
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
        .blog-header {
            background: url('../images/front2.jpg') no-repeat center center/cover;
            padding: 50px 0;
            text-align: center;
            color: white;
        }
        .experience-box {
            background: #002147;
            color: #fff;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
        }
        .experience-box h2 {
            font-size: 2.5rem;
            font-weight: bold;
            margin: 0;
        }
        .service-section {
            padding: 80px 0;
            color:white;
        }
        .service-title {
            font-weight: bold;
            color: white;
        }
        .checklist {
            list-style: none;
            padding: 0;
        }
        .checklist li {
            display: flex;
            align-items: center;
            font-size: 1rem;
            margin-bottom: 10px;
        }
        .checklist li i {
            color: white;
            margin-right: 10px;
            font-size: 1.2rem;
        }
        .about-btn {
            background: #f77f00;
            color: white;
            border-radius: 8px;
            padding: 12px 20px;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            transition: 0.3s;
        }
        .about-btn:hover {
            background: #e66b00;
        }
        .founder {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
        .founder img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
        }
        .founder h5 {
            font-weight: bold;
            margin: 0;
        }
.footer a {
    color: #e0e0e0;
    text-decoration: none;
}
.footer a:hover {
    color: #4caf50;
}
.service{
color:white;
}
</style>
</head>
<body>

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
                    <li class="nav-item"><a class="nav-link active" href="#">Services</a></li>
                    <li class="nav-item"><a class="nav-link" href="booking.jsp">Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="blog.jsp">Blog</a></li>
                    <li class="nav-item"><a class="nav-link" href="ContactUs.jsp">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->  
    <header class="blog-header">
    <div class="container">
        <h1 class="display-4 fw-bold">Our Premium Services</h1>
            <p class="lead">Experience comfort, safety, and affordability with our car rental services.</p>
    </div>
</header>
    
    <!-- Services Section -->
<section class="service-section">
    <div class="container">
        <div class="row align-items-center">
            <!-- Left Section (Images & Experience) -->
            <div class="col-md-4 text-center">
                <img src="<%=request.getContextPath() + "/images/rental1.jpg"%>" alt="Happy Customer" class="img-fluid rounded shadow-sm mb-3" width="100%">
                <div class="experience-box mt-3">
                    <h2>14</h2>
                    <p>Years Of Experience</p>
                </div>
            </div>

            <!-- Middle Section (Main Image) -->
            <div class="col-md-4">
                <img src="<%=request.getContextPath() + "/images/rental.jpg"%>" alt="Car Rental Agent" class="img-fluid rounded shadow-lg">
            </div>

            <!-- Right Section (Text Content) -->
            <div class="col-md-4">
                <h2 class="service-title">THE BEST CAR RENTAL SERVICE IN THE WORLD</h2>
                <p>Discover the ease and comfort of renting a car with us. Whether you're exploring a new city, heading on a road trip, or need a reliable ride for business, 
                we ensure a smooth, stress-free experience from start to finish.</p>

                <div class="row">
                    <div class="col-md-6">
                        <ul class="checklist">
                            <li><i class="fas fa-check-circle"></i> Seamless Booking – Reserve your car in minutes with our easy-to-use platform.</li>
                            <li><i class="fas fa-check-circle"></i> Top-Quality Vehicles – Choose from a fleet of well-maintained cars, from economy to luxury.</li>
                            <li><i class="fas fa-check-circle"></i>  Transparent Pricing – No hidden fees, just affordable rates.</li>
                        </ul>
                    </div>
                    <div class="col-md-6">
                        <ul class="checklist">
                            <li><i class="fas fa-check-circle"></i> Exceptional Support – 24/7 customer assistance to help with your journey.</li>
                            <li><i class="fas fa-check-circle"></i>Convenient Pickup & Drop-Off – Multiple locations for your convenience.</li>
                        </ul>
                    </div>
                </div>

                <a href="about.jsp" class="about-btn">MORE ABOUT US →</a>

                <div class="founder">
                    <img src="<%=request.getContextPath() + "/images/Kasuni.png"%>" alt="Founder">
                    <div>
                        <h5>Kasuni Rajapaksha</h5>
                        <p class="m-0">Mega City Cab Founder</p>
                    </div>
                </div>
            </div>
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
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
