<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.io.FileOutputStream, java.io.IOException" %>
<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.PdfWriter" %>
<%@ page session="true" %>

<%
    // Retrieve cart and total price from session
    List<String[]> cart = (List<String[]>) session.getAttribute("cart");
    String totalPrice = request.getParameter("totalPrice");

    if (cart != null && !cart.isEmpty()) {
        String filePath = application.getRealPath("/") + "bills/Invoice.pdf";
        Document document = new Document();

        try {
            PdfWriter.getInstance(document, new FileOutputStream(filePath));
            document.open();

            // Add Invoice Header
            document.add(new Paragraph("Car Rental Invoice"));
            document.add(new Paragraph("==================================="));

            // Add Car Details
            for (String[] car : cart) {
                document.add(new Paragraph("Car: " + car[0]));
                document.add(new Paragraph("Price: Rs. " + car[1] + " per day"));
                document.add(new Paragraph("Seats: " + car[2]));
                document.add(new Paragraph("Transmission: " + car[3]));
                document.add(new Paragraph("Fuel: " + car[4]));
                document.add(new Paragraph("-----------------------------------"));
            }

            // Add Total Price
            document.add(new Paragraph("Total Amount: Rs. " + totalPrice));
            document.add(new Paragraph("==================================="));

            document.close();
            session.removeAttribute("cart"); // Clear cart after generating bill

            // Redirect to download page
            response.sendRedirect("DownloadBill.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    } else {
        response.sendRedirect("Checkout.jsp?error=NoItems");
    }
%>
