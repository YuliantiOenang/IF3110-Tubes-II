<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<%
    koneksi db=new koneksi();
    String q=request.getParameter("q");
    int counter=0;
    ArrayList<String> cek=new ArrayList<String>();
    String hint="";
    try
    {
        db.dbopen();
        ResultSet rs=db.stat.executeQuery("select nama from peralatan");
        while(rs.next())
        {
            cek.add(rs.getString(1));
        }
        for(String temp:cek)
        {
            if(q.toLowerCase().equals(temp.toLowerCase().substring(0, q.length())))
            {
                hint=temp;
                break;
            }
        }
        out.print(hint);
    }
    catch(Exception e)
    {
        
    }
%>

<%--<?php
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
?>--%>