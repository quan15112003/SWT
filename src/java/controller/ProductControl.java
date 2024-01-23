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
import java.util.List;
import model.Cart;
import model.Category;
import model.Item;
import model.Material;
import model.Product;
import model.Size;
import model.TypeName;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "ProductControl", urlPatterns = {"/product"})
public class ProductControl extends HttpServlet {

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
        DAOCategory daoC = new DAOCategory();
        DAOProduct daoP = new DAOProduct();
        String id_raw = request.getParameter("id");
        try {
            int id = Integer.parseInt(id_raw);
            List<Product> pList = daoP.getProductById(id);
            System.out.println('1');
            for (Product p : pList) {
                System.out.println(p.getSize().getId() + " | " + p.getMat().getId());
            }
            Product p = pList.get(0);
            List<Material> listMat = daoP.getMaterialProductById(p.getId());
            List<Size> listSize = daoP.getSizeProductById(p.getId());
            List<Category> listC = daoC.getAllCategory();
            List<Product> listP = daoP.getAllProductByCidExceptId(p.getCate().getId(), p.getId());
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
            List<Product> listPAll = daoP.getAllProduct();
            Cart cart = new Cart(txtCart, listPAll);
            List<Item> listI = cart.getItems();
            int numberOfCart;
            if (!listI.isEmpty()) {
                numberOfCart = listI.size();
            } else {
                numberOfCart = 0;
            }
            request.setAttribute("numberOfCart", numberOfCart);
            // set data to jsp
            request.setAttribute("listMat", listMat);
            request.setAttribute("listSize", listSize);
            request.setAttribute("pList", pList);
            request.setAttribute("p", p);
            request.setAttribute("listP", listP);
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("productdetail.jsp").forward(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
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
