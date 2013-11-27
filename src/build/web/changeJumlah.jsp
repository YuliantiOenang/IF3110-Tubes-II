
<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>
<%
                        connect koneksion = new connect();
                        Cookie id= null;
                    Cookie cookies[] = null;
                    cookies = request.getCookies();
                    int id_alat = Integer.parseInt(request.getParameter("id"));
                    for(int i = 0;i<cookies.length;i++){
                       if(cookies[i].getName().equals("IdCustomer"))
                          id = cookies[i];
                    
                    }
                    System.out.println("id : "+id.getValue());
                        koneksion.dbopen();
                        ResultSet rs = koneksion.stat.executeQuery("select jumlah from peralatan where no_alat='"+request.getParameter("id") +"'");
                        System.out.println("select jumlah from peralatan where no_alat='"+id_alat+"'");
                        int jumlah;
                        if(rs.next())
			{
                            jumlah= Integer.parseInt(rs.getString(1));
                            System.out.println("jumlah barang di db"+jumlah+" jumlah barang di req "+Integer.parseInt(request.getParameter("jumlah")));
                            if(jumlah<Integer.parseInt(request.getParameter("jumlah")))
                            {
                                //System.out.println(id.getValue());
                                    out.print(jumlah);
                            }
                            else
                            { //System.out.println(id.getValue());
                             try{
                                 System.out.println("id customer"+id.getValue());
                                 System.out.println("id dari alat"+id_alat);
                                System.out.println("UPDATE `keranjang` SET `jumlah`='"+request.getParameter("jumlah")+"' WHERE id_customer='"+id.getValue()+"'and id_alat='"+id_alat+"'and id_cart='"+request.getParameter("idcart") +"'");
                                koneksion.stat.executeUpdate("UPDATE `keranjang` SET `jumlah`='"+request.getParameter("jumlah")+"' WHERE id_customer='"+id.getValue()+"'and id_alat='"+id_alat+"'and id_cart='"+request.getParameter("idcart") +"'");
                                }
                             catch (Exception e){
                                 System.out.println("error :"+ e);

                             }
                            }
                           }
			
						
     
%>

