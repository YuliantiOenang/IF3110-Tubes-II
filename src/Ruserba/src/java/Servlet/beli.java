/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.GetConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Aldo2
 */
@WebServlet(name = "beli", urlPatterns = {"/beli"})
public class beli extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String barang = "";
            int jumlahbeli = 0;
            String cart_note = "";

            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            out.println("Number of fields: " + fields.size());
            Iterator<FileItem> it = fields.iterator();
            if (!it.hasNext()) {
                out.println("No fields found");
                return;
            }
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                if (isFormField) {
                    out.print("<br />" + fileItem.getFieldName());
                    if (fileItem.getFieldName().toString().equals("textnama")) {
                        barang = fileItem.getString();
                        System.out.println("barang 2:"+barang);
                    } else if (fileItem.getFieldName().toString().equals("textjumlah")) {
                        jumlahbeli = Integer.parseInt(fileItem.getString());
                    } else if (fileItem.getFieldName().toString().equals("textnotes")) {
                        cart_note = fileItem.getString();
                    }
                }
            }
            
            System.out.println("bitch1");
            String query = "SELECT * FROM goods WHERE goods_name='"+barang+"'";
            GetConnection getCon = new GetConnection();
            Connection conn = getCon.getConnection();
            Statement stt = conn.createStatement();
            
            ResultSet rs = stt.executeQuery(query);
            rs.next();
            System.out.println(query);
            int sisa=0;
            if(jumlahbeli<= Integer.parseInt(rs.getString("goods_available"))){
                System.out.println("bitch3");
                sisa= Integer.parseInt(rs.getString("goods_available"))-jumlahbeli;
                System.out.println("bitch4");
                query = " UPDATE goods SET goods_available = "+sisa+", goods_sold = "+jumlahbeli+" WHERE goods_name='"+barang+"'";
                System.out.println(query);
                stt.execute(query);
                
                HttpSession session = request.getSession();
                query = " INSERT INTO cart (profil_ID, cart_goods, cart_count, cart_note) VALUES ('"+session.getAttribute("userlistapp")+"', '"+barang+"', "+jumlahbeli+", '"+cart_note+"')";
                stt.execute(query);
                
                response.sendRedirect("detailbarang.jsp?namabarang="+barang+"&hasil=berhasil ditambahkan dalam cart");
            }else{
                sisa=jumlahbeli-Integer.parseInt(rs.getString("goods_available"));
                response.sendRedirect("detailbarang.jsp?namabarang="+barang+"&hasil=barang kurang "+sisa+"");
            }
            
        } catch (Exception exc) {
        } finally {
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
