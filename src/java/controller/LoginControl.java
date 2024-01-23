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
@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {

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
        // get user, pass from cookie
        Cookie arr[] = request.getCookies();
        if (arr != null) {
            for (Cookie o : arr) {
                if (o.getName().equals("userC")) {
                    request.setAttribute("username", o.getValue());
                }
                if (o.getName().equals("passC")) {
                    request.setAttribute("password", o.getValue());
                }
            }
        }

        // set user, pass to login form
        request.getRequestDispatcher("login.jsp").forward(request, response);
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
        // get data form
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        String rem = request.getParameter("rem");
        // check account
        DAOLogin dao = new DAOLogin();
        Account a = dao.login(username, password);
        if (a == null) {
            String err = "Username or Password was wrong!!";
            request.setAttribute("wrong", err);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            if (a.getIsAdmin() == -1) {
                String err = "Your account is disabled by Admin!!!";
                request.setAttribute("wrong", err);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            // dat acc len session
            HttpSession session = request.getSession();
            Account acc = dao.getDetail(a.getId());
            session.setAttribute("acc", acc);

            // luu acc len cookie
            Cookie user = new Cookie("userC", username);
            Cookie pass = new Cookie("passC", password);
            Cookie remC = new Cookie("remC", rem);
            user.setMaxAge(60 * 30);

            response.addCookie(user);
            if (rem != null) {
                pass.setMaxAge(60 * 30);
                remC.setMaxAge(60 * 30);
            } else {
                pass.setMaxAge(0);
                remC.setMaxAge(0);
            }
            response.addCookie(remC);
            response.addCookie(pass);
            response.sendRedirect("home");
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
