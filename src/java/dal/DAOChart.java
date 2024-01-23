/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Chart;
import model.HistoryPurchase;
import model.Order;
import model.OrderDetail;
import model.Product;

/**
 *
 * @author Hoang Long
 */
public class DAOChart extends DBContext {

    public List<Order> getAllOrderByCustomer(int cusId) {
        String query = "select o.id,o.cid,o.date,o.totalmoney as [totalMoney]\n"
                + "from [Order] as o\n"
                + "where o.cid = ?";

        List<Order> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cusId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DAOLogin daoL = new DAOLogin();
                Account customer = daoL.getDetail(rs.getInt("cid"));
                Order o = new Order(rs.getInt("id"),
                        customer,
                        rs.getString("date"),
                        rs.getDouble("totalMoney"),
                        0);
                list.add(o);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public List<Order> getAllOrderByCustomerByDate(int cusId, String year, String month, String day) {
        String query = "select o.id,o.cid,o.date,o.totalmoney as [totalMoney]\n"
                + "from [Order] as o\n"
                + "where o.cid = ?";
        if (year != null) {
            query += "\n and year(o.date) = " + year;
        }
        if (month != null) {
            query += "\n and month(o.date) = " + month;
        }
        if (day != null) {
            query += "\n and day(o.date) = " + day;
        }

        List<Order> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cusId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DAOLogin daoL = new DAOLogin();
                Account customer = daoL.getDetail(rs.getInt("cid"));
                Order o = new Order(rs.getInt("id"),
                        customer,
                        rs.getString("date"),
                        rs.getDouble("totalMoney"),
                        0);
                list.add(o);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public List<Order> getAllOrderBySellerByDate(int sellId, String year, String month, String day) {
        String query = "select o.id,o.cid,o.date,sell.sid,sum(sell.quantity*sell.price) as [totalMoney] from [Order] as o,\n"
                + "(select * from OrderLine as ol, Product as p\n"
                + "where ol.pId = p.id\n"
                + "and p.sid = ?) as sell\n"
                + "where o.id = sell.oId";
        if (year != null) {
            query += "\n and year(o.date) = " + year;
        }
        if (month != null) {
            query += "\n and month(o.date) = " + month;
        }
        if (day != null) {
            query += "\n and day(o.date) = " + day;
        }
        query += "\n group by o.id,o.cid,o.date,sell.sid";

        List<Order> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DAOLogin daoL = new DAOLogin();
                Account customer = daoL.getDetail(rs.getInt("cid"));
                Order o = new Order(rs.getInt("id"),
                        customer,
                        rs.getString("date"),
                        rs.getDouble("totalMoney"),
                        sellId);
                list.add(o);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public List<OrderDetail> getDetailOrderByCustomer(int oId, int cusId) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select ol.oId,ol.pId,ol.matId,ol.sizeId,ol.quantity,ol.price\n"
                + "from OrderLine as ol, [Order] as o\n"
                + "where ol.oId = o.id\n"
                + "and o.cid = ?\n"
                + "and ol.oId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cusId);
            ps.setInt(2, oId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DAOProduct daoP = new DAOProduct();
                Product p = daoP.getAProductById(rs.getInt("pId"), rs.getInt("sizeId"), rs.getInt("matId"));
                OrderDetail od = new OrderDetail(oId, p, rs.getInt("quantity"));
                list.add(od);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<OrderDetail> getDetailOrder(int oId, int sId) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select ol.oId,ol.pId,ol.matId,ol.sizeId,ol.quantity,ol.price\n"
                + "from OrderLine as ol, Product as p\n"
                + "where ol.pId = p.id\n"
                + "and p.sid = ?\n"
                + "and ol.oId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sId);
            ps.setInt(2, oId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DAOProduct daoP = new DAOProduct();
                Product p = daoP.getAProductById(rs.getInt("pId"), rs.getInt("sizeId"), rs.getInt("matId"));
                OrderDetail od = new OrderDetail(oId, p, rs.getInt("quantity"));
                list.add(od);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public List<Order> getAllOrderBySeller(int sellId) {
        String query = "select o.id,o.cid,o.date,sell.sid,sum(sell.quantity*sell.price) as [totalMoney] from [Order] as o,\n"
                + "(select * from OrderLine as ol, Product as p\n"
                + "where ol.pId = p.id\n"
                + "and p.sid = ?) as sell\n"
                + "where o.id = sell.oId\n"
                + "group by o.id,o.cid,o.date,sell.sid";

        List<Order> list = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                DAOLogin daoL = new DAOLogin();
                Account customer = daoL.getDetail(rs.getInt("cid"));
                Order o = new Order(rs.getInt("id"),
                        customer,
                        rs.getString("date"),
                        rs.getDouble("totalMoney"),
                        sellId);
                list.add(o);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public List<Product> getTopProductByMonth() {
        List<Product> list = new ArrayList<>();

        String query = "select top(8) pid,p.name,p.image,sum(quantity) as [NumberSold]\n"
                + "from OrderLine o, Product as p,[Order] as ord\n"
                + "where p.id = o.pId\n"
                + "and ord.id = o.oId\n"
                + "and month(ord.date) = month(getdate())\n"
                + "and year(ord.date) = year(getdate())\n"
                + "group by pId,p.name,p.image\n"
                + "order by [NumberSold] desc";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPurchases(rs.getInt("NumberSold"));
                list.add(p);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public List<Product> getTopProductByYear() {
        List<Product> list = new ArrayList<>();

        String query = "select top(8) pid,p.name,p.image,sum(quantity) as [NumberSold]\n"
                + "from OrderLine o, Product as p,[Order] as ord\n"
                + "where p.id = o.pId\n"
                + "and ord.id = o.oId\n"
                + "and year(ord.date) = year(getdate())\n"
                + "group by pId,p.name,p.image\n"
                + "order by [NumberSold] desc";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPurchases(rs.getInt("NumberSold"));
                list.add(p);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public List<Chart> getQuantitySoldByCategory(int sellId) {
        List<Chart> list = new ArrayList<>();
        String query = "select c.name,kq.quantity from Category c left join\n"
                + "(select p.cid,Sum(ol.quantity) as [quantity] from OrderLine ol, Product p\n"
                + "where ol.pId = p.id\n"
                + "and p.sid = ?\n"
                + "group by p.cid) as kq\n"
                + "on kq.cid = c.id";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chart c = new Chart(rs.getString(1),
                        (rs.getString(2) == null) ? "0" : rs.getString(2));
                list.add(c);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public int getTotalCustomer(int sellId) {
        int num = 0;
        String query = "select count(a.account) as [NumberCustomers] from Account as a,\n"
                + "(select cid,SUM(SpendMoney) as [SpendMoney] from [Order] o,\n"
                + "(select ol.oId,SUM(ol.quantity*ol.price) as [SpendMoney] from OrderLine ol\n"
                + "where ol.pId in (select p.id from Product p\n"
                + "where p.sid = ?)\n"
                + "group by ol.oId) as kq\n"
                + "where o.id = kq.oId\n"
                + "group by cid) as kq\n"
                + "where a.id = kq.cid";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt(1);
            }

        } catch (SQLException e) {

        }
        return num;
    }

    public List<Chart> getVIPCustomer(int sellId) {
        String query = "select a.account,kq.SpendMoney from Account as a,\n"
                + "(select top(5) cid,SUM(SpendMoney) as [SpendMoney] from [Order] o,\n"
                + "(select ol.oId,SUM(ol.quantity*ol.price) as [SpendMoney] from OrderLine ol\n"
                + "where ol.pId in (select p.id from Product p\n"
                + "where p.sid = ?)\n"
                + "group by ol.oId) as kq\n"
                + "where o.id = kq.oId\n"
                + "group by cid) as kq\n"
                + "where a.id = kq.cid\n"
                + "order by kq.SpendMoney desc";
        List<Chart> list = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chart c = new Chart(rs.getString(1),
                        rs.getString(2));
                list.add(c);
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public int getNumProductSoldToday(int sellId) {
        int num = 0;
        String query = "select o.date,SUM(ol.quantity) as [Quantity] from OrderLine ol, [Order] as o\n"
                + "where ol.oId = o.id\n"
                + "and ol.pId in (select p.id from Product p\n"
                + "where p.sid = ?)\n"
                + "and (day(o.date) = day(GETDATE())\n"
                + "and month(o.date) = month(GETDATE())\n"
                + "and year(o.date) = year(GETDATE()))\n"
                + "group by o.date";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt(2);
            }

        } catch (SQLException e) {

        }
        return num;
    }

    public static void main(String[] args) {
        DAOChart dao = new DAOChart();
        List<Order> list = dao.getAllOrderByCustomer(1);
        for (Order order : list) {
            System.out.println(list);
        }
//        List<Order> listO = dao.getAllOrderBySellerByDate(1,null,"12",null);
//        for (Order o : listO) {
//            System.out.println(o.getCustomer() +"xxxx" + o.getDate());
//        }
//        for (Chart c : dao.getNumProductSoldByDate("2023", 1)) {
//            System.out.println(c.getLabel() + "==" + c.getData());
//        }
////        for(HistoryPurchase h : dao.getTradingHistoryByMonth(7)){
////            System.out.println(h.getDate() + "--" + h.getMoney());
////        }
//
//        System.out.println(dao.getTotalProfit(1));
//        int list = dao.getNumberProductSell(1);
//        System.out.println(list);
////        for (HistoryPurchase p : list) {
////            System.out.println(p.getMoney() + "|||" + p.getDate());
////        }
//
//        List<Chart> listC = dao.getNumProductSoldByDate("2023", 1);
////        List<Chart> listC = dao.getVIPCustomer(1);
//        for (Chart c : listC) {
//            System.out.println(c.getLabel() + "==" + c.getData());
//        }
    }

    public List<Chart> getNumProductSoldByDate(String year, int sellId) {
        List<Chart> list = new ArrayList<>();
        String query = "select month(o.date),SUM(ol.quantity) as [Quantity] from OrderLine ol, [Order] as o\n"
                + "where ol.oId = o.id\n"
                + "and ol.pId in (select p.id from Product p\n"
                + "where p.sid = ?)\n"
                + "and year(o.date) = ?\n"
                + "group by month(o.date)";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ps.setString(2, year);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chart c = new Chart(rs.getString(1),
                        rs.getString(2));
                list.add(c);
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getProductByQuantitySold(int sellId) {
        List<Product> list = new ArrayList<>();
        String query = "select top(8) pid,p.name,sum(quantity) as [So luong da ban] from OrderLine o, Product as p\n"
                + "where p.id = o.pId\n"
                + "and p.sid = ?\n"
                + "group by pId,p.name\n"
                + "order by [So luong da ban] desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPurchases(rs.getInt(3));
                list.add(p);
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public List<Product> getProductByPurchased(int sellId) {
        List<Product> list = new ArrayList<>();
        String query = "select top(8) pid,p.name,count(pId) as [So luot mua] from OrderLine o, Product as p\n"
                + "where p.id = o.pId\n"
                + "and p.sid = ?\n"
                + "group by pId,p.name";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setPurchases(rs.getInt(3));
                list.add(p);
            }

        } catch (SQLException e) {

        }
        return list;
    }

    public double getTotalProfit(int sellId) {
        double total = 0;
        String query = "select sum(quantity*price) as [totalProfit] from OrderLine o\n"
                + "where o.pId in (select p.id from Product p \n"
                + "where p.sid = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble(1);
            }

        } catch (SQLException e) {

        }
        return total;
    }

    public int getNumberProductSell(int sellId) {
        int num = 0;
        String query = "select p.sid,count(p.id) as [NumberOfProduct] from product as p\n"
                + "where p.sid = ?\n"
                + "group by p.sid";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                num = rs.getInt(2);
            }

        } catch (SQLException e) {

        }
        return num;
    }

    public List<HistoryPurchase> getTradingHistoryByMonth(int customerId) {
        List<HistoryPurchase> list = new ArrayList<>();
        String query = "select o.cid,month(o.date) as [month],SUM(o.totalmoney) as [totalMoney] from [Order] as o\n"
                + "where o.cid = ?\n"
                + "group by o.cid,month(o.date)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                HistoryPurchase hP = new HistoryPurchase();
                hP.setMoney(rs.getDouble("totalMoney"));
                hP.setDate(rs.getString("month"));
                list.add(hP);
            }
        } catch (SQLException e) {

        }
        return list;
    }


}
