package com.datapackage.model;

public class Driver {
	private int id;
    private String driverName;
    private String phone;
    private String licenseNumber;
    private String image;
    
    public Driver(int id, String driverName, String phone, String licenseNumber, String image) {
        this.id = id;
        this.driverName = driverName;
        this.phone = phone;
        this.licenseNumber = licenseNumber;
        this.image = image;
    }
    
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getLicenseNumber() {
		return licenseNumber;
	}
	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

    

}
