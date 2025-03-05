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

@WebServlet("/DeleteAdminServlet")
public class DeleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");

        if (idStr != null) {
            try {
                int adminId = Integer.parseInt(idStr);
                AddAdminDao adminDao = new AddAdminDao();
                
                // Delete admin from database
                boolean deleted = adminDao.deleteAdmin(adminId);

                if (deleted) {
                    // Refresh admin list in session
                    List<AddAdmin> updatedAdminList = adminDao.getAllAdmins();
                    HttpSession session = request.getSession();
                    session.setAttribute("adminList", updatedAdminList);

                    response.sendRedirect("Admin/AddAdmin.jsp?delete=success");
                } else {
                    response.sendRedirect("Admin/AddAdmin.jsp?error=Delete failed");
                }
            } catch (NumberFormatException e) {
                response.sendRedirect("Admin/AddAdmin.jsp?error=Invalid ID");
            }
        } else {
            response.sendRedirect("Admin/AddAdmin.jsp?error=No ID provided");
        }
    }
}
