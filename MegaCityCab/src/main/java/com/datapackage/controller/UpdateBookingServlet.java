package com.datapackage.controller;

import java.io.IOException;

import com.datapackage.dao.BookingDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UpdateBookingServlet")
public class UpdateBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));
        String action = request.getParameter("action");

        BookingDao bookingDao = new BookingDao();
        
        if ("confirm".equals(action)) {
            bookingDao.updateBookingStatus(bookingId, "Confirmed");
        } else if ("cancel".equals(action)) {
            bookingDao.updateBookingStatus(bookingId, "Cancelled");
        }

        response.sendRedirect("Admin/ManageBookings.jsp");
    }
}
