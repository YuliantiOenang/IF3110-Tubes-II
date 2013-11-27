package tubes.wbd;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// JDBC driver name and database URL
    static final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
    static final String DB_URL="jdbc:mysql://localhost/ruserba";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();
		
		List<FileItem> items = null;
        
        String name = "";
        int price = 0;
        String description = "";
        String picture = "";
        String category = "";
        
        try {
            items = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
        } catch (FileUploadException e) {
            throw new ServletException("Cannot parse multipart request.", e);
        }
        for (FileItem item : items) {
            if (item.isFormField()) {
                // Process regular form fields here the same way as request.getParameter().
                // You can get parameter name by item.getFieldName();
                // You can get parameter value by item.getString();
            	
            	String fieldname = item.getFieldName();
            	if (fieldname.equals("nama"))
            	{
            		name = item.getString();
            	}
            	else
            	if (fieldname.equals("harga"))
            	{
            		price = Integer.parseInt(item.getString());
            	}
            	else
            	if (fieldname.equals("deskripsi"))
            	{
            		description = item.getString();
            	}
            	else
            	if (fieldname.equals("kategori"))
            	{
            		category = item.getString();
            	}
            	
            } else {
                // Process uploaded fields here.
                String filename = FilenameUtils.getName(item.getName()); // Get filename.
                
                picture = filename;
                String root = getServletContext().getRealPath("/"); 
                File file = new File(root+"/img/" + filename); // Define destination file.
                try {
					item.write(file);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} // Write to destination file.
            }
        }
        
        // online
        Connection conn = null;
	      Statement stmt = null;
	      
	    int n_barang = 0;
	    try{
	       // Register JDBC driver
	       Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	       conn = DriverManager.getConnection(DB_URL,USER,PASS);

	       // Execute SQL query
	       stmt = conn.createStatement();
	       String sql;
	       sql = "SELECT * FROM product";
	       ResultSet rs = stmt.executeQuery(sql);

	       // Extract data from result set
	       int flag = 0;
	         
	       while(rs.next()){
	    	   //Retrieve by column name
	           n_barang++;        
	       }
	       
	       // Clean-up environment
	       rs.close();
	       stmt.close();
	       conn.close();
	    }catch(SQLException se){
	    	//Handle errors for JDBC
	        se.printStackTrace();
	    }catch(Exception e){
	         //Handle errors for Class.forName
	         e.printStackTrace();
	    }finally{
	         //finally block used to close resources
	         try{
	            if(stmt!=null)
	               stmt.close();
	         }catch(SQLException se2){
	         }// nothing we can do
	         try{
	            if(conn!=null)
	            conn.close();
	         }catch(SQLException se){
	            se.printStackTrace();
	         }//end finally try
	      } //end try
        
        /*
	    out.println(name);
	    out.println(price);
	    out.println(category);
	    out.println(description);
	    out.println(picture);
	    out.println("<img src=\"img/"+picture+"\">"); */
	    
        // Insert to database
        conn = null;
	    stmt = null;
	      try{
	         // Register JDBC driver
	         Class.forName("com.mysql.jdbc.Driver");

	         // Open a connection
	         conn = DriverManager.getConnection(DB_URL,USER,PASS);

	         // Execute SQL query
	         stmt = conn.createStatement();
	         String sql;
	         sql = "INSERT INTO product VALUES (?,?,?,?,?,?,?,?)";
	         PreparedStatement ps = conn.prepareStatement(sql);

	         ps.setInt(1, n_barang+1);
	         ps.setString(2, name);
	         ps.setString(3, description);
	         ps.setInt(4, price);
	         ps.setInt(5, 0);
	         ps.setInt(6, 0);
	         ps.setString(7, category);
	         ps.setString(8, picture);
	         ps.executeUpdate();
	         // Clean-up environment
	         stmt.close();
	         conn.close();
	      }catch(SQLException se){
	         //Handle errors for JDBC
	         se.printStackTrace();
	      }catch(Exception e){
	         //Handle errors for Class.forName
	         e.printStackTrace();
	      }finally{
	         //finally block used to close resources
	         try{
	            if(stmt!=null)
	               stmt.close();
	         }catch(SQLException se2){
	         }// nothing we can do
	         try{
	            if(conn!=null)
	            conn.close();
	         }catch(SQLException se){
	            se.printStackTrace();
	         }//end finally try
	      } //end try
	      
        // Show result page.
        response.sendRedirect("admin.jsp");
    }

}
