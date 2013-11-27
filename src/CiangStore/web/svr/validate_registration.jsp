<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
					
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
					
					String usr = request.getParameter("username");
					String eml = request.getParameter("email");
					
					PreparedStatement st;
					
					st = con.prepareStatement("SELECT * FROM customer WHERE IdName=? OR Email=?");
					st.setString(1,usr);
					st.setString(2,eml);
					
					ResultSet rs;
					rs  = st.executeQuery();
					
					if(!rs.next()){
							response.getWriter().print(1);
						} else {
							response.getWriter().print(0);
						}
					
					
					st.clearParameters();
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };

%>