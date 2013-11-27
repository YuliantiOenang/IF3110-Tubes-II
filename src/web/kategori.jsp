<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<!DOCTYPE html> 
<?php session_start(); ?>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/latihan.css"> <!--pemanggilan file css-->

</head>
<script src="js/AjaxCreateObject.js" language="javascript"></script>
<script src="js/function.js" language="javascript"></script>

<body>
 <%@include file="header.jsp" %>


<div class = "bodymain">
	<%@include file="sidebar.jsp" %>
        <%
        String sort=request.getParameter("sort");
        String key=request.getParameter("key");
        String Page=request.getParameter("page");
        %>
	<div class = "boddy">
		<div class = "topfivetitle">
		<p class = "title"> CATEGORY</p></br></br>
		<form method="get" action="kategori.jsp">
		<input type="key" name="key" hidden value="<%out.print(key);%>"/>
		<select name="sort">
                    <option selected="<%if(sort!=null && sort.equals("nama")) out.print("true"); else if(sort==null) out.print("false"); %>" value="nama"> Nama Barang </option>
			<option selected="<%if(sort!=null && sort.equals("harga")) out.print("true"); else if(sort==null) out.print("false"); %>" value="harga">Harga Barang</option>
		</select>
		<input type="submit" value="Sort">
		</form>
		</div>
                <%
                koneksi db=new koneksi();     
                int jumlahPage=0;
                int counter=0;
                String temp=null;
                if(key!=null)
                {
                    if(sort!=null)
                    {
                       //session.invalidate();
                       try
                       {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+key+"' order by "+sort+"");
                           temp="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+key+"' order by "+sort+"";
                           session.setAttribute("hasil", temp);
                           while(rs2.next())
                           {
                               
                               session.setAttribute("nama"+counter, rs2.getString(1));
                               session.setAttribute("harga"+counter, rs2.getString(3));
                               session.setAttribute("foto"+counter, rs2.getString(5));
                               session.setAttribute("id"+counter, rs2.getString(6));
                               counter++;
                           }
                           rs2.last();
                           jumlahPage=rs2.getRow();
                       }
                       catch(Exception e)
                       {
                           
                       }
                    }
                    else
                    {
                       //session.invalidate();
                       try
                       {
                           db.dbopen();
                           ResultSet rs2=db.stat.executeQuery("select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+key+"' order by nama");
                           temp="select nama, kategori,harga,deskripsi,foto,no_alat from peralatan where kategori='"+key+"' order by nama";
                           session.setAttribute("hasil", temp);
                           while(rs2.next())
                           {
                               
                               session.setAttribute("nama"+counter, rs2.getString(1));
                               session.setAttribute("harga"+counter, rs2.getString(3));
                               session.setAttribute("foto"+counter, rs2.getString(5));
                               session.setAttribute("id"+counter, rs2.getString(6));
                               counter++;
                           }
                           rs2.last();
                           jumlahPage=rs2.getRow();
                       }
                       catch(Exception e)
                       {
                           
                       }
                    }
                }
                
                if(Page==null)
                {
                    int i;
                    i=0;
                    while(i<counter && i<10 && session.getAttribute("nama"+i)!=null)
                    {
                        out.print("<div class = 'searchres'>"
                        + "<div class = 'previmage'>"
                        + "<img src= '"+session.getAttribute("foto"+i) +"' class='resizeimage'><img>"
                        + "</div>"
                        + "<a href='detailbarang.jsp?id="+session.getAttribute("id"+i) +"'><p class = 'copyrightext'> "+session.getAttribute("nama"+i) +"</a> </br>"
                        + "Rp"+session.getAttribute("harga"+i) +" </label> </br> </p>"
                        + "<label>jumlah :</label><input type='text' size=4  id='jumlahBarang"+i+"'/>"
                        + "<input type='text' id='idBarang"+i+"' value='"+session.getAttribute("id"+i)+"' hidden/>"
                        + "");
                        
                        if(found)
                        {
                        %>
                        <input type="button" onclick="cekJumlah(<%out.print(i);%>)" value="Beli"></input>
                        <%
                        }
                        else
                        {
                            %>
                            <input type="button" onclick="alert('anda harus login terlebih dahulu'); window.location='index.jsp'" value="Beli"></input>
                            <%
                        }
                        out.print("</div>");
                        i++;
                    }
                }
                else
                {
                    counter=0;
                    int batas=(Integer.parseInt(Page)*10)+10;
                    counter=(Integer.parseInt(Page)*10);
                    while(counter<batas && session.getAttribute("nama"+counter)!=null)
                    {
                        out.print("<div class = 'searchres'>"
                        + "<div class = 'previmage'>"
                        + "<img src= '"+session.getAttribute("foto"+counter) +"' class='resizeimage'><img>"
                        + "</div>"
                        + "<a href='detailbarang.jsp?id="+session.getAttribute("id"+counter) +"'><p class = 'copyrightext'> "+session.getAttribute("nama"+counter) +"</a> </br>"
                        + "Rp"+session.getAttribute("harga"+counter) +" </label> </br> </p>"
                        + "<label>jumlah :</label><input type='text' size=4  id='jumlahBarang"+counter+"'/>"
                        + "<input type='text' id='idBarang"+counter+"' value='"+session.getAttribute("id"+counter)+"' hidden/>"
                        + "");
                        
                        if(found)
                        {
                        %>
                        <input type="button" onclick="cekJumlah(<%out.print(counter);%>)" value="Beli"></input>
                        <%
                        }
                        else
                        {
                            %>
                            <input type="button" onclick="alert('anda harus login terlebih dahulu'); window.location='index.jsp'" value="Beli"></input>
                            <%
                        }
                        out.print("</div>");
                        counter++;
                    }
                }
                %>
		
			 <div class = "searchnext">
                         <%
                         int tambah=0;
                            if(jumlahPage%10!=0 && jumlahPage>10)
                            {
                                tambah=1;
                                
                            }
                            else
                            {
                                tambah=0;
                            }
                            sort=request.getParameter("sort");
                            key=request.getParameter("key");
                            if(sort!=null)
                            {
                                
                            }
                            else
                            {
                                sort="nama";
                            }
                            int jumlah=jumlahPage/10+tambah;
                            out.print("page : ");
                            for(int j=0;j<jumlah;j++)
                            {
                               out.print("<a href='kategori.jsp?page="+j+"&sort="+sort+"&key="+key+"'>"+(j+1)+"  </a>"); 
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