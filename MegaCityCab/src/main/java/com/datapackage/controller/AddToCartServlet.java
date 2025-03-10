package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {

       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get the car details from the URL parameters
        String carId = request.getParameter("carId");
        String price = request.getParameter("price");

        // Create or retrieve the session
        HttpSession session = request.getSession();
        
        // Create or retrieve the cart (using a HashMap to store items)
        Map<String, String> cart = (Map<String, String>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }

        // Add the car to the cart
        cart.put(carId, price);

        // Save the cart in the session
        session.setAttribute("cart", cart);

        // Redirect to the booking page or a cart summary page
        response.sendRedirect("view/booking.jsp");
    }

	

}
