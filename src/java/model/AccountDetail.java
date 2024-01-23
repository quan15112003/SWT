/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Long
 */
public class AccountDetail {
    private int id;
    private String fullName,avatar;
    private double amount;
    private String gender,phoneNumber,emailAddress,regionCountry;

    public AccountDetail() {
    }

    public AccountDetail(int id, String fullName, String avatar, double amount, String gender, String phoneNumber, String emailAddress, String regionCountry) {
        this.id = id;
        this.fullName = fullName;
        this.avatar = avatar;
        this.amount = amount;
        this.gender = gender;
        this.phoneNumber = phoneNumber;
        this.emailAddress = emailAddress;
        this.regionCountry = regionCountry;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getRegionCountry() {
        return regionCountry;
    }

    public void setRegionCountry(String regionCountry) {
        this.regionCountry = regionCountry;
    }
    
}
