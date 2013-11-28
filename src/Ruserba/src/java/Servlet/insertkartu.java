/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.GetConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Asus
 */
public class insertkartu extends HttpServlet {

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
            String nomor = "", nama = "", bulan = "", tahun = "";
            System.out.println("x");
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> fields = upload.parseRequest(request);
            Iterator<FileItem> it = fields.iterator();
            if (!it.hasNext()) {
                return;
            }
            System.out.println("x0");
            while (it.hasNext()) {
                FileItem fileItem = it.next();
                boolean isFormField = fileItem.isFormField();
                if (isFormField) {
                    if (fileItem.getFieldName().toString().equals("textnomor")) {
                        nomor = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textnamalengkap")) {
                        nama = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textexpbulan")) {
                        bulan = fileItem.getString();
                    } else if (fileItem.getFieldName().toString().equals("textexptahun")) {
                        tahun = fileItem.getString();
                    }
                }
            }
            String query = "INSERT INTO kartukredit VALUES ('" + request.getSession().getAttribute("userlistapp") + "', '" + nomor + "', '" + nama + "', '" + bulan + "', '" + tahun + "')";
            System.out.println("x1");
            GetConnection getCon = new GetConnection();
            Connection conn = getCon.getConnection();
            Statement stt = conn.createStatement();
            stt.execute(query);
            response.sendRedirect("profile.jsp");
        } catch (FileUploadException ex) {
            Logger.getLogger(insertkartu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(insertkartu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(insertkartu.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
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
