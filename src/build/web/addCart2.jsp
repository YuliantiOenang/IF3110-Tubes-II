<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<%
                       try{
                            Cookie id= null;
                        Cookie cookies[] = null;
                        cookies = request.getCookies();
                        for(int i = 0;i<cookies.length;i++){
                            if(cookies[i].getName().equals("user1"))
                                id = cookies[i];
                        }
                           connect koneksion = new connect();
                           koneksion.dbopen();
                           ResultSet rs = koneksion.stat.executeQuery("select jumlah from peralatan where no_alat='"+request.getAttribute("id")+"'");
                           int jumlah = 99999999;
                           if(rs.next())
                            {
                                     jumlah=Integer.parseInt(rs.getString(1));
                            }

                            if(jumlah<Integer.parseInt(String.valueOf(request.getAttribute("jumlah"))))
                            {
                                    out.print(jumlah);
                            }
                            else
                            {
                                    koneksion.stat.executeUpdate("INSERT INTO `keranjang`(`id_customer`, `id_alat`, `jumlah`,`pesan`) VALUES ('"+id.getValue()+"','"+request.getAttribute("id") +"','"+request.getAttribute("jumlah")+"','"+request.getAttribute("permintaan")+"')");
                            }
                       }catch(Exception e){
                       System.out.println("error :"+e);
                       }
			
			
     
%>

