/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Long
 */
public class OrderDetail {
    private int oId;
    private Product p;
    private int quantity;

    public OrderDetail() {
    }

    public OrderDetail(int oId, Product p, int quantity) {
        this.oId = oId;
        this.p = p;
        this.quantity = quantity;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    
    
    
    
    
    
    
}
