<%-- 
    Document   : admin-edit
    Created on : Nov 26, 2013, 10:25:20 PM
    Author     : Ahmad Fauzan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/desktop.css">
        <script src='js/profile.js'></script>
        <title>Edit Barang</title>
    </head>
    <body>
        <div class='formcontainer'>
            <h2 id='formtitle'>Edit Barang | </h2>
            <br />
            <form id='formprofile' method='post' action='SaveProfileServlet'>
                <span class='formlabel'>Nama barang</span><input type='text' name='name_barang' /><br />
                <br />
                <span class='formlabel'>Kategori</span><input type='text' name='category' value='' /><br />
                <br />
                <span class='formlabel'>Harga Barang</span><input type='text' name='harga' /><br />
                <br />
                <span class='formlabel'>Jumlah Tersedia </span><input type='text' name='tersedia' /><br />
                <br />
                <span class='formlabel'>Gambar </span><input type='file' name='gambar' /><br />
                <br />
                <br />
                <input type='submit' name='esubmit' value='Simpan'>
            </form>
        </div>
    </body>
</html>
