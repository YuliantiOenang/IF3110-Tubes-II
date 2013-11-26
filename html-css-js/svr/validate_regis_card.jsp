<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
	
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
					
					String name = request.getParameter("name");
					String number = request.getParameter("number");
					String tanggal = request.getParameter("tanggal");
					
					PreparedStatement st;
					
					st = con.prepareStatement("SELECT * FROM credit WHERE CardNumber=?");
					st.setString(1,number);
					
					ResultSet rs;
					
					rs  = st.executeQuery();
					
					if(rs.next()){
							response.getWriter().print(0);
						} else {
							st.clearParameters();
							st = con.prepareStatement("INSERT INTO Credit(CardNumber, CardName, ExpiredDate) VALUES(?,?,?)");
							st.setString(1,number);
							st.setString(2,name);
							st.setString(3,tanggal);
							st.executeUpdate();
							
							st.clearParameters();
							st = con.prepareStatement("INSERT INTO Have(CardNumber, IdName) VALUES (?,?)");
							st.setString(1,number);
							st.setString(2,name);
							st.executeUpdate();
							
							response.getWriter().print(1);
						}
					
					
					st.clearParameters();
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };

%>