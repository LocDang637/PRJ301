/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
public class MainController extends HttpServlet {

    public final String LOGINSERVLET = "LoginServlet";
    public final String SEARCHSERVLET = "SearchServlet";
    public final String ADD_SHOES_SERVLET = "AddShoesServlet";
    public final String DELETE_SHOES_SERVLET = "DeleteShoesServlet";
    public final String UPDATE_SHOES_SERVLET = "UpdateShoesServlet";
    public final String LOGOUT_SERVLET = "LogoutServlet";
    public final String LOOKUP_SERVLET = "LookupServlet";
    public final String ADD_TO_CART_SERVLET = "AddToCartServlet";
    public final String REMOVE_TO_CART_SERVLET = "RemoveToCartServlet";
    public final String VIEWSERVLET = "ViewServlet";
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
        String action = request.getParameter("action");
        String url = "login.jsp";

        try {
            if ("Login".equals(action)) {
                url = LOGINSERVLET;
            } else if ("Logout".equals(action)) {
                url = LOGOUT_SERVLET;
            } else if ("Lookup".equals(action)) {
                url = LOOKUP_SERVLET;
            } else if ("Add To Cart".equals(action)) {
                url = ADD_TO_CART_SERVLET;
            } else if ("Search".equals(action)) {
                url = SEARCHSERVLET;
            } else if ("AddShoes".equals(action)) {
                url = ADD_SHOES_SERVLET;
            } else if("Remove To Cart".equals(action)) {
                url = REMOVE_TO_CART_SERVLET;
            } else if("DeleteShoes".equals(action)) {
                url = DELETE_SHOES_SERVLET;
            } else if("UpdateShoes".equals(action)) {
                url = UPDATE_SHOES_SERVLET;
            } else if(action == null) {
                url = VIEWSERVLET;
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
