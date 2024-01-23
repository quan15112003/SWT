/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Long
 */
public class Account {

    private int id;
    private String account, password;
    private int isSell;
    private int isAdmin;
    private double amountSpent;
    private AccountDetail info;

    public double getAmountSpent() {
        return amountSpent;
    }

    public void setAmountSpent(double amountSpent) {
        this.amountSpent = amountSpent;
    }

    public AccountDetail getInfo() {
        return info;
    }

    public void setInfo(AccountDetail info) {
        this.info = info;
    }

    public Account() {
    }

    public Account(int id, String account, String password, int isSell, int isAdmin) {
        this.id = id;
        this.account = account;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", account=" + account + ", password=" + password + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }

}
