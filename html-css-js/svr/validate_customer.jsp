<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
					
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/ruserba","root","");
					
					String usr = request.getParameter("usr");
					String pass = request.getParameter("pass");
					
					PreparedStatement st;
					
					st = con.prepareStatement("SELECT * FROM customer WHERE IdName=?");
					st.setString(1,usr);
					
					ResultSet rs;
					rs  = st.executeQuery();
					
					while(rs.next()){
						if (rs.getString(2).equals(pass)){
							session.setAttribute("login_user", usr);
							session.setAttribute("user_role", rs.getInt(11));
							response.getWriter().write(1);
						} else {
							response.getWriter().write(0);
						}
					}
					
					st.clearParameters();
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };

%>