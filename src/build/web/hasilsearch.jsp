<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<!DOCTYPE html> 
<?php 
				session_start();?>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>
</head>
<body>
<div class = "bodymain">
    <%@include file="header.jsp" %>
    <%@include file="sidebar.jsp" %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> SEARCH RESULTS</p></br></br>
		</div>
		<%
		
		
		int counter=0;
		String hasil =  null;
		String hasil_temp = null;
                connect koneksion = new connect();
                koneksion.dbopen();
                
		if(request.getParameter("key")!=null)
		{       
                       
			if(request.getParameter("kategori").equalsIgnoreCase("all"))
			{
				if(Integer.parseInt( request.getParameter("range"))==1  )
				{
				hasil ="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga<50000 and nama like '%"+request.getParameter("key") +"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga<50000 and nama like '%"+request.getParameter("key")+"%'";
				}
				if(Integer.parseInt( request.getParameter("range"))==2)
				{
				hasil ="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>50000 and harga<100000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga>50000 and harga<100000 and nama like '%"+request.getParameter("key")+"%'";
				}
				if(Integer.parseInt( request.getParameter("range"))==3)
				{
				hasil ="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>100000 and harga<150000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga>100000 and harga<150000 and nama like '%"+request.getParameter("key")+"%'";
				}
				if(Integer.parseInt( request.getParameter("range"))==4)
				{
				hasil = "select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where harga>150000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where harga>150000 and nama like '%"+request.getParameter("key")+"%'";
				}
                                session.setAttribute("hasil", hasil_temp);
				try{
                                    System.out.println("debug 1 : "+hasil);
                                    ResultSet rs =koneksion.stat.executeQuery(hasil);
					System.out.println("DEBUG 1");
                                        while(rs.next())
					{
                                            System.out.println(rs.getString(1));
                                            session.setAttribute("nama"+counter, rs.getString(1));
                                            System.out.println(rs.getString(3));
                                            session.setAttribute("harga"+counter, rs.getString(3));
                                            System.out.println(rs.getString(5));
                                            session.setAttribute("foto"+counter, rs.getString(5));
                                            System.out.println(rs.getString(6));
                                            session.setAttribute("id"+counter, rs.getString(6));
                                            counter++;
					}
					
				}catch(Exception e){
				System.out.println("error 1:"+e);	
				}
					
			}
			else
			{

                       
                        	if(Integer.parseInt( request.getParameter("range"))==1)
				{
				hasil = "select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori")+"' and harga<50000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where kategori='"+request.getParameter("kategori")+"' and harga<50000 and nama like '%"+request.getParameter("key")+"%'";
				}
				if(Integer.parseInt( request.getParameter("range"))==2)
				{
				hasil = "select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori")+"' and harga>50000 and harga<100000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori")+"' and harga>50000 and harga<100000 and nama like '%"+request.getParameter("key")+"%'";
				}
				if(Integer.parseInt( request.getParameter("range"))==3)
				{
				hasil = "select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori")+"' and harga>100000 and harga<150000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where kategori='"+request.getParameter("kategori")+"' and harga>100000 and harga<150000 and nama like '%"+request.getParameter("key")+"%'";
				}
				if(Integer.parseInt( request.getParameter("range"))==4)
				{
				hasil = "select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+request.getParameter("kategori")+"' and harga>150000 and nama like '%"+request.getParameter("key")+"%'";	
				hasil_temp="select nama, kategori,harga,deskripsi,foto from peralatan where kategori='"+request.getParameter("kategori")+"' and harga>150000 and nama like '%"+request.getParameter("key")+"%'";
				}
				session.setAttribute("hasil", hasil_temp);
				try{
                                    System.out.println("debug2 : "+hasil);
                                    ResultSet rs = koneksion.stat.executeQuery(hasil);
					System.out.println("DEBUG 2");
                                        while(rs.next())
					{
                                            System.out.println(rs.getString(1));
                                            session.setAttribute("nama"+counter, rs.getString(1));
                                            System.out.println(rs.getString(3));
                                            session.setAttribute("harga"+counter, rs.getString(3));
                                            System.out.println(rs.getString(5));
                                            session.setAttribute("foto"+counter, rs.getString(5));
                                            System.out.println(rs.getString(6));
                                            session.setAttribute("id"+counter, rs.getString(6));
                                            counter++;
					}
					
				}catch(Exception e){
                                    
					System.out.println("error 2: "+e);
					
					}
					
			}
			//$_SESSION['hasil']=$hasil;
		}
		
		else
		{
		hasil=String.valueOf(session.getAttribute("hasil"));
		session.setAttribute("hasil", hasil);
		}
		if(request.getParameter("page")==null)
		{
			int i=0;
			while(i<counter && i<10 && session.getAttribute("nama"+i)!=null)
			{
			%>
			<div class = "searchres">
					<div class = "previmage">
                                            <a href="detailbarang.jsp?id=<%out.print(session.getAttribute("id"+i));%>"><img src= "<%out.print(session.getAttribute("foto"+i));%>" class="resizeimage"><img></a>
					
					</div>
					<p class = "copyrightext"> <%out.print(session.getAttribute("nama"+i));%> </br>
						  Rp<%out.print(session.getAttribute("harga"+i));%> </label> </br> </p>
				</div>';
			<%
			i++;
			}
		}
		else
		{
			
			counter=0;
			int batas=(Integer.parseInt(request.getParameter("page")) *10)+10;
			counter=Integer.parseInt(request.getParameter("page"));
			while(counter<batas && session.getAttribute("nama"+counter)!=null)
			{
			%>
			<div class = "searchres">
					<div class = "previmage">
						<a href="detailbarang.jsp?id='<%out.print(session.getAttribute("id"+counter));%>'"><img src= "<%out.print(session.getAttribute("foto"+counter));%>" class="resizeimage"><img></a>
					</div>
					<p class = "copyrightext"> '<%out.print(session.getAttribute("nama"+counter));%>' </br>
						  Rp <%out.print(session.getAttribute("harga"+counter));%> </label> </br> </p>
				</div>
			<%
			counter++;
			}
		}
		%>
			 <div class = "searchnext">
			 <%
			 try{
                         
                         hasil_temp=String.valueOf(session.getAttribute("hasil"));
                         System.out.println("debug 3 : "+String.valueOf(session.getAttribute("hasil")));
                         ResultSet rs  =koneksion.stat.executeQuery(String.valueOf(session.getAttribute("hasil")));
                         
                         rs.last();
                         int num_rows = rs.getRow();
			 int tambah= 0;
			 if(num_rows%10!=0 && num_rows>10)
			 {
				tambah=1;
			 }
			 else
			 {
				tambah=0;
			 }
			  int jumlahPage=num_rows/10 + tambah;
			 
			 int i=0;
			 for(i=1;i<=jumlahPage;i++)
			{
                         %>
                         	Page <a href="hasilsearch.jsp?page=<%out.print(i);%>"><%out.print(i);%> </a>
			<%
			}
			
                         }
                         catch(Exception e){
                         System.out.println("error 3: "+e);
                         
                         }
			%>
		
			</div>
			  
	</div>
</div>
			
	<div class = "footer">
		<div class = "info">

		</div>
		
				
		
	</div>
</div>
</body>
</html>