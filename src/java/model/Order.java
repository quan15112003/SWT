/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Long
 */
public class Order {
    private int oId;
    private Account customer;
    private String date;
    private double totalMoney;
    private int sId;

    public Order() {
    }

    public Order(int oId, Account customer, String date, double totalMoney, int sId) {
        this.oId = oId;
        this.customer = customer;
        this.date = date;
        this.totalMoney = totalMoney;
        this.sId = sId;
    }
    
    
    
    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public Account getCustomer() {
        return customer;
    }

    public void setCustomer(Account customer) {
        this.customer = customer;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }
    
    
    
}
