<%@ page import="java.sql.*, javax.sql.*, java.io.*, javax.naming.*" %>
<%
	Connection con = null;
					
					try {
						try { 
						Class.forName("com.mysql.jdbc.Driver").newInstance(); 
						}catch(ClassNotFoundException ce){out.println(ce);} 

					con = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");
					
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
                                                        
                                                        /* Cek apakah user sudah mengisi kartu kredit */
                                                        Connection con_cc = null;
                                                        
                                                        try {
                                                            con_cc = DriverManager.getConnection("jdbc:mysql://localhost/wbd_ciangstore","root","");

                                                            PreparedStatement st_cc;

                                                            st_cc = con.prepareStatement("SELECT * FROM have WHERE IdName=?");
                                                            st_cc.setString(1,usr);

                                                            ResultSet rs_cc;
                                                            rs_cc  = st_cc.executeQuery();  
                                                            
                                                            int i = 0;
                                                            
                                                            while(rs_cc.next()) {
                                                                i++;
                                                            }
                                                            
                                                            if(i > 0) {
                                                                session.setAttribute("cc_validated", 1);
                                                            } else {
                                                                session.setAttribute("cc_validated", 0);
                                                            }
                                                        
                                                        } catch (Exception e) {
                                                            out.println(e.toString());
                                                        }
                                                        /*** AKHIR PENGECEKAN ***/
                                                        
							response.getWriter().print(1);
						} else {
							response.getWriter().print(0);
						}
					}
					
					st.clearParameters();
					con.close();
					} catch (Exception e) {out.println("Unable to connect to database."); };

%>