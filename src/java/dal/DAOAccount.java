/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author Hoang Long
 */
public class DAOAccount extends DBContext {

    public void setSeller(int id, int choice) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET [isSeller] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, choice);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public void setAccountStatus(int id, int status) {
        String query = "UPDATE [dbo].[Account]\n"
                + "   SET [isAdmin] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public List<Account> getCustomerAccount() {

        List<Account> list = new ArrayList<>();

        String query = "select a.id, a.account,a.isAdmin, a.isSeller\n"
                + "from Account a\n"
                + "where a.isAdmin != 1";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                list.add(new Account(
                        rs.getInt("id"),
                        rs.getString("account"),
                        "",
                        rs.getInt("isSeller"),
                        rs.getInt("isAdmin")));
            }

        } catch (SQLException e) {

        }

        return list;
    }
}
