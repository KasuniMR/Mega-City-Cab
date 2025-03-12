package com.datapackage.controller;


import databaseUtility.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String name = request.getParameter("name");
     String email = request.getParameter("email");
     String message = request.getParameter("message");

     if (name == null || email == null || message == null || name.isEmpty() || email.isEmpty() || message.isEmpty()) {
         response.sendRedirect("view/ContactUs.jsp?error=All fields are required!");
         return;
     }

     try (Connection conn = DBConnection.getConnection()) {
         String sql = "INSERT INTO contactus (name, email, message) VALUES (?, ?, ?)";
         try (PreparedStatement stmt = conn.prepareStatement(sql)) {
             stmt.setString(1, name);
             stmt.setString(2, email);
             stmt.setString(3, message);

             int rowsInserted = stmt.executeUpdate();
             if (rowsInserted > 0) {
                 response.sendRedirect("view/ContactUs.jsp?success=Your message has been sent successfully!");
             } else {
                 response.sendRedirect("view/ContactUs.jsp?error=Something went wrong. Please try again.");
             }
         }
     } catch (ClassNotFoundException | SQLException e) {
         e.printStackTrace();
         response.sendRedirect("view/ContactUs.jsp?error=Database error. Please try again.");
     }
 }
}
