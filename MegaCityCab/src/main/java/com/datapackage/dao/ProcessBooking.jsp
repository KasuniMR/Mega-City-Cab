<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.sql.Date, java.io.FileOutputStream, java.io.IOException, java.io.File, java.net.URLEncoder" %>
<%@ page import="com.itextpdf.text.*, com.itextpdf.text.pdf.PdfWriter, com.itextpdf.text.pdf.PdfPTable, com.itextpdf.text.pdf.PdfPCell" %>
<%@ page import="com.datapackage.dao.BookingDao, com.datapackage.model.Booking" %>
<%@ page session="true" %>

<%
    List<String[]> cart = (List<String[]>) session.getAttribute("cart");
    String totalPriceStr = request.getParameter("totalPrice");
    String startDateStr = request.getParameter("startDate");
    String endDateStr = request.getParameter("endDate");
    String paymentMethod = request.getParameter("paymentMethod");
    String userEmail = request.getParameter("email");
    String fromLocation = request.getParameter("fromLocation");
    String toLocation = request.getParameter("toLocation");

    if (cart != null && !cart.isEmpty() && userEmail != null && fromLocation != null && toLocation != null) {
        String directoryPath = application.getRealPath("/") + "bills";
        File directory = new File(directoryPath);
        if (!directory.exists()) {
            directory.mkdirs();
        }

        String fileName = "Invoice_" + System.currentTimeMillis() + ".pdf";
        String filePath = directoryPath + File.separator + fileName;
        Document document = new Document();
        BookingDao bookingDao = new BookingDao();

        try (FileOutputStream fos = new FileOutputStream(filePath)) {
            PdfWriter.getInstance(document, fos);
            document.open();

            document.add(new Paragraph("🚗 Car Rental Invoice", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 18)));
            document.add(new Paragraph("===================================="));
            document.add(new Paragraph("📅 Booking Dates: " + startDateStr + " to " + endDateStr));
            document.add(new Paragraph("📍 From: " + fromLocation));
            document.add(new Paragraph("📍 To: " + toLocation));
            document.add(new Paragraph("💳 Payment Method: " + paymentMethod));
            document.add(new Paragraph("📧 Customer Email: " + userEmail));
            document.add(new Paragraph(" "));

            Date startDate = Date.valueOf(startDateStr);
            Date endDate = Date.valueOf(endDateStr);
            double totalPrice = Double.parseDouble(totalPriceStr);

            PdfPTable table = new PdfPTable(5);
            table.setWidthPercentage(100);
            table.setSpacingBefore(10f);
            table.setSpacingAfter(10f);

            PdfPCell cell;
            Font headerFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12);
            String[] headers = {"Car Name", "Price per Day (Rs)", "Seats", "Transmission", "Fuel"};
            for (String header : headers) {
                cell = new PdfPCell(new Phrase(header, headerFont));
                cell.setBackgroundColor(BaseColor.LIGHT_GRAY);
                table.addCell(cell);
            }

            for (String[] car : cart) {
                table.addCell(car[0]);
                table.addCell(car[1]);
                table.addCell(car[2]);
                table.addCell(car[3]);
                table.addCell(car[4]);

                Booking booking = new Booking(0, userEmail, car[0], Double.parseDouble(car[1]), startDate, endDate, totalPrice, paymentMethod, fromLocation, toLocation, "Pending");
                bookingDao.saveBooking(booking);
            }

            document.add(table);
            document.add(new Paragraph("💰 Total Amount: Rs. " + totalPrice, FontFactory.getFont(FontFactory.HELVETICA_BOLD, 14)));
            document.add(new Paragraph("===================================="));
            document.close();
            session.removeAttribute("cart");

            response.sendRedirect("DownloadBill.jsp?file=" + URLEncoder.encode(fileName, "UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Checkout.jsp?error=InvoiceGenerationFailed");
        }
    } else {
        response.sendRedirect("Checkout.jsp?error=InvalidDetails");
    }
%>
