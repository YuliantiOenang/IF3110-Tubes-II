/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author A46CB
 */
public class validateLogin extends HttpServlet {

    private String databaseURL, username, password;
 
    @Override
   public void init(ServletConfig config) throws ServletException {
      // Retrieve the database-URL, username, password from webapp init parameters
      super.init(config);
      ServletContext context = config.getServletContext();
      databaseURL = context.getInitParameter("databaseURL");
      username = context.getInitParameter("username");
      password = context.getInitParameter("password");
   }
    

    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set the MIME type for the response  message response.setContentType("text/html");
        // Get a output writer to write the response message into the network socket
        PrintWriter out = response.getWriter();

        Connection conn = null;
        Statement stmt = null;
        try {
             try {
	Class.forName("com.mysql.jdbc.Driver");
    }catch(Exception e) {
	out.println("Unable to load Driver");
    }
            // Step 1: Create a database "Connection" object
            conn = DriverManager.getConnection(databaseURL, username, password);
            
            // Step 2: Create a "Statement" object inside the "Connection"
            stmt = conn.createStatement();

            // Step 3: Execute a SQL SELECT query
            String sqlStr = "SELECT * FROM user WHERE username ="
                    + "'" + request.getParameter("username") + "'";

            ResultSet rset = stmt.executeQuery(sqlStr); // Send the query to the server

            // Step 4: Process the query result
            if(!rset.next()) {
                out.print("register");
            } else {
                String password = rset.getString("password");
                if (password.equals(request.getParameter("password"))) {
                    // Create a new HTTPSession and save the username and roles
                    // First, invalidate the session. if any
                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        session.invalidate();
                    }
                    session = request.getSession(true);
                    synchronized (session) {
                        session.setAttribute("username", request.getParameter("username"));
                    }
                    
                    out.print("success");
                } else {
                    out.print("password");
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            out.println("Unable to connect to database");
        } finally {
            out.close();
            try {
                // Step 5: Close the Statement and Connection
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
