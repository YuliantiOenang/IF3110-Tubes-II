<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<%
    connect koneksion = new connect();
    koneksion.dbopen();
    String q = request.getParameter("q");
    String hint = "";
    
    try{
        ResultSet rs = koneksion.stat.executeQuery("select nama from peralatan");
        while(!rs.isLast()){
            rs.next();
            if(rs.getString(1).toLowerCase().contains(q.toLowerCase())){
                hint = rs.getString(1);
                break;
            }
        }
        
        out.print(hint);
    }catch(Exception e){
        System.out.println(e);
        %>
        
        <script>
            window.alert("TIDAK BISA MENCARI");
        </script>
        
        <%
    }
%>

<%--
<?php
include "config/connect.php";
	$q=$_GET["q"];
	$count=0;
	$cek=array();
	$mysql=mysql_query("select nama from peralatan");
	while($baris=mysql_fetch_array($mysql))
	{
		$cek[''.$count]=$baris[0];
		$count++;
	}
	
	if($mysql){
		$hint="";
		for($i=0; $i<count($cek); $i++){
			if (strtolower($q)==strtolower(substr($cek[$i],0,strlen($q)))){
				$hint=$cek[$i];
				break;
			}
		}
		echo $hint;
	}else{
		echo "Database ampas";
	}
?>
--%>