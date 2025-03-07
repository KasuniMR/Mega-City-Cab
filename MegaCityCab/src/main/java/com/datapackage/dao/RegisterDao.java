package com.datapackage.dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.*;

import com.datapackage.model.Register;

public class RegisterDao {
	private static final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "Kasuni2003@#$";

    public boolean registerUser(Register user) {
        String query = "INSERT INTO login(FullName, Address, Contact, userName, Password) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getContact());
            ps.setString(4, user.getUname());
            ps.setString(5, user.getPassword());
            
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean userExists(String uname) {
        String query = "SELECT * FROM login WHERE userName = ?";
        
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
    
  //login
    public boolean validateUser(String uname, String password) {
        String query = "SELECT * FROM login WHERE userName = ? AND Password = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, uname);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();  // If a row exists, user is valid
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public Register getUserByUsername(String uname) {
        String query = "SELECT * FROM login WHERE UserName = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Register(rs.getString("FullName"), rs.getString("Address"),
                                    rs.getString("Contact"), rs.getString("UserName"),
                                    rs.getString("Password"), rs.getString("profile_pic"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

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