/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Category;
import model.Comment;
import model.Material;
import model.Product;
import model.Size;

/**
 *
 * @author Hoang Long
 */
public class DAOProduct extends DBContext {

    public List<Product> getHintSearch(String search) {
        List<Product> list = new ArrayList<>();
        String query = "select top(4) * from Product p\n"
                + "where p.name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, '%' + search + '%');
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                list.add(p);
            }

        } catch (SQLException e) {

        }

        return list;
    }

    public boolean isProductIdExist(Product p, List<Product> list) {
        for (Product x : list) {
            if (x.getId() == p.getId()) {
                return true;
            }
        }
        return false;
    }

    public void DeleteAllProduct(int sellerId) {
        String query1 = "DELETE FROM [dbo].[ProductDetail]\n"
                + "where pId in\n"
                + "(select id from Product\n"
                + "where sid = ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query1);
            ps.setInt(1, sellerId);
            ps.executeUpdate();

            String query2 = "DELETE FROM [dbo].[Product]\n"
                    + "      WHERE sid = ?";
            PreparedStatement ps1 = connection.prepareStatement(query2);
            ps1.setInt(1, sellerId);
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public void DeleteProduct(int pId, int sizeId, int matId) {
        String query1 = "DELETE FROM [dbo].[ProductDetail]\n"
                + "      WHERE pId = ? and sId = ? and mId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query1);
            ps.setInt(1, pId);
            ps.setInt(2, sizeId);
            ps.setInt(3, matId);
            ps.executeUpdate();
            DAOProduct dao = new DAOProduct();
            String query3 = "select count(pId) as [count] from ProductDetail\n"
                    + "where pId = ?";
            PreparedStatement ps3 = connection.prepareStatement(query3);
            ps3.setInt(1, pId);
            ResultSet checkP = ps3.executeQuery();
            if (checkP.next()) {
                if (checkP.getInt("count") == 0) {
                    String query2 = "DELETE FROM [dbo].[Product]\n"
                            + "      WHERE id = ?";
                    PreparedStatement ps1 = connection.prepareStatement(query2);
                    ps1.setInt(1, pId);
                    ps1.executeUpdate();
                }
            }
        } catch (Exception e) {
        }
    }

    public void EditProduct(int pId, String name, String description, String image, int cateId, int sizeId, int matId, double price, int quantity, int oldSizeId, int oldMatId) {
        String query1 = "UPDATE [dbo].[Product]\n"
                + "   SET [name] = ?\n"
                + "      ,[description] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[cid] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query1);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setString(3, image);
            ps.setInt(4, cateId);
            ps.setInt(5, pId);
            ps.executeUpdate();
            String query2 = "UPDATE [dbo].[ProductDetail]\n"
                    + "   SET [price] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + "      ,[sId] = ?\n"
                    + "      ,[mId] = ?"
                    + " WHERE pId = ? and sId = ? and mId = ?";
            PreparedStatement ps1 = connection.prepareStatement(query2);
            ps1.setDouble(1, price);
            ps1.setInt(2, quantity);
            ps1.setInt(3, sizeId);
            ps1.setInt(4, matId);
            ps1.setInt(5, pId);
            ps1.setInt(6, oldSizeId);
            ps1.setInt(7, oldMatId);
            ps1.executeUpdate();
            System.out.println("UPDATE SUCCESS!!!");
        } catch (SQLException e) {

        }
    }

    public void AddingProduct(String name, String description, String image, int cid, int sid, int sizeId, int matId, double price, int quantity) {
        String query1 = "INSERT INTO [dbo].[Product]\n"
                + "           ([name]\n"
                + "           ,[description]\n"
                + "           ,[image]\n"
                + "           ,[cid]\n"
                + "           ,[sid])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps1 = connection.prepareStatement(query1);
            ps1.setString(1, name);
            ps1.setString(2, description);
            ps1.setString(3, image);
            ps1.setInt(4, cid);
            ps1.setInt(5, sid);
            ps1.executeUpdate();
            String query2 = "select top 1 id from Product\n"
                    + "order by id desc";
            PreparedStatement ps2 = connection.prepareStatement(query2);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                int pid = rs.getInt("id");
                String query3 = "INSERT INTO [dbo].[ProductDetail]\n"
                        + "           ([pId]\n"
                        + "           ,[sId]\n"
                        + "           ,[mId]\n"
                        + "           ,[price]\n"
                        + "           ,[quantity])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement ps3 = connection.prepareStatement(query3);
                ps3.setInt(1, pid);
                ps3.setInt(2, sizeId);
                ps3.setInt(3, matId);
                ps3.setDouble(4, price);
                ps3.setInt(5, quantity);
                ps3.executeUpdate();
            }

        } catch (SQLException e) {

        }

    }

    public void addTypeProduct(int id, int sizeId, int matId, double price, int quantity) {
        String query = "INSERT INTO [dbo].[ProductDetail]\n"
                + "           ([pId]\n"
                + "           ,[sId]\n"
                + "           ,[mId]\n"
                + "           ,[price]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.setInt(2, sizeId);
            ps.setInt(3, matId);
            ps.setDouble(4, price);
            ps.setInt(5, quantity);
            ps.executeUpdate();
        } catch (SQLException e) {

        }
    }

    public List<Product> getProductBySellerId(int sellId) {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id as[ProductId],p.name as[ProductName],p.description as [Description],c.name as[Category],p.image as [Image],\n"
                + "pd.price as [Price],pd.quantity as [Quantity], m.name as[Material],s.name as[Size],\n"
                + "s.id as [sizeId],m.id as [materialID], c.id as [categoryId]\n"
                + "from Product p, ProductDetail pd, Size s, Material m, Category c\n"
                + "where p.id = pd.pId\n"
                + "and p.cid = c.id\n"
                + "and pd.mId = m.id\n"
                + "and pd.sId = s.id\n"
                + "and p.sid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, sellId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("ProductId"));
                p.setName(rs.getString("ProductName"));
                p.setDescription(rs.getString("Description"));
                p.setImage(rs.getString("Image"));
                p.setPrice(rs.getDouble("Price"));
                p.setQuantity(rs.getInt("Quantity"));
                p.setCate(new Category(rs.getInt("categoryId"), rs.getString("Category"), ""));
                p.setSeller(new Account(sellId, "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), rs.getString("Size")));
                p.setMat(new Material(rs.getInt("materialID"), rs.getString("Material")));
                list.add(p);
            }
        } catch (SQLException e) {

        }

        return list;
    }

    public List<Product> getTrendyProduct() {
        List<Product> list = new ArrayList<>();
        String query
                = "select top(8) p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as[matId]\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId\n"
                + "and p.id in (select top (8) pid from OrderLine\n"
                + "group by pId\n"
                + "order by sum(quantity) desc)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as[matId] from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getSortedProduct(String op, String min, String max, String search, String id) {
        List<Product> list = new ArrayList<>();
        String query = "";
        if (min == null && search == null && id == null) {
            query
                    = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                    + "from Product as p, ProductDetail as pd\n"
                    + "where p.id = pd.pId\n"
                    + "order by " + op;
        }
        if (min == null && search != null && id == null) {
            query
                    = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                    + "from Product as p, ProductDetail as pd\n"
                    + "where p.id = pd.pId\n"
                    + "and p.name like '%" + search + "%'\n"
                    + "order by " + op;
        }
        if (min == null && search == null && id != null) {
            query
                    = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                    + "from Product as p, ProductDetail as pd\n"
                    + "where p.id = pd.pId\n"
                    + "and p.cid = " + id + "\n"
                    + "order by " + op;
        }
        if (min != null && search == null && id == null) {
            query
                    = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                    + "from Product as p, ProductDetail as pd\n"
                    + "where p.id = pd.pId\n"
                    + "and pd.price between " + min + " and " + max + "\n"
                    + "order by " + op;
        }
        if (min != null && search != null && id == null) {
            query
                    = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                    + "from Product as p, ProductDetail as pd\n"
                    + "where p.id = pd.pId\n"
                    + "and p.name like '%" + search + "%' and pd.price between " + min + " and " + max + "\n"
                    + "order by " + op;
        }
        if (min != null && search == null && id != null) {
            query
                    = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                    + "from Product as p, ProductDetail as pd\n"
                    + "where p.id = pd.pId\n"
                    + "and p.cid = " + id + " and pd.price between " + min + " and " + max + "\n"
                    + "order by " + op;
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> searchByName(String name) {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId\n"
                + "and p.name like ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + name + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getAllProductByCid(int cid) {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId \n"
                + "and p.cid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getProductByPriceByCategory(double min, double max, int cId) {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId\n"
                + "and p.cid = ?\n"
                + "and pd.price between ? and ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setDouble(2, min);
            ps.setDouble(3, max);
            ps.setDouble(1, cId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getProductByPrice(double min, double max) {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId \n"
                + "and pd.price between ? and ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setDouble(1, min);
            ps.setDouble(2, max);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getProductByPriceBySearch(double min, double max, String search) {
        List<Product> list = new ArrayList<>();
        String query
                = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId]\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId \n"
                + "and p.name like ?\n"
                + "and pd.price between ? and ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, "%" + search + "%");
            ps.setDouble(2, min);
            ps.setDouble(3, max);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));

                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Product> getAllProductByCidExceptId(int cid, int id) {
        List<Product> list = new ArrayList<>();
        String query = "select p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sid as sizeId,pd.mid\n"
                + "from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId and p.cid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) == id) {
                    continue;
                }
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));
                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("mid"), ""));
                if (isProductIdExist(p, list)) {
                    continue;
                }
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

    public List<Material> getMaterialProductById(int id) {
        List<Material> list = new ArrayList<>();
        String query = "select distinct pd.mId,m.name from ProductDetail as pd, Material as m \n"
                + "where pd.mId = m.id\n"
                + "and pd.pId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Material(rs.getInt("mId"), rs.getString("name")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Size> getSizeProductById(int id) {
        List<Size> list = new ArrayList<>();
        String query = "select distinct pd.sId,s.name from ProductDetail as pd, Size as s\n"
                + "where pd.sId = s.id\n"
                + "and pd.pId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Size(rs.getInt("sId"), rs.getString("name")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        DAOProduct dao = new DAOProduct();
        for (Product p : dao.getTrendyProduct()) {
            System.out.println(p.getName());
        }

//        List<Product> listP = dao.getProductById(33);
//        Product p = listP.get(0);
//        for (Comment c : p.getComments()) {
//            System.out.println(c.getContent() + "===" + c.getUser().getInfo().getFullName());
//        }
//        System.out.println(p.getName());
    }

    public Product getAProductById(int pId, int sizeId, int matId) {
        String query
                = "select p.*,pd.sId as [sizeId],s.name as [Size],pd.mId as [matId],m.name as [Material],pd.price,pd.quantity\n"
                + "from Product as p, Size as s, Material as m, ProductDetail as pd\n"
                + "where pd.pId = p.id and pd.sId = s.id and pd.mId = m.id and p.id = ? and pd.sId = ? and pd.mId = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pId);
            ps.setInt(2, sizeId);
            ps.setInt(3, matId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));

                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), rs.getString("Size")));
                p.setMat(new Material(rs.getInt("matId"), rs.getString("Material")));
                return p;
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return null;
    }

    public Product getAProductById(int id) {
        String query = "select p.*,pd.sId as [sizeId],s.name as [Size],pd.mId as [matId],m.name as [Material],pd.price,pd.quantity from Product as p, Size as s, Material as m, ProductDetail as pd\n"
                + "where pd.pId = p.id and pd.sId = s.id and pd.mId = m.id and p.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));

                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), rs.getString("Size")));
                p.setMat(new Material(rs.getInt("matId"), rs.getString("Material")));

                String query2 = "select * from Comment c\n"
                        + "where c.productId = ?\n"
                        + "order by c.id desc ";
                PreparedStatement ps2 = connection.prepareStatement(query2);
                ps2.setInt(1, p.getId());
                ResultSet rs2 = ps2.executeQuery();
                List<Comment> listCom = new ArrayList<>();
                while (rs2.next()) {
                    Comment c = new Comment();
                    DAOLogin daoL = new DAOLogin();
                    Account acc = daoL.getDetail(rs2.getInt("userId"));
                    c.setId(rs2.getInt("id"));
                    c.setContent(rs2.getString("content"));
                    c.setDate(rs2.getString("date"));
                    c.setUser(acc);
                    listCom.add(c);
                }
                p.setComments(listCom);
                return p;
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return null;
    }

    public List<Product> getProductById(int id) {
        List<Product> list = new ArrayList<>();
        String query = "select p.*,pd.sId as [sizeId],s.name as [Size],pd.mId as [matId],m.name as [Material],pd.price,pd.quantity from Product as p, Size as s, Material as m, ProductDetail as pd\n"
                + "where pd.pId = p.id and pd.sId = s.id and pd.mId = m.id and p.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setQuantity(rs.getInt("quantity"));
                p.setPrice(rs.getDouble("price"));

                p.setCate(new Category(rs.getInt("cid"), "", ""));
                p.setSeller(new Account(rs.getInt("sid"), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), rs.getString("Size")));
                p.setMat(new Material(rs.getInt("matId"), rs.getString("Material")));

                String query2 = "select * from Comment c\n"
                        + "where c.productId = ?\n"
                        + "order by c.id desc ";
                PreparedStatement ps2 = connection.prepareStatement(query2);
                ps2.setInt(1, p.getId());
                ResultSet rs2 = ps2.executeQuery();
                List<Comment> listCom = new ArrayList<>();
                while (rs2.next()) {
                    Comment c = new Comment();
                    DAOLogin daoL = new DAOLogin();
                    Account acc = daoL.getDetail(rs2.getInt("userId"));
                    c.setId(rs2.getInt("id"));
                    c.setContent(rs2.getString("content"));
                    c.setDate(rs2.getString("date"));
                    c.setUser(acc);
                    listCom.add(c);
                }
                p.setComments(listCom);
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }
        return list;
    }

    public List<Comment> loadMore4Comment(int start, int pId) {
        List<Comment> list = new ArrayList<>();
        String query = "select * from Comment c\n"
                + "where c.productId = ?\n"
                + "order by c.id desc\n"
                + "offset ? rows\n"
                + "fetch next 4 rows only";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, pId);
            ps.setInt(2, start);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment c = new Comment();
                DAOLogin daoL = new DAOLogin();
                Account acc = daoL.getDetail(rs.getInt("userId"));
                c.setId(rs.getInt("id"));
                c.setContent(rs.getString("content"));
                c.setDate(rs.getString("date"));
                c.setUser(acc);
                list.add(c);
            }
        } catch (SQLException e) {

        }
        return list;
    }

    public void newComment(int pId, int uId, String content) {
        String query = "INSERT INTO [dbo].[Comment]\n"
                + "           ([content]\n"
                + "           ,[date]\n"
                + "           ,[userId]\n"
                + "           ,[productId])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        Date getDate = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        format.setLenient(false);
        String date = format.format(getDate);
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, content);
            ps.setString(2, date);
            ps.setInt(3, uId);
            ps.setInt(4, pId);
            ps.execute();
        } catch (SQLException e) {

        }
    }

    public List<Product> getNewProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select top(8) p.id,p.name,p.description,p.image,pd.quantity,pd.price,p.cid,p.sid,pd.sId as [sizeId],pd.mId as [matId] from Product as p, ProductDetail as pd\n"
                + "where p.id = pd.pId\n"
                + "order by p.id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt(1));
                p.setName(rs.getString(2));
                p.setDescription(rs.getString(3));
                p.setImage(rs.getString(4));
                p.setQuantity(rs.getInt(5));
                p.setPrice(rs.getDouble(6));
                p.setCate(new Category(rs.getInt(7), "", ""));
                p.setSeller(new Account(rs.getInt(8), "", "", 0, 0));
                p.setSize(new Size(rs.getInt("sizeId"), ""));
                p.setMat(new Material(rs.getInt("matId"), ""));
                list.add(p);
            }
        } catch (SQLException e) {
            System.err.println(e);
        }

        return list;
    }

}
