
<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>
<%
                        connect koneksion = new connect();
                        Cookie id= null;
                    Cookie cookies[] = null;
                    cookies = request.getCookies();
                                
                    for(int i = 0;i<cookies.length;i++){
                       if(cookies[i].getName().equals("IdCustomer"))
                          id = cookies[i];
                    }
                    System.out.println("id : "+id.getValue());
                        koneksion.dbopen();
                        ResultSet rs = koneksion.stat.executeQuery("select jumlah from peralatan where no_alat='"+request.getParameter("id") +"'");
                        System.out.println("select jumlah from peralatan where no_alat='"+request.getParameter("id")+"'");
                        int jumlah;
                        if(rs.next())
			{
                            jumlah= Integer.parseInt(rs.getString(1));
                            System.out.println(""+jumlah+" "+Integer.parseInt(request.getParameter("jumlah")));
                            if(jumlah<Integer.parseInt(request.getParameter("jumlah")))
                            {
                                //System.out.println(id.getValue());
                                    out.print(jumlah);
                            }
                            else
                            { //System.out.println(id.getValue());
                             try{
                                 System.out.println(id.getValue());
                                System.out.println("UPDATE `keranjang` SET `jumlah`='"+request.getParameter("jumlah")+"' WHERE id_customer='"+id.getValue()+"'");
                                koneksion.stat.executeUpdate("UPDATE `keranjang` SET `jumlah`='"+request.getParameter("jumlah")+"' WHERE id_customer='"+id.getValue()+"'");
                                }
                             catch (Exception e){
                                 System.out.println("error :"+ e);

                             }
                            }
                           }
			
						
     
%>

