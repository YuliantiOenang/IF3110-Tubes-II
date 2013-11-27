<%@page import="bean.DatabaseAccess"%>
<%@page import="bean.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp" />
<%
	ArrayList<Transaksi> shopList = (ArrayList<Transaksi>) session.getAttribute("IT");
	String kartu=(String)request.getParameter("kartuTerpilih");
	DatabaseAccess dbAccess = new DatabaseAccess();
	out.print("<h4>Terima Kasih "+session.getAttribute("username")+"</h4>");
	out.print("<h4>Berikut barang-barang yang Anda telah beli :</h4>");
	int total=0; 
	int sisa=0;
	for(int i=0; i<shopList.size();i++){		
		System.out.println("TOTAL STOCK ="+shopList.get(i).getBarang().getStok());
		total += (shopList.get(i).getBarang().getHarga_barang() * shopList.get(i).getQt());		
		sisa=shopList.get(i).getBarang().getStok()-shopList.get(i).getQt();			
		out.print((i+1)+". <b>"+shopList.get(i).getBarang().getNama_barang()+"</b> Berjumlah = "+shopList.get(i).getQt()+"</br>");
		String SQL1 = "UPDATE barang SET stok="+sisa+" WHERE id_barang ="+shopList.get(i).getBarang().getId_barang();
		dbAccess.doQueryUpdate(SQL1);
		System.out.println((i+1)+". SQL 1=>"+ SQL1);
		if(sisa<=0){			
			String SQL2 = "DELETE FROM progin_13511021 WHERE id_barang="+shopList.get(i).getBarang().getId_barang();
			dbAccess.doQueryUpdate(SQL2);
			System.out.println((i+1)+". SQL 2=>"+ SQL2);
		}
		System.out.println("INI SISA, "+sisa+", "+shopList.get(i).getQt());
		if(i<shopList.size()){
			for(int j=i+1;j<shopList.size();j++){
				System.out.println(shopList.get(i).getBarang().getId_barang()+"_"+shopList.get(j).getBarang().getId_barang());
				if(shopList.get(i).getBarang().getId_barang().equals(shopList.get(j).getBarang().getId_barang())){			
					shopList.get(j).getBarang().setStok(sisa);				
					System.out.println("TERUPDATE"+sisa);
				}
			}	
		}	
	}
	out.print("<h4>Anda membayar dengan kartu kredit bernomor "+kartu+", dengan total pembelian Anda: "+total+"</h4>");	
%>

<jsp:include page="footer.jsp" />
 
