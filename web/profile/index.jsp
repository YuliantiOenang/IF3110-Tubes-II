<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!doctype html>
<%
    String dbusername = "";
    String dbpassword = "";
    String dbfullname = "";
    String dbalamat = "";
    String dbkecamatan = "";
    String dbprovinsi = "";
    String dbkodepos = "";
    String dbtelepon = "";

    String queryDummy = "SELECT * FROM users WHERE username = 'okihita'";

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/newcommerce", "root", "");
    Statement statement = con.createStatement();

    ResultSet resultSet = statement.executeQuery(queryDummy);
    while (resultSet.next()) {
        dbusername = resultSet.getString("username");
        dbpassword = resultSet.getString("password");
        dbfullname = resultSet.getString("fullname");
        dbalamat = resultSet.getString("alamat");
        dbkecamatan = resultSet.getString("kecamatan");
        dbprovinsi = resultSet.getString("provinsi");
        dbkodepos = resultSet.getString("kodepos");
        dbtelepon = resultSet.getString("telepon");
    }
%>

<head>

    <script language="javascript">

        function enableSubmit() {
            var confirm = document.getElementById("confpass").value;
            var password = document.getElementById("password").value;
            if (confirm !== password) {
                document.getElementById("submitbutton").disabled = true;
            } else {
                document.getElementById("submitbutton").disabled = false;
            }
        }

        function enableField() {
            document.inputForm.fullname.disabled = false;
            document.inputForm.password.disabled = false;
            document.inputForm.confpass.disabled = false;
            document.inputForm.alamat.disabled = false;
            document.inputForm.provinsi.disabled = false;
            document.inputForm.kecamatan.disabled = false;
            document.inputForm.kodepos.disabled = false;
            document.inputForm.telepon.disabled = false;
        }

        function checkUser() {
            var username = document.getElementById("fullname").value;
            if (username === "<%= dbfullname%>") {
                document.getElementById("fullnameok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("fullnameok").innerHTML = "";
            }
        }
        function checkPass() {
            var username = document.getElementById("password").value;
            if (username === "<%= dbpassword%>") {
                document.getElementById("passwordok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("passwordok").innerHTML = "";
            }
        }
        function checkConf() {
            var confirm = document.getElementById("confpass").value;
            var password = document.getElementById("password").value;
            if (confirm !== password) {
                document.getElementById("confirmok").innerHTML = "Harus sama dengan password!";
            } else {
                document.getElementById("confirmok").innerHTML = "";
            }
        }
        function checkAlam() {
            var username = document.getElementById("alamat").value;
            if (username === "<%= dbalamat%>") {
                document.getElementById("alamatok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("alamatok").innerHTML = "";
            }
        }
        function checkProv() {
            var username = document.getElementById("provinsi").value;
            if (username === "<%= dbprovinsi%>") {
                document.getElementById("provinsiok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("provinsiok").innerHTML = "";
            }
        }
        function checkKeca() {
            var username = document.getElementById("kecamatan").value;
            if (username === "<%= dbkecamatan%>") {
                document.getElementById("kecamatanok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("kecamatanok").innerHTML = "";
            }
        }
        function checkKode() {
            var username = document.getElementById("kodepos").value;
            if (username === "<%= dbkodepos%>") {
                document.getElementById("kodeposok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("kodeposok").innerHTML = "";
            }
        }
        function checkTele() {
            var username = document.getElementById("telepon").value;
            if (username === "<%= dbtelepon%>") {
                document.getElementById("teleponok").innerHTML = "Masih sama!";
            } else {
                document.getElementById("teleponok").innerHTML = "";
            }
        }


    </script>
</head>
<body>
    <a href="javascript:enableField()">Click here to edit</a><br>
    <form name="inputForm" action="updateprofile.jsp" method="post">
        Fullname: <input type="text" name="fullname" value="<%= dbfullname%>" id="fullname" onkeyup="checkUser()" pattern="^[A-Za-z]+(\s[A-Za-z]*)+$" disabled>
        <span id="fullnameok"></span>
        <br>
        Change Password: <input type="password" name="password" value="<%= dbpassword%>" id="password" onkeyup="checkPass()" disabled>
        <span id="passwordok"> </span>
        <br>
        Confirm Change Password: <input type="password" id="confpass" onkeyup="checkConf();
            enableSubmit()" disabled>
        <span id="confirmok"> </span>
        <br>
        Alamat: <input type="text" name="alamat" value="<%= dbalamat%>" id="alamat" onkeyup="checkAlam()" disabled>
        <span id="alamatok"> </span>
        <br>
        Provinsi: <input type="text" name="provinsi" value="<%= dbprovinsi%>" id="provinsi" onkeyup="checkProv()" disabled>
        <span id="provinsiok"> </span>
        <br>
        Kecamatan: <input type="text" id="kecamatan" name="kecamatan" value="<%= dbkecamatan%>" onkeyup="checkKeca()" disabled>
        <span id="kecamatanok"> </span>
        <br>
        Kodepos: <input type="text" id="kodepos" value="<%= dbkodepos%>" name="kodepos" onkeyup="checkKode()" disabled>
        <span id="kodeposok"> </span>
        <br>
        Nomor handphone: <input type="text" id="telepon" value="<%= dbtelepon%>" name="telepon" onkeyup="checkTele()" disabled>
        <span id="teleponok"> </span>
        <br>
        <input type="hidden" name="username" value="<%= dbusername%>">
        <input type="submit" id="submitbutton" value="Okay, update!" disabled="disabled">
    </form>
</body>
</html>