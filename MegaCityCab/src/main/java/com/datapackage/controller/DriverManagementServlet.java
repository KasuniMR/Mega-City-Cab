package com.datapackage.controller;

import com.datapackage.dao.DriverDao;
import com.datapackage.model.Driver;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/DriverManagementServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class DriverManagementServlet extends HttpServlet {
    private DriverDao driverDao = new DriverDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Handle new driver addition
            String name = request.getParameter("driverName");
            String phone = request.getParameter("phone");
            String license = request.getParameter("licenseNumber");

            // Handle file upload
            Part filePart = request.getPart("imageFile");
            String fileName = filePart.getSubmittedFileName();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();
            filePart.write(uploadPath + File.separator + fileName);

            System.out.println("Adding Driver: " + name + ", Phone: " + phone + ", License: " + license + ", Image: " + fileName);

            driverDao.addDriver(new Driver(0, name, phone, license, fileName));

        } else if ("delete".equals(action)) {
            // Handle driver deletion
            int id = Integer.parseInt(request.getParameter("id"));
            driverDao.deleteDriver(id);
            System.out.println("Deleted driver ID: " + id);

        } else if ("update".equals(action)) {
            // Handle driver update
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("driverName");
            String phone = request.getParameter("phone");
            String license = request.getParameter("licenseNumber");

            // Fetch the existing driver to get the current image name
            Driver existingDriver = driverDao.getDriverById(id);
            String currentImage = existingDriver != null ? existingDriver.getImage() : "default.jpg";

            // Handle file upload
            Part filePart = request.getPart("imageFile");
            String fileName = filePart.getSubmittedFileName();

            // If a new image is uploaded, replace the existing one
            if (fileName != null && !fileName.isEmpty()) {
                String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();
                filePart.write(uploadPath + File.separator + fileName);
            } else {
                fileName = currentImage; // Keep the old image if no new one is uploaded
            }

            System.out.println("Updating Driver ID: " + id + ", Name: " + name + ", Phone: " + phone + ", License: " + license + ", Image: " + fileName);

            // Update driver in DB
            driverDao.updateDriver(new Driver(id, name, phone, license, fileName));
        }

        response.sendRedirect("Admin/manageDrivers.jsp");
    }
}
