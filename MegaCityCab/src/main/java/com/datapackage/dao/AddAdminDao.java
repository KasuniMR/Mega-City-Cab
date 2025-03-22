package com.datapackage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.datapackage.model.AddAdmin;

public class AddAdminDao {
    private static final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "Kasuni2003@#$";

    // Add Admin
    public boolean AddAdmin(String username, String email, String password) {
        boolean success = false;
        String sql = "INSERT INTO admin (username, email, password) VALUES (?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password); // Consider hashing passwords before storing

            success = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Error adding admin: " + e.getMessage());
        }
        return success;
    }

    // Validate Admin Login with detailed responses
    public int validateAdminWithDetails(String username, String password) {
        String sql = "SELECT username, password FROM admin WHERE username = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    if (storedPassword.equals(password)) {
                        return 1; // Correct username and password
                    } else {
                        return 2; // Correct username, wrong password
                    }
                } else {
                    return 3; // Wrong username
                }
            }
        } catch (SQLException e) {
            System.err.println("Error validating admin: " + e.getMessage());
        }
        return 4; // Both incorrect
    }

    // Fetch All Admins
    public List<AddAdmin> getAllAdmins() {
        List<AddAdmin> adminList = new ArrayList<>();
        String sql = "SELECT * FROM admin";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                adminList.add(new AddAdmin(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("email"),
                    rs.getString("password")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return adminList;
    }

    public boolean deleteAdmin(int adminId) {
        boolean deleted = false;
        String sql = "DELETE FROM admin WHERE id = ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, adminId);
            deleted = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return deleted;
    }

    public AddAdmin getAdminById(int adminId) {
        AddAdmin admin = null;
        String sql = "SELECT * FROM admin WHERE id = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, adminId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    admin = new AddAdmin(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("password") // Ensure proper handling
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return admin;
    }
    
    public boolean updateAdmin(AddAdmin admin) {
        boolean rowUpdated = false;
        
        String sql;
        boolean updatePassword = (admin.getPassword() != null && !admin.getPassword().isEmpty());

        if (updatePassword) {
            sql = "UPDATE admin SET username = ?, email = ?, password = ? WHERE id = ?";
        } else {
            sql = "UPDATE admin SET username = ?, email = ? WHERE id = ?";
        }

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, admin.getUsername());
            stmt.setString(2, admin.getEmail());

            if (updatePassword) {
                stmt.setString(3, admin.getPassword());
                stmt.setInt(4, admin.getId());
            } else {
                stmt.setInt(3, admin.getId());
            }

            rowUpdated = stmt.executeUpdate() > 0;
            
        } catch (SQLException e) {
            System.err.println("Error updating admin: " + e.getMessage());
        }
        
        return rowUpdated;
    }
}