/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Hoang Long
 */
public class Product {
    private int id;
    private String name,description,image;
    private int quantity;
    private double price;
    private Account seller;
    private Category cate;
    private Size size;
    private Material mat;
    private int purchases;
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
    }
    
    public int getPurchases() {
        return purchases;
    }
    public int getTotalComment(){
        return comments.size();
    }
    public void setPurchases(int purchases) {
        this.purchases = purchases;
    }
    
    public Product() {
    }

    public Product(int id, String name, String description, String image, int quantity, double price, Account seller, Category cate, Size size, Material mat) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.quantity = quantity;
        this.price = price;
        this.seller = seller;
        this.cate = cate;
        this.size = size;
        this.mat = mat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Account getSeller() {
        return seller;
    }

    public void setSeller(Account seller) {
        this.seller = seller;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public Material getMat() {
        return mat;
    }

    public void setMat(Material mat) {
        this.mat = mat;
    }
    
    
    

    

    

    

    
    
    
}
