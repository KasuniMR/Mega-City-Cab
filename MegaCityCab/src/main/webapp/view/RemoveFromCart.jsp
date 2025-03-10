<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.Iterator" %>
<%@ page session="true" %>

<%
    // Get the car name to remove
    String carNameToRemove = request.getParameter("name");

    // Retrieve cart from session
    List<String[]> cart = (List<String[]>) session.getAttribute("cart");

    if (cart != null && carNameToRemove != null) {
        Iterator<String[]> iterator = cart.iterator();

        while (iterator.hasNext()) {
            String[] car = iterator.next();
            if (car[0].equals(carNameToRemove)) {
                iterator.remove();
                break; // Stop after removing the first matching item
            }
        }

        // Update the session after removal
        session.setAttribute("cart", cart);
    }

    // Redirect back to the cart page
    response.sendRedirect("Addcart.jsp");
%>
