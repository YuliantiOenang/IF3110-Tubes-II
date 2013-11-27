<%@page import="javax.mail.internet.AddressException"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="org.hibernate.validator.internal.constraintvalidators.EmailValidator"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="connect.connect"%>
<%
    connect koneksion = new connect();
    koneksion.dbopen();
    
    String email_a = request.getParameter("email");
    String email_b[] = email_a.split(".");
    
    String username = request.getParameter("username");
    String pass = request.getParameter("password");
    String confPass = request.getParameter("confirm_password");
    boolean boolUsedUser = true;
    String namaLengkap = request.getParameter("nama_lengkap").trim();
    
    
    //MENCARI USERNAME
    ResultSet rs = koneksion.stat.executeQuery("select nama from customer where username='" + username + "'");
    rs.last();
    if(rs.getRow()>=1){
        boolUsedUser = false;
    }
    
    //VALIDASI EMAIL TERPAKAI
    boolean boolUsedEmail = true;
    ResultSet rs2 = koneksion.stat.executeQuery("select nama from customer where email='" + email_a + "'");
    rs2.last();
    if(rs2.getRow()>=1){
        boolUsedEmail = false;
    }
    boolean boolUser = false;
    boolean boolPass = false;
    boolean bool = true;
    boolean boolNama = false;
    boolean boolEmail = false;
    
    String namaLeng[] = namaLengkap.split(" ");
    if(namaLeng.length > 1){
        if(!namaLeng[1].isEmpty()) {
            boolUser = true;
        }
    }
    
    
    if(username.length()>4 && !username.equals(pass)){
        boolNama = true;
    }
    
    if(pass.equals(confPass) && !pass.isEmpty() && !confPass.isEmpty() && pass.length()>7){
        boolPass = true;
    }
    
    if(email_b.length > 2){
        bool = false;
    }else{
        if(email_b.length>1){
            if(email_b[1].length()<2){
                bool = false;
            }
        }
    }
    
    //VALIDASI EMAIL
    boolean result = true;
    try{
        InternetAddress email = new InternetAddress(email_a);
        email.validate();
    }catch(AddressException e){
        result = false;
    }
    
    
    //CEK KESAMAAN PASSWORD
    boolean emailPassSame = false;
    String cekEmailId[] = email_a.split("@");
    if(cekEmailId.length>1){
        if(cekEmailId[0].equals(pass)){
            emailPassSame = true;
        }
    }
    
    //CEK BELAKANG EMAIL
    boolean validEmail = true;
    if(cekEmailId.length>1){
        if(!cekEmailId[1].contains(".")){
            validEmail = false;
        }else{
            String cekPalingBelakang[] = cekEmailId[1].split("\\.");
            if(cekPalingBelakang.length > 1){
                if(cekPalingBelakang[1].length()<3){
                    validEmail = false;
                }
            }
        }
        
    }
    
    
    if(result && bool && !emailPassSame && validEmail){
        boolEmail = true;
    }
    
    //MENGEMBALIKAN JSON
    String JSONReturn = new String();
    JSONReturn += "{";
    JSONReturn += "\"boolUser\"" + ": " + boolUser + ",";
    JSONReturn += "\"boolPass\"" + ": " + boolPass +",";
    JSONReturn += "\"bool\"" + ": " + boolEmail +","; 
    JSONReturn += "\"boolNama\"" + ": " + boolNama + ",";
    JSONReturn += "\"boolUsedUser\"" + ": " + boolUsedUser + ",";
    JSONReturn += "\"boolUsedEmail\"" + ": " + boolUsedEmail + "";
    JSONReturn += "}";
    out.print(JSONReturn);
    
%>

<%--?php
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

?--%>