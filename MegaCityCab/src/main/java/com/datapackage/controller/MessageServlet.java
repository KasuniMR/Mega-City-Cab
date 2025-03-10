package com.datapackage.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


// Model class for Contact messages
class Contact {
    private int id;
    private String name;
    private String email;
    private String message;
    private String submittedAt;

    public Contact(int id, String name, String email, String message, String submittedAt) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.message = message;
        this.submittedAt = submittedAt;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getMessage() { return message; }
    public String getSubmittedAt() { return submittedAt; }
}

@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<Contact> contactList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mega_city_cab", "root", "Kasuni2003@#$");
            pst = conn.prepareStatement("SELECT * FROM contactus");
            rs = pst.executeQuery();

            while (rs.next()) {
                contactList.add(new Contact(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("message"),
                        rs.getString("submitted_at")
                ));
            }

            request.setAttribute("contactList", contactList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Admin/message.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
