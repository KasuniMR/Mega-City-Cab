package com.datapackage.model;

public class Register {
    private String name;
    private String address;
    private String contact;
    private String uname;
    private String password;
    private String profileImage;
    private String adminReply;
    private String message;
    public Register() {}


    public Register(String name, String address, String contact, String uname, String password) {
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.uname = uname;
        this.password = password;
        this.profileImage = "images/default.png";
        this.adminReply = "";
        this.message = ""; 
    }


    public Register(String name, String address, String contact, String uname, String password, String profileImage) {
        this(name, address, contact, uname, password);
        this.profileImage = profileImage;
    }


    public Register(String name, String address, String contact, String uname, String password, String profileImage, String adminReply, String message) {
        this(name, address, contact, uname, password, profileImage);
        this.adminReply = adminReply;
        this.message = message;
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

    public String getAdminReply() {
        return adminReply;
    }

    public void setAdminReply(String adminReply) {
        this.adminReply = adminReply;
    }

    public String getMessage() { 
        return message;
    }

    public void setMessage(String message) { 
        this.message = message;
    }
}
