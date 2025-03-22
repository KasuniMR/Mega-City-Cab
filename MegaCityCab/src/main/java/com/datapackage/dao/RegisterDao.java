package com.datapackage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.datapackage.model.Register;

public class RegisterDao {
    private static final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "Kasuni2003@#$";

    // Register a new user
    public boolean registerUser(Register user) {
        String query = "INSERT INTO login (FullName, Address, Contact, userName, Password) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getContact());
            ps.setString(4, user.getUname());
            ps.setString(5, user.getPassword());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Check if user exists
    public boolean userExists(String uname) {
        String query = "SELECT 1 FROM login WHERE userName = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Validate user login
    public boolean validateUser(String uname, String password) {
        String query = "SELECT 1 FROM login WHERE userName = ? AND Password = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, uname);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Fetch user details by username, including message and admin reply
    public Register getUserByUsername(String uname) {
        String query = "SELECT FullName, Address, Contact, UserName, Password, profile_pic FROM login WHERE UserName = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Register user = new Register(
                    rs.getString("FullName"),
                    rs.getString("Address"),
                    rs.getString("Contact"),
                    rs.getString("UserName"),
                    rs.getString("Password"),
                    rs.getString("profile_pic")
                );
                
                // Fetch user message and admin reply
                fetchMessageAndReply(user, conn);
                
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Fetch the latest user message and admin reply
    private void fetchMessageAndReply(Register user, Connection conn) {
        String query = "SELECT message, reply FROM contactus WHERE name = ? ORDER BY submitted_at DESC LIMIT 1";

        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getName());  // Use FullName to match the message in the contactus table
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                user.setMessage(rs.getString("message") != null ? rs.getString("message") : "No message submitted.");
                user.setAdminReply(rs.getString("reply") != null ? rs.getString("reply") : "No reply from admin yet.");
            } else {
                user.setMessage("No message submitted.");
                user.setAdminReply("No reply from admin yet.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update user details
    public boolean updateUser(Register user) {
        String query = "UPDATE login SET FullName=?, Address=?, Contact=?, Password=?, profile_pic=? WHERE UserName=?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getContact());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getProfileImage());
            ps.setString(6, user.getUname());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
