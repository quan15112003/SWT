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
import model.Product;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "SortControl", urlPatterns = {"/sort"})
public class SortControl extends HttpServlet {

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
        String op = request.getParameter("op");
        DAOProduct daoP = new DAOProduct();
        DAOCategory daoC = new DAOCategory();
        List<Category> listC = daoC.getAllCategory();
        List<Product> listP = daoP.getSortedProduct(op, null, null, null, null);
        String min = request.getParameter("minPrice");
        String max = request.getParameter("maxPrice");
        String search = request.getParameter("search");
        String cId = request.getParameter("cid");

        if (!min.isEmpty()) {
            listP = daoP.getSortedProduct(op, min, max, null, null);
            if (!search.isEmpty()) {
                listP = daoP.getSortedProduct(op, min, max, search, null);
            }
            if (!cId.isEmpty()) {
                listP = daoP.getSortedProduct(op, min, max, null, cId);
            }
        } else {
            if (!search.isEmpty()) {
                listP = daoP.getSortedProduct(op, null, null, search, null);
            }
            if (!cId.isEmpty()) {
                listP = daoP.getSortedProduct(op, null, null, null, cId);
            }
        }
        // set cookie cart
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
        // set data
        request.setAttribute("cId", cId);
        request.setAttribute("search", search);
        request.setAttribute("minPrice", min);
        request.setAttribute("maxPrice", max);
        request.setAttribute("listP", listP);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("product.jsp").forward(request, response);
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
