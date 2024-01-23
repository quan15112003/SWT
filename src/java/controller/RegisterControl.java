/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DAORegister;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "RegisterControl", urlPatterns = {"/register"})
public class RegisterControl extends HttpServlet {

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
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String re_password = request.getParameter("re-pass");
        if (!password.equals(re_password)) {
            // pass and re-pass do not match
            String err = "Password and Re-password do not match!!!";
            request.setAttribute("err", err);
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            // sign up
            DAORegister dao = new DAORegister();
            Account a = dao.isAccountExist(username);
            if (a == null) {
                // a doesn't exist in database, dua acc vao database
                dao.registerAccount(username, password);
                // dua acc vua tao len session
                HttpSession session = request.getSession();
                Account newAcc = dao.isAccountExist(username);
                session.setAttribute("acc", newAcc);
                // dua acc len cookie
                Cookie user = new Cookie("userC", newAcc.getAccount());
                Cookie pass = new Cookie("passC", newAcc.getPassword());
                user.setMaxAge(60 * 30);
                pass.setMaxAge(60 * 30);
                response.addCookie(user);
                response.addCookie(pass);
                response.sendRedirect("home");
            } else {
                String err = "Account already exist!! Please try another username";
                request.setAttribute("err", err);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                // a exist in database
            }
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
