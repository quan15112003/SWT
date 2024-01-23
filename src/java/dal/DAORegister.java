/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Account;

/**
 *
 * @author Hoang Long
 */
public class DAORegister extends DBContext {

    public Account isAccountExist(String account) {
        String query
                = "select * from [Account] a\n"
                + "where a.account = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, account);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
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

    public void registerAccount(String account, String pass) {
        String query
                = "insert into [Account] values\n"
                + "(?,?,0,0)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, account);
            ps.setString(2, pass);
            ps.executeUpdate();
            String query2 = "select top(1) * from Account\n"
                    + "order by id desc";
            PreparedStatement ps1 = connection.prepareCall(query2);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("id");
                String query3 = "INSERT INTO [dbo].[AccountDetail]\n"
                        + "           ([id]"
                        + "            ,[fullName]"
                        + "            ,[avatar])\n"
                        + "            VALUES\n"
                        + "           (?,?,"
                        + "'img-avatar/803337455293038673.png'\n"
                        + "            )";
                PreparedStatement ps2 = connection.prepareStatement(query3);
                ps2.setInt(1, id);
                ps2.setString(2, account);
                ps2.executeUpdate();
            }

        } catch (Exception e) {
        }
    }

}
