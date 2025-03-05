package com.datapackage.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.datapackage.dao.CarDao;
import com.datapackage.model.Car;

@WebServlet("/CarManagementServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class CarManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "images";
    private CarDao carDao = new CarDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            if ("add".equals(action)) {
                addCar(request, response);
            } else if ("update".equals(action)) {
                updateCar(request, response);
            } else if ("delete".equals(action)) {
                deleteCar(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Admin/manageCars.jsp?error=Something went wrong! " + e.getMessage());
        }
    }

    private void addCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Car car = new Car();
        car.setBrandName(request.getParameter("brandName"));
        car.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        car.setPrice(Double.parseDouble(request.getParameter("price")));
        car.setLicensePlate(request.getParameter("licensePlate"));

        // Handle Image Upload
        Part filePart = request.getPart("imageFile");
        String fileName = (filePart != null && filePart.getSize() > 0) ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : "default.jpg";

        if (!"default.jpg".equals(fileName)) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);
        }

        car.setImage(fileName);
        boolean success = carDao.addCar(car);
        response.sendRedirect("Admin/manageCars.jsp?success=" + (success ? "Car added successfully!" : "Failed to add car"));
    }

    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Car car = new Car();
        car.setId(id);
        car.setBrandName(request.getParameter("brandName"));
        car.setCapacity(Integer.parseInt(request.getParameter("capacity")));
        car.setPrice(Double.parseDouble(request.getParameter("price")));
        car.setLicensePlate(request.getParameter("licensePlate"));

        // Handle Image Upload for Update
        Part filePart = request.getPart("imageFile");
        String existingImage = request.getParameter("existingImage");
        String fileName = (filePart != null && filePart.getSize() > 0) ? Paths.get(filePart.getSubmittedFileName()).getFileName().toString() : existingImage;

        if (!fileName.equals(existingImage)) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);
        }

        car.setImage(fileName);
        boolean success = carDao.updateCar(car);
        response.sendRedirect("Admin/manageCars.jsp?success=" + (success ? "Car updated successfully!" : "Failed to update car"));
    }

    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean success = carDao.deleteCar(id);
        response.sendRedirect("Admin/manageCars.jsp?success=" + (success ? "Car deleted successfully!" : "Failed to delete car"));
    }
}
