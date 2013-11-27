<%-- 
    Document   : register
    Created on : Nov 27, 2013, 1:53:03 AM
    Author     : A46CB
--%>

<jsp:include page="header.jsp"> 
<jsp:param name="pageTitle" value="Home"/> 
</jsp:include> 
    <div class="section page">
    <div class="wrapper">
        <h1>Registration</h1>
        <form name="register" method="post" action="register">
            <label>Username</label>
            <input type="text" name="username" oninput="validateUsername()" id="username">
            <span id="usernameInfo"></span>
            <label>Nama Lengkap</label>
            <input type="text" name="namalengkap" id="namalengkap" oninput="validateNamaLengkap()">
            <span id="namaInfo"></span>
            <label>No Handphone</label>
            <input type="text" name="nomor" id="nomor">
            <label>Alamat</label>
            <input type="text" name="alamat" id="alamat">
            <label>Provinsi</label>
            <input type="text" name="provinsi" id="provinsi">
            <label>Kabupaten/Kota</label>
            <input type="text" name="kota" id="kota">
            <label>Kodepos</label>
            <input type="text" name="kodepos" id="kodepos">
            <label>Email</label>
            <input type="text" name="email" id="email" oninput="validateEmail()">
            <span id="emailInfo"></span>
            <label>Password</label>
            <input type="password" name="password1" id="password1" oninput="validatePassword1()">
            <span id="password1Info"></span>
            <label>Confirm Password</label>
            <input type="password" name="password2" id="password2" oninput="validatePassword2()">
            <span id="password2Info"></span>
            <input type="submit" value="Register" id="submit" name="submit" class="register">
        </form>
    </div>
</div>
<%@include file="footer.jsp" %>
