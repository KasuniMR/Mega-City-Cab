package com.datapackage.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.datapackage.model.Car;

public class CarDao {
    private static final String URL = "jdbc:mysql://localhost:3306/mega_city_cab";
    private static final String USER = "root";
    private static final String PASSWORD = "Kasuni2003@#$";

    // Get all cars
    public List<Car> getAllCars() {
        List<Car> carList = new ArrayList<>();
        String sql = "SELECT * FROM cars";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Car car = new Car();
                car.setId(rs.getInt("id"));
                car.setBrandName(rs.getString("brandName"));
                car.setCapacity(rs.getInt("capacity"));
                car.setPrice(rs.getDouble("price"));
                car.setLicensePlate(rs.getString("licensePlate"));
                car.setImage(rs.getString("image"));
                carList.add(car);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carList;
    }

    // Add a new car
    public boolean addCar(Car car) {
        String sql = "INSERT INTO cars (brandName, capacity, price, licensePlate, image) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, car.getBrandName());
            stmt.setInt(2, car.getCapacity());
            stmt.setDouble(3, car.getPrice());
            stmt.setString(4, car.getLicensePlate());
            stmt.setString(5, car.getImage());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateCar(Car car) {
        String sql = "UPDATE cars SET brandName=?, capacity=?, price=?, licensePlate=?, image=? WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, car.getBrandName());
            stmt.setInt(2, car.getCapacity());
            stmt.setDouble(3, car.getPrice());
            stmt.setString(4, car.getLicensePlate());
            stmt.setString(5, car.getImage()); // Updates image correctly
            stmt.setInt(6, car.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    // Delete car by ID
    public boolean deleteCar(int id) {
        String sql = "DELETE FROM cars WHERE id=?";
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}