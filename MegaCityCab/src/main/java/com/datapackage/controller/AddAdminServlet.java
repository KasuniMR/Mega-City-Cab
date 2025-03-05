package com.datapackage.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.datapackage.dao.AddAdminDao;
import com.datapackage.model.AddAdmin;

@WebServlet("/AddAdminServlet")
public class AddAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AddAdminDao addAdminDao = new AddAdminDao();
        boolean added = addAdminDao.AddAdmin(username, email, password);

        if (added) {
            // Fetch updated list from the database after successful addition
            List<AddAdmin> updatedAdminList = addAdminDao.getAllAdmins();
            HttpSession session = request.getSession();
            session.setAttribute("adminList", updatedAdminList);

            response.sendRedirect("Admin/AddAdmin.jsp?success=Admin added!");
        } else {
            response.sendRedirect("Admin/AddAdmin.jsp?error=Failed to add admin!");
        }
    }
}
