/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

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
import model.Comment;
import model.Product;

/**
 *
 * @author Hoang Long
 */
@WebServlet(name = "CommentControl", urlPatterns = {"/comment"})
public class CommentControl extends HttpServlet {

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
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("acc");
        String pId_raw = request.getParameter("pId");
        String content = request.getParameter("content");
        DAOProduct dao = new DAOProduct();
        try {
            int pId = Integer.parseInt(pId_raw);
            dao.newComment(pId, acc.getId(), content);
            List<Comment> list = dao.loadMore4Comment(0, pId);
            PrintWriter out = response.getWriter();

            for (Comment c : list) {
                out.print("<div class=\"media mb-4\">\n"
                        + "                        <img src=\"" + c.getUser().getInfo().getAvatar() + "\" alt=\"Image\" class=\"img-fluid mr-3 mt-1\" style=\"width: 45px;\">\n"
                        + "                        <div class=\"media-body\">\n"
                        + "                            <h6>" + c.getUser().getInfo().getFullName() + "<small> - <i>" + c.getDate() + "</i></small></h6>\n"
                        + "\n"
                        + "                            <p>" + c.getContent() + "</p>\n"
                        + "                        </div>\n"
                        + "                    </div>");
            }
        } catch (NumberFormatException e) {

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
        //processRequest(request, response);
        String start_raw = request.getParameter("start");
        System.out.println(start_raw + " ======================");
        String pId_raw = request.getParameter("pId");
        try {
            int start = Integer.parseInt(start_raw);
            int pId = Integer.parseInt(pId_raw);
            System.out.println("==="+start);
            
            DAOProduct dao = new DAOProduct();
            Product p = dao.getAProductById(pId);
            if (p.getComments().size() < start) {

            } else {
                List<Comment> list = dao.loadMore4Comment(start, pId);
                PrintWriter out = response.getWriter();
                for (Comment c : list) {
                    out.print("<div class=\"media mb-4\">\n"
                            + "                        <img src=\"" + c.getUser().getInfo().getAvatar() + "\" alt=\"Image\" class=\"img-fluid mr-3 mt-1\" style=\"width: 45px;\">\n"
                            + "                        <div class=\"media-body\">\n"
                            + "                            <h6>" + c.getUser().getInfo().getFullName() + "<small> - <i>" + c.getDate() + "</i></small></h6>\n"
                            + "\n"
                            + "                            <p>" + c.getContent() + "</p>\n"
                            + "                        </div>\n"
                            + "                    </div>");
                }
            }

        } catch (NumberFormatException e) {

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
