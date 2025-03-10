<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList, java.util.Iterator" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Cart</title>

        <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

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
        .container {
            margin-top: 40px;
        }
        .cart-container {
            background: #1e1e1e;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
        }
        .empty-cart {
            text-align: center;
            font-size: 18px;
            color: #b0b0b0;
        }
        .table {
            color: #e0e0e0;
        }
        .table th {
            background-color: #4caf50;
            color: white;
            text-align: center;
        }
        .table td {
            text-align: center;
            vertical-align: middle;
        }
        .remove-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }
        .remove-btn:hover {
            background-color: #c82333;
        }
        .btn {
            text-decoration: none;
            font-size: 16px;
            padding: 10px 15px;
            border-radius: 5px;
            display: inline-block;
            margin: 5px;
        }
        .btn-continue {
            background-color: #4caf50;
            color: white;
        }
        .btn-continue:hover {
            background-color: #388e3c;
        }
        .btn-checkout {
            background-color: #007bff;
            color: white;
        }
        .btn-checkout:hover {
            background-color: #0056b3;
        }
        .btn-back {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 15px;
        }
        .btn-back:hover {
            background-color: #0056b3;
        }
        .total-price {
            font-size: 22px;
            font-weight: bold;
            text-align: right;
            margin-top: 15px;
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
    </div>
</nav>

    <div class="container">
        <h2 class="text-center">🛒 Your Car Booking Cart</h2>
        
        <div class="text-start mb-3">
            <a href="booking.jsp" class="btn btn-back">⬅️ Back</a>
        </div>
        

        <% List<String[]> cart = (List<String[]>) session.getAttribute("cart");
            if (cart == null) {
                cart = new ArrayList<>();
            }

            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String seats = request.getParameter("seats");
            String transmission = request.getParameter("transmission");
            String fuel = request.getParameter("fuel");

            if (name != null && price != null) {
                String[] car = { name, price, seats, transmission, fuel };
                cart.add(car);
                session.setAttribute("cart", cart);
            }
        %>

        <div class="cart-container">
            <% if (cart.isEmpty()) { %>
                <p class="empty-cart">🛒 Your cart is empty. <a href="${pageContext.request.contextPath}/view/booking.jsp" class="text-success">Browse Cars</a></p>
            <% } else { %>

                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th>Car</th>
                            <th>Price (Rs/Day)</th>
                            <th>Seats</th>
                            <th>Transmission</th>
                            <th>Fuel</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% double totalPrice = 0;
                            Iterator<String[]> iterator = cart.iterator();
                            while (iterator.hasNext()) {
                                String[] car = iterator.next();
                                totalPrice += Double.parseDouble(car[1]);
                        %>
                        <tr>
                            <td><%= car[0] %></td>
                            <td>Rs. <%= car[1] %></td>
                            <td><%= car[2] %></td>
                            <td><%= car[3] %></td>
                            <td><%= car[4] %></td>
                            <td>
                                <form action="RemoveFromCart.jsp" method="post">
                                    <input type="hidden" name="name" value="<%= car[0] %>">
                                    <button type="submit" class="remove-btn">❌ Remove</button>
                                </form>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>

                <div class="total-price text-end">
                    Total: Rs. <%= totalPrice %>
                </div>

                <div class="text-center mt-3">
                    <a href="booking.jsp" class="btn btn-continue">🔄 Continue Booking</a>
                    <a href="Checkout.jsp" class="btn btn-checkout">💳 Proceed to Checkout</a>
                </div>
            <% } %>
        </div>
    </div>
    
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
                <p><i class="fas fa-map-marker-alt me-2"></i>203 Fake St. Mountain View, San Francisco, California, USA</p>
                <p><i class="fas fa-phone me-2"></i>+2 392 3929 210</p>
                <p><i class="fas fa-envelope me-2"></i>info@yourdomain.com</p>
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