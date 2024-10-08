/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import DAO.ShoesDAO;
import DTO.Shoes;
import Utils.utilities;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
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
@WebServlet(name = "LookupServlet", urlPatterns = {"/LookupServlet"})
public class LookupServlet extends HttpServlet {

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
        String minPrice = request.getParameter("minPrice").isEmpty() ? "1" : request.getParameter("minPrice");
        String maxPrice = request.getParameter("maxPrice").isEmpty() ? "1000000" : request.getParameter("maxPrice");;

        ShoesDAO dao = new ShoesDAO();
        HttpSession session = request.getSession();

        try {
            //check if quantity and yop is positive or not
            boolean isMinPricePositive = utilities.isPositive(minPrice);
            boolean isMaxPricePositive = utilities.isPositive(maxPrice);
            

            if (!isMinPricePositive || !isMaxPricePositive) {
                request.setAttribute("POSITIVE_NUMBER_ERROR", "minPrice or maxPrice are negative digits, pls change to positive");
            } else {
                float min = Float.parseFloat(minPrice);
                float max = Float.parseFloat(maxPrice);

                if (max < min) {
                    request.setAttribute("INVALID_RANGE", "maxPrice is less than minPrice");
                } else {
                    List<Shoes> list = dao.searchShoesByRange(min, max);
                    session.setAttribute("SHOES_DATA", list);                 
                }
            }

        } catch (SQLException ex) {
            log("LookupServlet + SQLException: " + ex.getMessage());
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
