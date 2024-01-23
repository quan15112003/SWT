/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Long
 */
public class HistoryPurchase {
    private double money;
    private String date;

    public HistoryPurchase() {
    }

    public HistoryPurchase(double money, String date) {
        this.money = money;
        this.date = date;
    }
    
    
    
    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
