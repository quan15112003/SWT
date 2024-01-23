/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import model.Account;
import model.AccountDetail;
import model.Cart;
import model.Item;

/**
 *
 * @author Hoang Long
 */
public class DAOLogin extends DBContext {

    public Account login(String account, String pass) {
        String query
                = "select * from Account as a\n"
                + "where a.account = ?\n"
                + "and a.password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, account);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void changePassword(String account, String newPass) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET \n"
                + "      [password] = ?\n"
                + "      \n"
                + " WHERE [account] = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, newPass);
            ps.setString(2, account);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateAvatar(int id, String avatar) {
        String query = "UPDATE [dbo].[AccountDetail]\n"
                + "   SET [avatar] = ?\n"
                + "      \n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "img-avatar/" + avatar);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void updateAccountInfo(int id, String fullName, String gender, String phoneNumber, String emailAddress, String regionCountry) {
        String query = "UPDATE [dbo].[AccountDetail]\n"
                + "   SET [fullName] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[phoneNumber] = ?\n"
                + "      ,[emailAddress] = ?\n"
                + "      ,[Region/Country] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, gender);
            ps.setString(3, phoneNumber);
            ps.setString(4, emailAddress);
            ps.setString(5, regionCountry);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void addOrder(Account customer, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            // add order
            String query1 = "INSERT INTO [dbo].[Order]\n"
                    + "           (\n"
                    + "           [cid]\n"
                    + "           ,[date]\n"
                    + "           ,[totalmoney])\n"
                    + "     VALUES\n"
                    + "           (\n"
                    + "           ?,\n"
                    + "           ?,\n"
                    + "           ?)";
            PreparedStatement ps1 = connection.prepareStatement(query1);
            ps1.setInt(1, customer.getId());
            ps1.setString(2, date);
            ps1.setDouble(3, cart.getTotalMoney());

            ps1.executeUpdate();

            // get OrderId 
            String query2 = "select top(1) o.id from [Order] as o\n"
                    + "order by o.id desc";
            PreparedStatement ps2 = connection.prepareStatement(query2);
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                int oid = rs2.getInt("id");
                for (Item i : cart.getItems()) {
                    String query3 = "INSERT INTO [dbo].[OrderLine]\n"
                            + "           ([oId]\n"
                            + "           ,[pId]\n"
                            + "           ,[sizeId]\n"
                            + "           ,[matId]\n"
                            + "           ,[quantity]\n"
                            + "           ,[price])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement ps3 = connection.prepareStatement(query3);
                    ps3.setInt(1, oid);
                    ps3.setInt(2, i.getProduct().getId());
                    ps3.setInt(3, i.getProduct().getSize().getId());
                    ps3.setInt(4, i.getProduct().getMat().getId());
                    ps3.setInt(5, i.getQuantity());
                    ps3.setDouble(6, i.getPrice());
                    ps3.executeUpdate();
                }
            }
            // cap nhat lai so luong san pham
            String query4 = "UPDATE [dbo].[ProductDetail]\n"
                    + "   SET [quantity] = quantity-?\n"
                    + " WHERE [pId] = ?\n"
                    + " and     [sId] = ?\n"
                    + " and     [mId] = ?";
            PreparedStatement ps4 = connection.prepareStatement(query4);
            for (Item i : cart.getItems()) {
                ps4.setInt(1, i.getQuantity());
                ps4.setInt(2, i.getProduct().getId());
                ps4.setInt(3, i.getProduct().getSize().getId());
                ps4.setInt(4, i.getProduct().getMat().getId());
                ps4.executeUpdate();
            }
        } catch (Exception e) {
        }
    }

    public Account getDetail(int id) {
        String query = "	select * from Account acc, AccountDetail ad\n"
                + "	where acc.id = ad.id\n"
                + "	and acc.id = ?";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Account acc = new Account();
                acc.setId(rs.getInt(1));
                acc.setAccount(rs.getString("account"));
                acc.setPassword(rs.getString("password"));
                acc.setIsSell(rs.getInt("isSeller"));
                acc.setIsAdmin(rs.getInt("isAdmin"));
                acc.setInfo(new AccountDetail(rs.getInt(1),
                        rs.getString("fullName"),
                        rs.getString("avatar"),
                        rs.getDouble("amount"),
                        rs.getString("gender"),
                        rs.getString("phoneNumber"),
                        rs.getString("emailAddress"),
                        rs.getString("Region/Country")));
                return acc;
            }
        } catch (SQLException e) {

        }

        return null;
    }
    public static void main(String[] args) {
        DAOLogin db= new DAOLogin();
        System.out.println(db.getDetail(1));
    }
}
