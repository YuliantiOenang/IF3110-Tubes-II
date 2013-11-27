<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.if3110.web.DBConnector"%>
<%! public static String HOME_URL = "http://localhost/tugas_web2/"; %>
<h1>Detail Barang</h1>
<form class="table barang" method="post" onSubmit="return addToShoppingChartBarang(this)">
    <div class="row">
        <%-- barang itu ResultSet? --%>
        <% 
            String imgsrc;
            DBConnector dbCon = DBConnector.getInstance();
            Connection con = dbCon.getConnection();
            Statement st = con.createStatement();
            ResultSet res = st.executeQuery("");
            if(barang['image_url'] == "" || barang['image_url'] == null) imgsrc=HOME_URL+"assets/image/default.big.png"; else imgsrc=HOME_URL+decodeURIComponent(barang['image_url'].replace(/\+/g, ' '));
        %>
        <span class="column"><img src="<%= imgsrc %>" alt="Default" width="250" height="250"></span>
        <span class="column" style="vertical-align: top">
            <h2><%= barang['nama'] %></h2>
            <p>Rp.<% out.println(NumberFormat.getInstance(Locale.GERMANY).format(barang['harga'])); %></p>
            <p><%= barang['deskripsi'] %></p>
            <p><textarea name="pesan"></textarea></p>
            <p><span>Kuantitas: </span><input type="hidden" name="id_barang" value="<%= barang['barang_id'] %>"><input type="text" name="qty" onKeyUp="validateQtyBarang(this)"> <input type="submit" value="+" disabled="disabled"></p>
        </span>
    </div>
</form>