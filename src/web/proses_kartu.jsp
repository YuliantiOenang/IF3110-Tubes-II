<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<%
	
	
	String card_number =  request.getParameter("card_number");
	String card_name = request.getParameter("card_name");
	String card_expired = request.getParameter("card_expired");
	String JSONReturn = new String();
         Cookie id= null;
         Cookie cookies[] = null;
         cookies = request.getCookies();
         for(int i = 0;i<cookies.length;i++){
            if(cookies[i].getName().equals("IdCustomer"))
                id = cookies[i];
         }
	connect koneksion = new connect();
        koneksion.dbopen();
        ResultSet rs = koneksion.stat.executeQuery("SELECT card_name FROM kartu_kredit WHERE card_name = '"+card_name+"' and card_number='"+card_number+"'");
   	System.out.println("SELECT card_name FROM kartu_kredit WHERE card_name = '"+card_name+"' and card_number='"+card_number+"'");
        if(rs.next()){
           try{
            System.out.println(""+ "UPDATE `customer` SET `card_number`='"+card_number+"' WHERE no_customer='"+ id.getValue()+"'");            
            koneksion.stat.executeUpdate("UPDATE `customer` SET `card_number`='"+card_number+"' WHERE no_customer='"+ id.getValue()+"'");
            JSONReturn+="{\"status\": 1}";
           }
           catch(Exception e){
            System.out.println("error  : "+e);
           JSONReturn+="{\"status\": 0}";
           }
           
		out.print(JSONReturn);
	}else{
            System.out.println("row kosong!!");
             JSONReturn+="{\"status\": \"0\", \"" + "cek\": \"" +card_number+"\"}";  
		
		out.print(JSONReturn);
	}
%>