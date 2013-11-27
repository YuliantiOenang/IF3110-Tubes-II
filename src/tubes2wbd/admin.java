package tubes2wbd;

import java.io.Console;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.logging.ConsoleHandler;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class admin
 */
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	final String USER = "root";
	final String PASS = "";  
    
	String username,password,nama,nomorhp,alamat,provinsi,kota,kodepos,email,file_name;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				Enumeration paramNames = request.getParameterNames();
			    String paramName;
				ArrayList<String> CheckedBox = new ArrayList<String>();
			    while(paramNames.hasMoreElements()) {
			         paramName = (String)paramNames.nextElement();
			         String[] paramValues = new String[1];
			         paramValues = request.getParameterValues(paramName);
			         if (paramValues[0].equals("on")) {
			        	 CheckedBox.add(paramName);
			         }
			     }
			    
			    for (int i=0; i< CheckedBox.size();i++){
			    	System.out.println(CheckedBox.get(i));
			    }
			  
		    	Connection conn = null;
			    Statement stmt = null;
			    PrintWriter out = response.getWriter();
			    try {
					Class.forName("com.mysql.jdbc.Driver");
					conn = DriverManager.getConnection(DB_URL,USER,PASS);
					stmt = conn.createStatement();
					String sql;
					for (int i=0;i<CheckedBox.size();i++){
						sql = "delete from barang where id='"+CheckedBox.get(i)+"'";
						stmt.executeUpdate(sql);
					}
					CheckedBox.clear();
				} catch (ClassNotFoundException e) {	
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				}
	}

}
