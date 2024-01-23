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
import java.util.List;
import model.Order;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name="SearchOrderCustomer", urlPatterns={"/search-order-customer"})
public class SearchOrderCustomer extends HttpServlet {
   
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
        PrintWriter out = response.getWriter();
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String cusId_raw = request.getParameter("cusId");
        if(year.isEmpty()){
            year = null;
        }
        if(month.isEmpty()){
            month = null;
        }
        if(day.isEmpty()){
            day = null;
        }
        try {
            int cusId = Integer.parseInt(cusId_raw);
            DAOChart dao = new DAOChart();
            List<Order> list = dao.getAllOrderByCustomerByDate(cusId, year, month, day);
            for (Order o : list) {
                out.print("<tr class=\"item\">\n"
                        + "                                        <td>"+o.getoId()+"</td>\n"
                        + "                                        <td>"+ o.getCustomer().getInfo().getFullName()+"</td>\n"
                        + "                                        <td>"+ o.getTotalMoney()+"</td>\n"
                        + "                                        <td>"+o.getDate()+"</td>\n"
                        + "                                        <td>"+o.getCustomer().getInfo().getRegionCountry()+"</td>\n"
                        + "                                        <td>\n"
                        + "                                            <button class=\"btn btn-sm btn-primary\" onclick=\"viewDetail("+o.getoId()+","+o.getsId()+")\">\n"
                        + "                                                View Detail\n"
                        + "                                            </button>\n"
                        + "                                        </td>\n"
                        + "                                    </tr>");
            }
            
        } catch (Exception e) {
        }
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
        processRequest(request, response);
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
