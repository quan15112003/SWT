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
import model.Category;
import model.Material;
import model.Size;

/**
 *
 * @author Hoang Long
 */
public class DAOCategory extends DBContext {

    public void addCategory(String name, String image) {
        String query = "INSERT INTO [dbo].[Category]\n"
                + "           ([name]\n"
                + "           ,[image])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public void addMaterial(String name) {
        String query = "INSERT INTO [dbo].[Material]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public void addSize(String name) {
        String query = "INSERT INTO [dbo].[Size]\n"
                + "           ([name])\n"
                + "     VALUES\n"
                + "           (?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }
    public void deleteSize(int id) {
        String query = "DELETE FROM [dbo].[Size]\n"
                + "      WHERE id = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(SQLException e){
            
        }
    }
    public void deleteMaterial(int id) {
        String query = "DELETE FROM [dbo].[Material]\n"
                + "      WHERE id = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(SQLException e){
            
        }
    }
    public void deleteCategory(int id) {
        String query = "DELETE FROM [dbo].[Category]\n"
                + "      WHERE id = ?";
        try{
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch(SQLException e){
            
        }
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt(1));
                c.setName(rs.getString(2));
                c.setImage(rs.getString(3));
                list.add(c);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Size> getAllSize() {
        List<Size> list = new ArrayList<>();
        String query = "select * from size";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Size s = new Size();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                list.add(s);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Material> getAllMaterial() {
        List<Material> list = new ArrayList<>();
        String query = "select * from material";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Material m = new Material();
                m.setId(rs.getInt(1));
                m.setName(rs.getString(2));
                list.add(m);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

}
