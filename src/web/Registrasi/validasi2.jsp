
<%@page import="java.sql.ResultSet"%>
<%@page import="koneksi.koneksi"%>
<%@page import="koneksi.WebUtil"%>
<%-- 
    Document   : validasi2
    Created on : Nov 24, 2013, 6:27:06 PM
    Author     : octo
--%>
<%
WebUtil k=new WebUtil();
koneksi db=new koneksi();
String email_a = "andrian.octo@g.com";
String[] email_b = email_a.split(".");
String username="gtsquadron";
String pass="31023102";
String confPass="31023102";
boolean boolUsedUser=true;
boolean boolUsedEmail=true;
String nama="And";
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
if(pass.equals(confPass) && !pass.equals("") && !confPass.equals(""))
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
if(boolEmail)
       {
        out.println("it's work "+boolEmail);
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
$return = array();
out.print("{\"boolUser\":\""+boolUser+"\","
 + "\"boolPass\":"+boolPass+","
 + "\"bool\":"+boolEmail+","
 + "\"boolNama\":"+boolNama+","
 + "\"boolUsedUser\":"+boolUsedUser+","
 + "\"boolUsedEmail\":"+boolUsedEmail+""
 + "}");
$return["boolUser"] = $boolUser;
$return["boolPass"] = $boolPass;
$return["bool"] = $boolEmail;
$return["boolNama"] = $boolNama;
$return["boolUsedUser"] = $boolUsedUser;
$return["boolUsedEmail"] = $boolUsedEmail;
echo json_encode($return);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
