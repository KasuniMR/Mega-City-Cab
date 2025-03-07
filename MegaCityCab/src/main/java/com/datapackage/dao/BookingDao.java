package com.datapackage.dao;

import com.datapackage.model.Booking;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookingDao {
    private final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private final String USER = "root";
    private final String PASSWORD = "Kasuni2003@#$";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }

    public void updateBookingStatus(int bookingId, String status) {
        String sql = "UPDATE bookings SET status = ? WHERE id = ?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, status);
            pstmt.setInt(2, bookingId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            System.err.println("❌ Error updating booking status: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean saveBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_email, car_name, price_per_day, start_date, end_date, total_price, payment_method, from_location, to_location, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setString(1, booking.getUserEmail());
            stmt.setString(2, booking.getCarName());
            stmt.setDouble(3, booking.getPricePerDay());
            stmt.setDate(4, booking.getStartDate());
            stmt.setDate(5, booking.getEndDate());
            stmt.setDouble(6, booking.getTotalPrice());
            stmt.setString(7, booking.getPaymentMethod());
            stmt.setString(8, booking.getFromLocation());
            stmt.setString(9, booking.getToLocation());
            stmt.setString(10, "Pending");

            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        booking.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            System.err.println("❌ Error saving booking: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT * FROM bookings ORDER BY start_date DESC";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                bookings.add(new Booking(
                        rs.getInt("id"),
                        rs.getString("user_email"),
                        rs.getString("car_name"),
                        rs.getDouble("price_per_day"),
                        rs.getDate("start_date"),
                        rs.getDate("end_date"),
                        rs.getDouble("total_price"),
                        rs.getString("payment_method"),
                        rs.getString("from_location"),
                        rs.getString("to_location"),
                        rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            System.err.println("❌ Error fetching bookings: " + e.getMessage());
            e.printStackTrace();
        }
        return bookings;
    }
}