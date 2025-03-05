package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.datapackage.dao.AddAdminDao;
import com.datapackage.model.AddAdmin;

/**
 * Servlet to handle updating admin details.
 */
@WebServlet("/Admin/UpdateAdminServlet") // Ensure this matches your JSP form action
public class UpdateAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(UpdateAdminServlet.class.getName());

    /**
     * Handles the POST request for updating an admin.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            // Retrieve and validate parameters
            String idParam = request.getParameter("id");
            String username = request.getParameter("username") != null ? request.getParameter("username").trim() : "";
            String email = request.getParameter("email") != null ? request.getParameter("email").trim() : "";
            String password = request.getParameter("password") != null ? request.getParameter("password").trim() : "";

            // Check for valid input
            if (idParam == null || idParam.isEmpty() || username.isEmpty() || email.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/Admin/AddAdmin.jsp?error=InvalidInput");
                return;
            }

            int id = Integer.parseInt(idParam);

            // Create an updated admin object
            AddAdmin updatedAdmin = new AddAdmin();
            updatedAdmin.setId(id);
            updatedAdmin.setUsername(username);
            updatedAdmin.setEmail(email);

            // If password is provided, update it
            if (!password.isEmpty()) {
                updatedAdmin.setPassword(password);
            }

            // Update in the database
            AddAdminDao adminDAO = new AddAdminDao();
            boolean updateSuccess = adminDAO.updateAdmin(updatedAdmin);

            // Redirect based on success/failure
            if (updateSuccess) {
                response.sendRedirect(request.getContextPath() + "/Admin/AddAdmin.jsp?update=success");
            } else {
                response.sendRedirect(request.getContextPath() + "/Admin/AddAdmin.jsp?error=updateFailed");
            }

        } catch (NumberFormatException e) {
            LOGGER.log(Level.SEVERE, "Invalid admin ID format", e);
            response.sendRedirect(request.getContextPath() + "/Admin/AddAdmin.jsp?error=invalidID");
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "Error updating admin", e);
            response.sendRedirect(request.getContextPath() + "/Admin/AddAdmin.jsp?error=exception");
        }
    }
}
