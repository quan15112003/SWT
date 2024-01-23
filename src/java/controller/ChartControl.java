/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAOChart;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.Account;
import model.Chart;
import model.Order;
import model.Product;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name="ChartControl", urlPatterns={"/chart-product"})
public class ChartControl extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAOChart dao = new DAOChart();
        HttpSession session = request.getSession();
        Account acc = (Account)session.getAttribute("acc");
        int sellId = acc.getId();
        int numberOfProductUpload = dao.getNumberProductSell(sellId);
        List<Product> listPQ = dao.getProductByQuantitySold(sellId);
        double totalProfit = dao.getTotalProfit(sellId);
        request.setAttribute("numProUp", numberOfProductUpload);
        Date date = new Date();
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        int year_int = localDate.getYear();
        String year = ""+year_int;
        List<Chart> listC = dao.getNumProductSoldByDate(year,sellId);
        int totalSold = dao.getNumProductSoldToday(sellId);
        List<Chart> listCus = dao.getVIPCustomer(sellId);
        int totalCustomer = dao.getTotalCustomer(sellId);
        request.setAttribute("listVIP", listCus);
        
        List<Chart> listCat = dao.getQuantitySoldByCategory(sellId);
        request.setAttribute("listCat", listCat);
        
        List<Order> listOrder = dao.getAllOrderBySeller(sellId);
        request.setAttribute("listOrder", listOrder);
        
        request.setAttribute("year", year);
        request.setAttribute("totalSold", totalSold);
        request.setAttribute("totalProfit", totalProfit);
        request.setAttribute("totalCustomer", totalCustomer);
        request.setAttribute("listPQ", listPQ);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("chart-product.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        //processRequest(request, response);
        DAOChart dao = new DAOChart();
        HttpSession session = request.getSession();
        Account acc = (Account)session.getAttribute("acc");
        int sellId = acc.getId();
        int numberOfProductUpload = dao.getNumberProductSell(sellId);
        List<Product> listPQ = dao.getProductByQuantitySold(sellId);
        double totalProfit = dao.getTotalProfit(sellId);
        request.setAttribute("numProUp", numberOfProductUpload);
        String year = request.getParameter("year");
        List<Chart> listC = dao.getNumProductSoldByDate(year,sellId);
        int totalSold = dao.getNumProductSoldToday(sellId);
        int totalCustomer = dao.getTotalCustomer(sellId);
        List<Chart> listCus = dao.getVIPCustomer(sellId);
        
        List<Chart> listCat = dao.getQuantitySoldByCategory(sellId);
        request.setAttribute("listCat", listCat);
        
        request.setAttribute("listVIP", listCus);
        request.setAttribute("year", year);
        request.setAttribute("totalCustomer", totalCustomer);
        request.setAttribute("totalSold", totalSold);
        request.setAttribute("totalProfit", totalProfit);
        request.setAttribute("listPQ", listPQ);
        request.setAttribute("listC", listC);
        request.getRequestDispatcher("chart-product.jsp").forward(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
