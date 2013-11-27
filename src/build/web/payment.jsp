<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<%
    int jmlh = Integer.parseInt(request.getParameter("jumlah"));
    if(jmlh ==0){
  %>
	<script type="text/javascript">
		window.alert("Tidak ada barang yang di beli");
		window.location="pembayaran.jsp";
	</script>
        <%
            }
    
                 connect koneksion = new connect();
                 PreparedStatement statement = null;
                 PreparedStatement statement2 = null;
                 PreparedStatement statement3 = null;
                 PreparedStatement statement4 = null;
                 Cookie id = null;
                 Cookie cookies[] = null;
                 cookies = request.getCookies();
                  for(int i = 0;i<cookies.length;i++){
                       if(cookies[i].getName().equals("IdCustomer"))
                          id = cookies[i];
                  }
                 koneksion.dbopen();
                 
                 statement = koneksion.con.prepareStatement("select card_number from customer where no_customer="+id.getValue()+"");
                 ResultSet rs = statement.executeQuery();
                 rs.last();
                 if(rs.getRow()== 0){
        %>                        
				<script type="text/javascript">
							window.alert("Maaf Anda belum mendaftarkan kartu kredit anda");
							window.location="registrasi_kartu.php?status=payment";
				</script>
                                
          <%
                }
                 else{
                rs.last();
                String haveCard =  rs.getString(1);
                }
          boolean bool =true;
          
          statement = koneksion.con.prepareStatement("select id_alat,jumlah from keranjang where id_customer="+id.getValue()+"");
          
          rs = statement.executeQuery();
          ResultSet rs2 = null;
          while(rs.next()){
            statement2 = koneksion.con.prepareStatement("select jumlah from peralatan where no_alat="+rs.getString(1)+"");
            rs2 = statement2.executeQuery();
            while (rs2.next()){
                if(Integer.parseInt(rs2.getString(1))<Integer.parseInt(rs.getString(2)))
                    bool =false;
            }
          }
          
          boolean boolCheck = true;
          if(bool){
            statement = koneksion.con.prepareStatement("select id_alat,pesan,jumlah from keranjang where id_customer="+id.getValue());
            rs = statement.executeQuery();  
             while(rs.next()){
             ///tambahan    
                statement2 = koneksion.con.prepareStatement("select jumlah from peralatan where no_alat='"+rs.getString(1)+"'");
                rs2 = statement2.executeQuery();  
                 while(rs2.next()){
                 if(Integer.parseInt(rs2.getString(1))<Integer.parseInt(rs.getString(3)))
                    bool =false;
                System.out.println("ASDSAD");
                try{
                statement2 = koneksion.con.prepareStatement("INSERT INTO terbayar(`id_barang`, `jumlah`, `id_costumer`,`pesan`) VALUES ("+rs.getString(1)+","+rs.getString(3)+","+id.getValue()+",'"+rs.getString(2)+"')");
                statement2.executeUpdate();
                }
                catch(Exception e){
                    System.out.println(e);
                    boolCheck=false;
                }
                System.out.println("ASDSAD");
                
                
                int newCount = Integer.parseInt(rs2.getString(1))-Integer.parseInt(rs.getString(3));
                System.out.println(rs.getString(1)+" " + rs.getString(3));
                try{
                    statement3 = koneksion.con.prepareStatement("UPDATE peralatan SET `jumlah`="+newCount+" WHERE no_alat="+rs.getString(1)+"");
                    statement3.executeUpdate();}
                catch(Exception e){
                    System.out.println(e);
                    boolCheck=false;
                }
                try{
                    statement4 = koneksion.con.prepareStatement("DELETE FROM keranjang WHERE id_customer="+id.getValue()+"");
                   statement4.executeUpdate();}
                catch(Exception e){
                    System.out.println(e);
                    boolCheck=false;
                }
                
		
                 } 
             }
          if(boolCheck){
          %>
		
				<script type="text/javascript">
							window.alert("Berhasil Membeli");
							window.location="index.jsp";
				</script>
			<%
			}
			else
			{
				%>
				<script type="text/javascript">
							window.alert("Gagal membeli, terdapat kesalahan dalam akses database");
							window.location="index.jsp";
				</script>
			<%
			}
		}
			else
			{
				%>
				<script type="text/javascript">
							window.alert("Gagal Membeli, benda kurang");
							window.location="index.jsp";
				</script>
			<%
			}
			%>