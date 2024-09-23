/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CartDAO;
import DAO.ShoesDAO;
import DTO.Cart;
import DTO.Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ptd
 */
@WebServlet(name = "RemoveToCartServlet", urlPatterns = {"/RemoveToCartServlet"})
public class RemoveToCartServlet extends HttpServlet {

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
        String url = "home.jsp";
        String cartId = request.getParameter("cartId");

        HttpSession session = request.getSession();
        CartDAO cartDAO = new CartDAO();
        Account user = (Account) session.getAttribute("ACCOUNT");
       

        try {
            Cart existCart = cartDAO.getCartById(Integer.parseInt(cartId));
            int inputQuantity = Integer.parseInt(request.getParameter("quantity"));

            if (inputQuantity < 0) {
                // The input quantity is negative
                request.setAttribute("QUANTITY_ERROR", "Please input a non-negative quantity.");
            } else if (inputQuantity > existCart.getQuantity()) {
                // The input quantity is larger than the existing quantity
                request.setAttribute("QUANTITY_ERROR", "Please input a quantity less than or equal to the existing quantity (" + existCart.getQuantity() + ").");
            } else if (inputQuantity == existCart.getQuantity()) {
                // Remove the item from the cart
                boolean removeResult = cartDAO.removeItemToCart(Integer.parseInt(cartId));

                if (removeResult) {
                    // Get the updated cart list after removal
                    List<Cart> list = cartDAO.getCarts(user.getUserId());
                    session.setAttribute("CARTS", list);
                }
            } else {
                // Update the quantity in the cart
                existCart.setQuantity(existCart.getQuantity() - inputQuantity);
                boolean updateResult = cartDAO.setCartQuantity(existCart);

                if (updateResult) {
                    // Get the updated cart list after quantity update
                    List<Cart> list = cartDAO.getCarts(user.getUserId());
                    session.setAttribute("CARTS", list);
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
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
