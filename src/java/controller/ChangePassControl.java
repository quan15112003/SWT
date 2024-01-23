/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAOLogin;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "ChangePassControl", urlPatterns = {"/change-pass"})
public class ChangePassControl extends HttpServlet {

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
        request.getRequestDispatcher("change-pass.jsp").forward(request, response);
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
        String oldPass = request.getParameter("oldPass");
        String newPass = request.getParameter("newPass");
        String reEnterPass = request.getParameter("reEnterPass");
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        if (oldPass.equals(acc.getPassword())) {
            if (newPass.equals(reEnterPass)) {
                DAOLogin dao = new DAOLogin();
                dao.changePassword(acc.getAccount(), newPass);
                String msg = "Change password successfully!!";
                request.setAttribute("msg", msg);
                request.getRequestDispatcher("change-pass.jsp").forward(request, response);
            } else {
                String err = "New password and re-enter password does not match!!!";
                request.setAttribute("err", err);
                request.getRequestDispatcher("change-pass.jsp").forward(request, response);
            }
        } else {
            String err = "Wrong password, please re-enter again!!!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("change-pass.jsp").forward(request, response);
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
