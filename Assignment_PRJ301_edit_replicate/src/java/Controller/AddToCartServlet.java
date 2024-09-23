/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.CartDAO;
import DAO.ShoesDAO;
import DTO.Cart;
import DTO.Shoes;
import DTO.Account;
import Utils.utilities;
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
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

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
        String shoesId = request.getParameter("shoesId");
        String quantity = request.getParameter("quantity").isEmpty() ? "1" : request.getParameter("quantity");;

        HttpSession session = request.getSession();
        CartDAO cartDAO = new CartDAO();
        Account user = (Account) session.getAttribute("ACCOUNT");

        try {
            // check quantity is positve and > 0
            //check if quantity and yop is positive or not
            boolean isQuantityPositive = utilities.isPositive(quantity);
            //STAFF.JSP
            if (!isQuantityPositive) {
                request.setAttribute("POSITIVE_QUANTITY_ERROR", "quantity is negative digits, pls change to positive");
            //USER : HOME.JSP    
            } else {
                Cart existCart = cartDAO.getCart(user.getUserId(), shoesId);
                if (existCart == null) {

                    boolean isQuantityValid = checkQuantity(shoesId, Integer.parseInt(quantity));
                    if (isQuantityValid) {
                        Cart cart = new Cart(0, user.getUserId(), shoesId, Integer.parseInt(quantity));
                        // insert a new cart
                        boolean result = cartDAO.insertCart(cart);
                        if (result) {
                            List<Cart> list = cartDAO.getCarts(user.getUserId());
                            session.setAttribute("CARTS", list);
                        }
                    } else {
                        request.setAttribute("QUANTITY_ERROR", "the quantity of Mobile you can add is not enought to adding to cart");
                    }

                } else {//30 + 1
                    boolean isQuantityValid = checkQuantity(shoesId, Integer.parseInt(quantity));
                    if (isQuantityValid) {
                        existCart.setQuantity(existCart.getQuantity() + Integer.parseInt(quantity));
                        // quantity = 31
                        // set to db again
                        boolean result = cartDAO.setCartQuantity(existCart);
                        if (result) {
                            List<Cart> list = cartDAO.getCarts(user.getUserId());
                            session.setAttribute("CARTS", list);
                        }
                    } else {
                        request.setAttribute("QUANTITY_ERROR", "the quantity of Mobile you can add is not enough to adding or out of stock");
                    }
                }
            }

        } catch (SQLException ex) {
            Logger.getLogger(AddToCartServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    private boolean checkQuantity(String shoesId, int quantity) throws SQLException {
        ShoesDAO shoesDAO = new ShoesDAO();
        // check quantity của shoes có đủ để add vào cart không?
        // đủ -> trù quantity và update quantity của shoes trong db
        // không đủ -> return false 
        Shoes m = shoesDAO.getShoesById(shoesId);
        if (m != null) {
            if (m.getQuantity() >= quantity) {
                m.setQuantity(m.getQuantity() - quantity);
                boolean rs = shoesDAO.updateShoes(m);
                if (rs) {
                    return true;
                }
            } else {
                return false;
            }
        }
        return false;
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
