package tubes2wbd;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class editprofilesave
 */
public class editprofilesave extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final String JDBC_DRIVER="com.mysql.jdbc.Driver";  
	final String DB_URL="jdbc:mysql://localhost/wbd1";
	//  Database credentials
	final String USER = "root";
	final String PASS = "";  
    
	String username,password,nama,nomorhp,alamat,provinsi,kota,kodepos,email,file_name;
	
	private boolean isMultipart;
   private String filePath;
   private int maxFileSize = 5000 * 1024;
   private int maxMemSize = 40 * 1024;
   private File file ;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editprofilesave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("username") != null)
			username = request.getParameter("username");
		if (request.getParameter("password") != null)
			password = request.getParameter("password");
		if (request.getParameter("nama") != null)
			nama = request.getParameter("nama");
		if (request.getParameter("nomorhp") != null)
			nomorhp = request.getParameter("nomorhp");
		if (request.getParameter("alamat") != null)
			alamat = request.getParameter("alamat");
		if (request.getParameter("provinsi") != null)
			provinsi = request.getParameter("provinsi");
		if (request.getParameter("kota") != null)
			kota = request.getParameter("kota");
		if (request.getParameter("kodepos") != null)
			kodepos = request.getParameter("kodepos");
		if (request.getParameter("email") != null)
			email = request.getParameter("email");
		
		filePath = getServletContext().getInitParameter("images");
		isMultipart = ServletFileUpload.isMultipartContent(request);
		if (isMultipart) {
			DiskFileItemFactory factory = new DiskFileItemFactory();
			 // maximum size that will be stored in memory
		      factory.setSizeThreshold(maxMemSize);
		      // Location to save data that is larger than maxMemSize.
		      factory.setRepository(new File("c:\\temp"));

		      // Create a new file upload handler
		      ServletFileUpload upload = new ServletFileUpload(factory);
		      // maximum file size to be uploaded.
		      upload.setSizeMax( maxFileSize );
		      
			try {
				List fileItems = upload.parseRequest(request);
			    Iterator i = fileItems.iterator();
			    
			    while (i.hasNext()) {
			    	FileItem fi = (FileItem)i.next();
			    	if (!fi.isFormField()) {
			    		 // Get the uploaded file parameters
			            String fieldName = fi.getFieldName();
			            String fileName = fi.getName();
			            String contentType = fi.getContentType();
			            boolean isInMemory = fi.isInMemory();
			            long sizeInBytes = fi.getSize();
			            // Write the file
			            if( fileName.lastIndexOf("\\") >= 0 ){
			               file = new File( filePath + 
			               fileName.substring( fileName.lastIndexOf("\\"))) ;
			            }else{
			               file = new File( filePath + 
			               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
			            }
			            fi.write( file ) ;
			            file_name = fileName;
			    	}
			    }
			    
			} catch (FileUploadException e) {} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		Connection conn = null;
	    Statement stmt = null;
	    PrintWriter out = response.getWriter();
	    try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL,USER,PASS);
			stmt = conn.createStatement();
			
			String sql;
			sql = "update anggota set password='"+password+"',nama='"+nama+"',nomorhp='"+nomorhp+"',alamat='"+alamat+"',provinsi='"+provinsi+"',kota='"+kota+"',kodepos='"+kodepos+"',email='"+email+"',foto='"+file_name+"' where username='"+username+"'";
			if (username != null && password != null) {
				//ResultSet rs = stmt.executeQuery(sql);
				int r = stmt.executeUpdate(sql);
				if (r > 0) {
					out.print("<html><body>Profile berhasil diedit!<br><a href='profile.jsp'>Kembali ke halaman profile</a></body></html>");
				}
				else {
					out.print("<html><body>Edit profile gagal.<br><a href='editprofile.jsp'>Edit ulang</a> atau <a href='index.jsp'>Kembali ke halaman utama</a></body></html>");
					}
			}
			else {
				out.print("<html><body>Your username or password is incorrect!<br><a href='editprofile.jsp'>Edit ulang</a> atau <a href='index.jsp'>Kembali ke halaman utama</a></body></html>");
			}
			
			
			
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
