/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.DAOProduct;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Hoang Long
 */
public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public List<Item> getItems() {
        return items;
    }

    private Item getItemById(int id,int sId, int mId ) {

        for (Item i : items) {
            if (i.getProduct().getId() == id && i.getProduct().getSize().getId() == sId && i.getProduct().getMat().getId() == mId) {
                return i;
            }
        }

        return null;
    }
    
    public int getQuantityById(int id,int sId, int mId ) {
        return getItemById(id,sId,mId).getQuantity();
    }

    public void addItem(Item i) {
        if (getItemById(i.getProduct().getId(),i.getProduct().getSize().getId(),i.getProduct().getMat().getId()) != null) {
            Item oldItem = getItemById(i.getProduct().getId(),i.getProduct().getSize().getId(),i.getProduct().getMat().getId());
            oldItem.setQuantity(oldItem.getQuantity() + i.getQuantity());
        } else {
            items.add(i);
        }
    }
    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        List<Product> list = dao.getAllProduct();
        Cart ca = new Cart("26:5:2:5/36:5:5:4/15:1:1:3/9:1:1:4/29:1:1:3/17:1:1:4/28:1:1:1/38:1:1:1/6:1:1:1/37:1:1:1", list);
        System.out.println(ca.getQuantityById(15, 1, 1));
        Product p = ca.getProductById(15, 1, 1, list);
        Item i = new Item(p, -1, p.getPrice());
        ca.addItem(i);
        System.out.println(ca.getQuantityById(15, 1, 1));
    }
    public void removeItem(int id,int sId, int mId) {
        if (getItemById(id,sId,mId) != null) {
            items.remove(getItemById(id,sId,mId));
        }
    }

    public double getTotalMoney() {
        double total = 0;

        for (Item i : items) {
            total += i.getQuantity() * i.getPrice();
        }

        return total;
    }

    private  Product getProductById(int pId,int sId, int mId, List<Product> list) {
        for (Product x : list) {
            if (x.getId() == pId && x.getSize().getId() == sId && x.getMat().getId() == mId) {
                return x;
            }
        }
        return null;
    }
    
    public Cart(String txt, List<Product> list) {
        items = new ArrayList<>();
        try {
            if (txt != null && txt.length() != 0) {
                String[] listP = txt.split("/");
                for (String p : listP) {
                    String[] info = p.split(":");
                    int pId = Integer.parseInt(info[0]);
                    int sId = Integer.parseInt(info[1]);
                    int mId = Integer.parseInt(info[2]);
                    int quantity = Integer.parseInt(info[3]);
                    Product product = getProductById(pId, sId, mId, list);
                    Item i = new Item(product, quantity, product.getPrice());
                    addItem(i);
                }
            }
        } catch (NumberFormatException e){
            
        }

    }
}
