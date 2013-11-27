<%@page import="connect.connect"%>
<%@page import="java.sql.ResultSet"%>
<%
                    Cookie id= null;
                    Cookie cookies[] = null;
                    cookies = request.getCookies();
                    for(int i = 0;i<cookies.length;i++){
                       if(cookies[i].getName().equals("IdCustomer"))
                          id = cookies[i];
                    }
                        connect koneksion = new connect();
                        try{
                        System.out.println("INSERT INTO `keranjang`(`id_customer`, `id_alat`, `jumlah`,`pesan`) VALUES ('"+id.getValue()+"','"+request.getParameter("id")+"','"+request.getParameter("jumlah")+"','"+request.getAttribute("permintaan") +"')");
                        koneksion.dbopen();
                        koneksion.stat.executeUpdate("INSERT INTO `keranjang`(`id_customer`, `id_alat`, `jumlah`,`pesan`) VALUES ('"+id.getValue()+"','"+request.getParameter("id")+"','"+request.getParameter("jumlah")+"','"+request.getAttribute("permintaan")+"')");
                       	String JSONReturn = new String();
			JSONReturn+="{\"true\": 1}";
                                //$return['true']=true;
			out.print(JSONReturn);
                        }catch(Exception e){
                            System.out.println("error : "+e);
                        }     
     
%>

