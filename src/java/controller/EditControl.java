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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import model.Category;
import model.Material;
import model.Product;
import model.Size;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "EditControl", urlPatterns = {"/edit-product"})
public class EditControl extends HttpServlet {

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

        String pId = request.getParameter("pId");

        DAOCategory daoC = new DAOCategory();
        List<Size> listS = daoC.getAllSize();
        List<Material> listM = daoC.getAllMaterial();
        List<Category> listC = daoC.getAllCategory();
        if (!pId.isEmpty()) {
            int id = Integer.parseInt(pId);
            DAOProduct daoP = new DAOProduct();
            Product p = daoP.getAProductById(id);
            request.setAttribute("p", p);
        }
        request.setAttribute("listC", listC);
        request.setAttribute("listS", listS);
        request.setAttribute("listM", listM);

        request.getRequestDispatcher("edit-product.jsp").forward(request, response);
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
        //processRequest(request, response);
        HttpSession session = request.getSession();
        DAOProduct dao = new DAOProduct();
        Account acc = (Account) session.getAttribute("acc");
        String pId_raw = request.getParameter("id");
        String name = request.getParameter("name");
        String price_raw = request.getParameter("price");
        String quantity_raw = request.getParameter("quantity");
        String description = request.getParameter("description");
        String image = "img-p/" + request.getParameter("image");
        String cateId_raw = request.getParameter("category");
        String sizeId_raw = request.getParameter("size");
        String matId_raw = request.getParameter("material");
        String oldSizeId_raw = request.getParameter("old_size");
        String oldMatId_raw = request.getParameter("old_material");
        try {
            double price = Double.parseDouble(price_raw);
            int quantity = Integer.parseInt(quantity_raw);
            int cateId = Integer.parseInt(cateId_raw);

            int sizeId = Integer.parseInt(sizeId_raw);

            int matId = Integer.parseInt(matId_raw);
            int oldSizeId = Integer.parseInt(oldSizeId_raw);
            int oldMatId = Integer.parseInt(oldMatId_raw);

            int pId = Integer.parseInt(pId_raw);
            System.out.println(description + "---------------------");
            System.out.println(sizeId + "---------------------");
            System.out.println(matId + "---------------------");
            System.out.println(oldSizeId + "---------------------");
            System.out.println(oldMatId + "---------------------");
            System.out.println(pId + "---------------------");
            dao.EditProduct(pId, name, description, image, cateId, sizeId, matId, price, quantity, oldSizeId, oldMatId);

            request.getRequestDispatcher("product-manage").forward(request, response);
        } catch (Exception e) {
        }
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
