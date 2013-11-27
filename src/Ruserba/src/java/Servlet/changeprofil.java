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
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Aldo2
 */
@WebServlet(name = "changeprofil", urlPatterns = {"/changeprofil"})
public class changeprofil extends HttpServlet {

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
            String profil_name="",profil_password="",profil_address="",profil_province="",profil_district="",profil_zipcode="",profil_mobile="";
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            Iterator<FileItem> it = fields.iterator();
            
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                if (isFormField) {
                    if (fileItem.getFieldName().toString().equals("textgantinama")) {
                        profil_name = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textgantipassword")) {
                        profil_password = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textalamat")) {
                        profil_address = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textprovinsi")) {
                        profil_province = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textkabupaten")) {
                        profil_district = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textpos")) {
                        profil_zipcode = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textHP")) {
                        profil_mobile = fileItem.getString();
                    }
                }
            }
            String query = "UPDATE userprofil SET profil_name = '"+profil_name+"',profil_password= '"+profil_password+"',profil_address	= '"+profil_address+"',profil_province	= '"+profil_province+"',profil_district= '"+profil_district+"',	profil_zipcode	= '"+profil_zipcode+"',profil_mobile	= '"+profil_mobile+"' WHERE profil_ID = '"+request.getSession().getAttribute("userlistapp")+"'";
            GetConnection getCon = new GetConnection();
            Connection conn = getCon.getConnection();
            Statement stt = conn.createStatement();
            stt.execute(query);
            response.sendRedirect("profile.jsp");
        }
        catch(Exception ex){
            
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
