<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="koneksi.koneksi"%>
<%@page import="koneksi.WebUtil"%>
<%
WebUtil k=new WebUtil();
koneksi db=new koneksi();
String email_a = request.getParameter("email");
String[] email_b = email_a.split(".");
String username=request.getParameter("username");
String pass=request.getParameter("password");
String confPass=request.getParameter("confirm_password");
boolean boolUsedUser=true;
boolean boolUsedEmail=true;
String nama=request.getParameter("nama_lengkap");
String namaLengkap=nama.trim();
boolean boolUser=false;
boolean boolPass=false;
boolean bool = true;
boolean boolNama=false;
boolean boolEmail = false;

String[] namaLeng = namaLengkap.split(" ");
if(namaLeng.length>1){
	if(!namaLeng[1].equals("")){
		boolUser = true;
	}
}
if(username.length() >4 && !username.equals(pass))
{
	boolNama=true;
}
if(pass.equals(confPass) && !pass.equals(username) && !pass.equals(email_a) && pass.length()>=8 && !pass.equals("") && !confPass.equals(""))
{
	boolPass=true;
}
if(email_b.length > 2)
{
	bool=false;
}
else
{
	if(email_b.length>1)
	{
		if(email_b[1].length()<2)
		{
			
			bool=false;
		}
	}

}

if (k.isEmail(email_a) && bool) {
   boolEmail = true;
}
try
              {
                    db.dbopen();
                    ResultSet rs2=db.stat.executeQuery("select nama from customer where username='"+username+"'");
                    rs2.last();
                    if(rs2.getRow()>=1)
                    {
                       boolUsedUser=false;
                    }
                    
                    try
                    {
                        
                          ResultSet rs=db.stat.executeQuery("select nama from customer where email='"+email_a+"'");
                          rs.last();
                          if(rs.getRow()>=1)
                          {
                             boolUsedEmail=false;
                          }
                          
                    }
                    catch(Exception e )
                    {
                    }
              }
              catch(Exception e )
              {
              }
out.print("{\"boolUser\":"+boolUser+","
 + "\"boolPass\":"+boolPass+","
 + "\"bool\":"+boolEmail+","
 + "\"boolNama\":"+boolNama+","
 + "\"boolUsedUser\":"+boolUsedUser+","
 + "\"boolUsedEmail\":"+boolUsedEmail+""
 + "}");
%>
<%--<?php
include "../config/connect.php";

$email_a = $_GET["email"];
$email_b = explode('.',$email_a);
        
$username= $_GET["username"];



$pass= $_GET["password"];

$confPass= $_GET["confirm_password"];
$temp="       Andrian Octavianus                         ";
$LeftTrim= ltrim($temp);
$boolUsedUser=true;
$namaLengkap=rtrim(ltrim($_GET["nama_lengkap"]));
$mysql=mysql_query("select nama from customer where username='".$username."'");
$num=mysql_num_rows($mysql);
if($num>=1)
{
	$boolUsedUser=false;
}
$boolUsedEmail=true;
$mysql=mysql_query("select nama from customer where email='".$email_a."'");
$num=mysql_num_rows($mysql);
if($num>=1)
{
	$boolUsedEmail=false;
}
$boolUser=false;
$boolPass=false;
$bool = true;
$boolNama=false;
$boolEmail = false;
$retval=array();

$namaLeng = explode(' ',$namaLengkap);
if(count($namaLeng)>1){
	if($namaLeng[1] != ''){
		$boolUser = true;
	}
}

if(strlen($username)>4 && $username!=$pass)
{
	$boolNama=true;
}

if($pass==$confPass&& $pass!= "" && $confPass!="")
{
	$boolPass=true;
}

if(count($email_b) > 2)
{
	$bool=false;
}
else
{
	if(count($email_b)>1)
	{
		if(strlen($email_b[1])<2)
		{
			
			$bool=false;
		}
	}

}

if (filter_var($email_a, FILTER_VALIDATE_EMAIL) && $bool) {
   $boolEmail = true;
}


$return = array();
$return["boolUser"] = $boolUser;
$return["boolPass"] = $boolPass;
$return["bool"] = $boolEmail;
$return["boolNama"] = $boolNama;
$return["boolUsedUser"] = $boolUsedUser;
$return["boolUsedEmail"] = $boolUsedEmail;
echo json_encode($return);

?>--%>