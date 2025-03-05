package com.datapackage.model;

public class Register {
    private String name;
    private String address;
    private String contact;
    private String uname;
    private String password;
    private String profileImage;

    // Default Constructor
    public Register() {}

    // Constructor without profile image (for registration)
    public Register(String name, String address, String contact, String uname, String password) {
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.uname = uname;
        this.password = password;
        this.profileImage = "images/default.png"; // Default profile image
    }

    // Constructor with profile image (for profile updates)
    public Register(String name, String address, String contact, String uname, String password, String profileImage) {
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.uname = uname;
        this.password = password;
        this.profileImage = profileImage;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	
	
	

}
