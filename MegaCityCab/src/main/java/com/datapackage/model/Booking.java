package com.datapackage.model;

import java.sql.Date;

public class Booking {
    private int id;
    private String userEmail;
    private String carName;
    private double pricePerDay;
    private Date startDate;
    private Date endDate;
    private double totalPrice;
    private String paymentMethod;
    private String fromLocation;
    private String toLocation;
    private String status;  // New Field ✅

    // Constructor with ID (For existing bookings)
    public Booking(int id, String userEmail, String carName, double pricePerDay, Date startDate, Date endDate, 
                   double totalPrice, String paymentMethod, String fromLocation, String toLocation, String status) {
        this.id = id;
        this.userEmail = userEmail;
        this.carName = carName;
        this.pricePerDay = pricePerDay;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.status = status;
    }

    // Constructor without ID (For new bookings)
    public Booking(String userEmail, String carName, double pricePerDay, Date startDate, Date endDate, 
                   double totalPrice, String paymentMethod, String fromLocation, String toLocation, String status) {
        this.userEmail = userEmail;
        this.carName = carName;
        this.pricePerDay = pricePerDay;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.fromLocation = fromLocation;
        this.toLocation = toLocation;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

    public String getCarName() { return carName; }
    public void setCarName(String carName) { this.carName = carName; }

    public double getPricePerDay() { return pricePerDay; }
    public void setPricePerDay(double pricePerDay) { this.pricePerDay = pricePerDay; }

    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }

    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getFromLocation() { return fromLocation; }
    public void setFromLocation(String fromLocation) { this.fromLocation = fromLocation; }

    public String getToLocation() { return toLocation; }
    public void setToLocation(String toLocation) { this.toLocation = toLocation; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
