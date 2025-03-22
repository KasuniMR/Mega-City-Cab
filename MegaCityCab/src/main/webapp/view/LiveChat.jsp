<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Live Chat - Mega City Cab</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        body { background-color: #121212; color: white; }
        .chat-container {
            max-width: 600px;
            margin: 50px auto;
            background: #1e1e1e;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.4);
        }
        .chat-box {
            height: 400px;
            overflow-y: auto;
            padding: 10px;
            border: 1px solid #333;
            border-radius: 10px;
            background: #2e2e2e;
            display: flex;
            flex-direction: column;
        }
        .chat-input { display: flex; margin-top: 15px; gap: 10px; }
        .chat-input input {
            flex: 1; padding: 12px; border-radius: 25px; border: none; background: #333; color: white; outline: none;
        }
        .chat-input button {
            background: #4caf50; border: none; padding: 12px 20px; border-radius: 25px; color: white; font-weight: bold; cursor: pointer;
        }
        .chat-input button:hover { background: #388e3c; }
        .message { padding: 10px 15px; border-radius: 20px; margin: 5px 0; max-width: 75%; font-size: 14px; }
        .user-message { background: #4caf50; align-self: flex-end; color: white; text-align: right; border-bottom-right-radius: 0; }
        .bot-message { background: #555; align-self: flex-start; color: white; border-bottom-left-radius: 0; }
        .chat-suggestions { text-align: center; margin-bottom: 10px; }
        .suggestion-btn {
            background: #444; border: none; padding: 8px 12px; border-radius: 15px; color: white; font-size: 12px; cursor: pointer; margin: 3px;
        }
        .suggestion-btn:hover { background: #666; 
        }.back-button {
            display: inline-block;
            background: #ff9800;
            color: white;
            padding: 12px 25px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: bold;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
            width: max-content;
            margin: 20px auto;
            box-shadow: 0px 5px 15px rgba(255, 152, 0, 0.4);
            
        }
        .back-button:hover {
            background: #e68900;
            box-shadow: 0px 8px 20px rgba(255, 152, 0, 0.6);
            transform: translateY(-3px);
        }
        .back-button i {
            margin-right: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="Home.jsp">MEGA CITY<span class="text-success">CAB</span></a>
        </div>
    </nav>
    
    <!-- Back Button -->
    <div class="container mt-3">
        <a href="home.jsp" class="back-button"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </div>
    
    <div class="chat-container">
        <h3 class="text-center">Live Chat Support</h3>
        
        <!-- Quick Suggestions -->
        <div class="chat-suggestions" id="chatSuggestions">
            <p>Quick Suggestions:</p>
            <button class="suggestion-btn" onclick="setSuggestion('how do i book a car')">How do I book a car?</button>
            <button class="suggestion-btn" onclick="setSuggestion('what are the payment options')">What are the payment options?</button>
            <button class="suggestion-btn" onclick="setSuggestion('can i cancel my booking')">Can I cancel my booking?</button>
            <button class="suggestion-btn" onclick="setSuggestion('is there an age restriction')">Is there an age restriction?</button>
        </div>
        
        <div class="chat-box" id="chatBox">
            <div class="bot-message message">Welcome to Mega City Cab! How can I assist you today?</div>
        </div>
        <div class="chat-input">
            <input type="text" id="chatInput" placeholder="Type a message..." onkeypress="handleKeyPress(event)">
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>
    
    <script>
        const faqResponses = {
            "how do i book a car": "You can book a car through our <a href='booking.jsp' class='text-success'>Booking Page</a>.",
            "what are the payment options": "We accept credit cards, debit cards, and online payment gateways such as PayPal.",
            "can i cancel my booking": "Yes, you can cancel or modify your booking up to 24 hours before your rental period.",
            "is there an age restriction": "Yes, the minimum age to rent a car is 21 years old. Some vehicles require a higher age limit."
        };
        
        function sendMessage() {
            const input = document.getElementById("chatInput");
            const message = input.value.trim().toLowerCase();
            if (message === "") return;

            const chatBox = document.getElementById("chatBox");
            const userMessage = document.createElement("div");
            userMessage.classList.add("user-message", "message");
            userMessage.textContent = input.value;
            chatBox.appendChild(userMessage);
            chatBox.scrollTop = chatBox.scrollHeight;

            input.value = "";

            setTimeout(() => {
                const botMessage = document.createElement("div");
                botMessage.classList.add("bot-message", "message");
                botMessage.innerHTML = faqResponses[message] || "Thank you for your message. A support agent will be with you shortly.";
                chatBox.appendChild(botMessage);
                chatBox.scrollTop = chatBox.scrollHeight;
            }, 1000);
        }

        function handleKeyPress(event) {
            if (event.key === "Enter") {
                sendMessage();
            }
        }
        
        function setSuggestion(message) {
            document.getElementById("chatInput").value = message;
        }
    </script>
    
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
