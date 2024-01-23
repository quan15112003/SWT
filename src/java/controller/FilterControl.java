/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOCategory;
import dal.DAOProduct;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Product;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "FilterControl", urlPatterns = {"/filter"})
public class FilterControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String minPrice = request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice");
        DAOProduct dao = new DAOProduct();
        DAOCategory daoC = new DAOCategory();
        List<Category> listC = daoC.getAllCategory();
        List<Product> listP = new ArrayList<>();
        try{
            if(minPrice != null && maxPrice != null){
                double min = Double.parseDouble(minPrice);
                double max = Double.parseDouble(maxPrice);
                List<Product> list = dao.getProductByPrice(min, max);
                for(Product p : list){
                    if(!isProductExist(p, listP)){
                        listP.add(p);
                    }
                }
            }
        }catch(NumberFormatException e){
            
        }
        if(request.getParameter("search") != null){
            String search = request.getParameter("search");
            try{
                double min = Double.parseDouble(minPrice);
                double max = Double.parseDouble(maxPrice);
                listP = dao.getProductByPriceBySearch(min, max, search);
                request.setAttribute("search", search);
            } catch(NumberFormatException e){
                
            }
        }
        if(request.getParameter("cid") != null){
            String cId_raw = request.getParameter("cid");
            try{
                int cId = Integer.parseInt(cId_raw);
                double min = Double.parseDouble(minPrice);
                double max = Double.parseDouble(maxPrice);
                listP = dao.getProductByPriceByCategory( min, max, cId);
                request.setAttribute("cId", cId);
            } catch(NumberFormatException e){
                
            }
        }
        // set cookie
        // set cookie cart
        Cookie[] arr = request.getCookies();
        String txtCart = "";
        if (arr != null) {
            for (Cookie c : arr) {
                if (c.getName().equals("cart")) {
                    txtCart += c.getValue();
                }
            }
        }
        List<Product> listPAll = dao.getAllProduct();
        Cart cart = new Cart(txtCart, listPAll);
        List<Item> listI = cart.getItems();
        int numberOfCart;
        if (!listI.isEmpty()) {
            numberOfCart = listI.size();
        } else {
            numberOfCart = 0;
        }
        request.setAttribute("numberOfCart", numberOfCart);
        // set data
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.setAttribute("minPrice", minPrice);
        request.setAttribute("maxPrice", maxPrice);
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }
    public boolean isProductExist(Product p, List<Product> list){
        for(Product o : list){
            if(o.getId() == p.getId()){
                return true;
            }
        }
        return false;
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
