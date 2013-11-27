<script type="text/javascript" src="js/fungsi.js"></script>
<%@include file="header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Credit Card Information</title>
    </head>
    <body>
        <h1>Register Page</h1>
        <div class="registerform">
            Halaman ini akan muncul setelah user melakukan checkout barang dan ingin membayar menggunakan kartu kredit.
            <form id="registerformid" action="registercardlogic.jsp">
                <fieldset>
                    CC Number : <input type="text" placeholder="Nomor kartu kredit" name="ccnumber"> <br><br>
                    Name on Card : <input type="text" name="nameoncard"> <br>
                    Expired : <input type="text" name="expired"> <br>
                    <input type="submit" value="Submit">
                </fieldset>
            </form>
        </div>
    </body>
</html>