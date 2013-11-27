/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.GetConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
public class confirmcart extends HttpServlet {

    

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
        PrintWriter out = response.getWriter();
        try {
            String profile_ID = "" + request.getSession().getAttribute("userlistapp");
            String query = "SELECT * FROM cart WHERE profil_ID = '" + profile_ID + "'";
            GetConnection getCon = new GetConnection();
            Connection conn = getCon.getConnection();
            Statement stt = conn.createStatement();
            ResultSet rs = stt.executeQuery(query);

            while (rs.next()) {
                System.out.println("x");
                String namabarang = rs.getString("cart_goods");
                //buyGood(stt, profile_ID, namabarang);
                
                Statement stt2 = conn.createStatement();
                String query2="";
                query2 = "SELECT * FROM cart WHERE profil_ID = '" + profile_ID + "' AND cart_goods = '" + namabarang + "'";
                ResultSet rs1 = stt2.executeQuery(query);
                rs1.next();
                int cart_count = rs1.getInt("cart_count");

                query2 = "SELECT * FROM goods WHERE goods_name = '" + namabarang + "'";
                rs1 = stt.executeQuery(query2);
                rs1.next();
                int goods_sold = rs1.getInt("goods_sold");

                int goods_total = goods_sold + cart_count;

                query2 = "UPDATE goods SET goods_sold = " + goods_total + " WHERE goods_name = '" + namabarang + "'";
                stt.execute(query2);
                query2 = "SELECT * FROM userprofil WHERE profil_ID = '" + profile_ID + "'";
                rs1 = stt.executeQuery(query2);
                rs1.next();
                query2 = "UPDATE userprofil SET profil_transaction = " + (rs1.getInt("profil_transaction") + 1) + " WHERE profil_ID = '" + profile_ID + "'";
                stt.execute(query2);
                query2 = "DELETE FROM cart WHERE profil_ID = '" + profile_ID + "' AND cart_goods = '" + namabarang + "'";
                stt.execute(query2);
            }
            response.sendRedirect("cart.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(confirmcart.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    private void buyGood(Statement stt, String profile_ID, String cart_goods) throws SQLException {
        /*
        String query = "SELECT * FROM cart WHERE profil_ID = '" + profile_ID + "' AND cart_goods = '" + cart_goods + "'";
        rs1 = stt.executeQuery(query);
        rs1.next();
        int cart_count = rs1.getInt("cart_count");

        query = "SELECT * FROM goods WHERE goods_name = '" + cart_goods + "'";
        rs1 = stt.executeQuery(query);
        rs1.next();
        int goods_sold = rs1.getInt("goods_sold");

        int goods_total = goods_sold + cart_count;

        query = "UPDATE goods SET goods_sold = " + goods_total + " WHERE goods_name = '" + cart_goods + "'";
        stt.execute(query);
        query = "SELECT * FROM userprofil WHERE profil_ID = '" + profile_ID + "'";
        rs1 = stt.executeQuery(query);
        rs1.next();
        query = "UPDATE userprofil SET profil_transaction = " + (rs1.getInt("profil_transaction") + 1) + " WHERE profil_ID = '" + profile_ID + "'";
        stt.execute(query);
        query = "DELETE FROM cart WHERE profil_ID = '" + profile_ID + "' AND cart_goods = '" + cart_goods + "'";
        stt.execute(query);
        */
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
