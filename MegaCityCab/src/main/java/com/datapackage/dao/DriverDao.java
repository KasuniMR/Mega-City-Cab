package com.datapackage.dao;

import com.datapackage.model.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDao {
    private final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private final String USER = "root";
    private final String PASSWORD = "Kasuni2003@#$";

    // Load JDBC Driver
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }

    // Fetch all drivers
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM drivers";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                drivers.add(new Driver(
                    rs.getInt("id"),
                    rs.getString("driver_name"),
                    rs.getString("phone"),
                    rs.getString("license_number"),
                    rs.getString("image")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Error fetching drivers: " + e.getMessage());
            e.printStackTrace();
        }
        return drivers;
    }

    // Fetch a single driver by ID
    public Driver getDriverById(int driverId) {
        String sql = "SELECT * FROM drivers WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, driverId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Driver(
                    rs.getInt("id"),
                    rs.getString("driver_name"),
                    rs.getString("phone"),
                    rs.getString("license_number"),
                    rs.getString("image")
                );
            }
        } catch (SQLException e) {
            System.err.println("Error fetching driver by ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    // Add a new driver
    public boolean addDriver(Driver driver) {
        String sql = "INSERT INTO drivers (driver_name, phone, license_number, image) VALUES (?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driver.getDriverName());
            stmt.setString(2, driver.getPhone());
            stmt.setString(3, driver.getLicenseNumber());
            stmt.setString(4, driver.getImage());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.err.println("Error adding driver: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Update driver details
    public boolean updateDriver(Driver driver) {
        String sql = "UPDATE drivers SET driver_name = ?, phone = ?, license_number = ?, image = ? WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, driver.getDriverName());
            stmt.setString(2, driver.getPhone());
            stmt.setString(3, driver.getLicenseNumber());
            stmt.setString(4, driver.getImage());
            stmt.setInt(5, driver.getId());

            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.err.println("Error updating driver: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    // Delete a driver
    public boolean deleteDriver(int driverId) {
        String sql = "DELETE FROM drivers WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, driverId);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.err.println("Error deleting driver: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
