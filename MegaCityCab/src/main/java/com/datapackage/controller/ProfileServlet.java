package com.datapackage.controller;

import com.datapackage.dao.RegisterDao;
import com.datapackage.model.Register;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/ProfileServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10, // 10MB
                 maxRequestSize = 1024 * 1024 * 50) // 50MB
public class ProfileServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("uname");
        
        if (username == null) {
            response.sendRedirect("view/Login.jsp");
            return;
        }

        RegisterDao registerDao = new RegisterDao();
        Register existingUser = registerDao.getUserByUsername(username);
        if (existingUser == null) {
            response.sendRedirect("view/Login.jsp?error=userNotFound");
            return;
        }

        // Retrieve user inputs
        String fullName = request.getParameter("fullname");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        String newPassword = request.getParameter("password");
        
        // Update password only if provided
        String password = (newPassword == null || newPassword.isEmpty()) ? existingUser.getPassword() : newPassword;

        // Handling file upload
        Part filePart = request.getPart("profile_image");
        String imagePath = existingUser.getProfileImage(); // Keep existing image if no new upload

        if (filePart != null && filePart.getSize() > 0) {
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadDir = getServletContext().getRealPath("/") + "images";
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdir();
            }
            
            imagePath = "images/" + fileName;
            filePart.write(uploadDir + File.separator + fileName);
        }

        Register updatedUser = new Register(fullName, address, contact, username, password, imagePath);
        boolean updated = registerDao.updateUser(updatedUser);

        if (updated) {
            response.sendRedirect("view/profile.jsp?success=profileUpdated");
        } else {
            response.sendRedirect("view/profile.jsp?error=updateFailed");
        }
    }
}