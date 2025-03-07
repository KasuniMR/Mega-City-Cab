package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.datapackage.dao.CarDao;
import com.datapackage.model.Car;

@WebServlet("/DeleteCarServlet")
public class DeleteCarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(DeleteCarServlet.class.getName());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.trim().isEmpty()) {
            LOGGER.warning("No car ID provided for deletion.");
            response.sendRedirect("Admin/manageCar.jsp?error=No ID provided");
            return;
        }

        try {
            int carId = Integer.parseInt(idStr);
            CarDao carDao = new CarDao();

            // Attempt to delete the car
            boolean deleted = carDao.deleteCar(carId);

            if (deleted) {
                // Update session car list
                List<Car> updatedCarList = carDao.getAllCars();
                HttpSession session = request.getSession();
                session.setAttribute("carList", updatedCarList);

                LOGGER.info("Car with ID " + carId + " deleted successfully.");
                response.sendRedirect("Admin/manageCar.jsp?delete=success");
            } else {
                LOGGER.warning("Failed to delete car with ID " + carId + ".");
                response.sendRedirect("Admin/manageCars.jsp?error=Delete failed");
            }
        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid car ID format: " + idStr, e);
            response.sendRedirect("Admin/manageCars.jsp?error=Invalid ID format");
        }
    }
}
