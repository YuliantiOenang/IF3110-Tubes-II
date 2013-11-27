<%! public static String HOME_URL = "http://localhost/tugas_web2/"; %>
<%!
    public boolean isInteger( String input )  
    {  
       try  
       {  
          Integer.parseInt( input );  
          return true;  
       }  
       catch( Exception e)  
       {  
          return false;  
       }  
    }  
%>
<%
    String query = request.getParameter("query");
    String result = "";
    String title = "";
    String sql = "";
    // check input
    if(query.indexOf("less ") == 0){
        result = query.substring(5);
        title = "Hasil pencarian kurang dari Rp. " + NumberFormat.getInstance(Locale.GERMANY).format(result);
        sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        sql += "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        sql += "WHERE barang_data.harga < "+result;
    } else if(query.indexOf("more ") == 0){
        result = query.substring(5);
        title = "Hasil pencarian lebih dari Rp. " + NumberFormat.getInstance(Locale.GERMANY).format(result);
        sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        sql += "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        sql += "WHERE barang_data.harga > "+result;
    } else if(query.indexOf("category ") == 0){
        result = query.substring(9);
        title = "Hasil pencarian untuk kategori <i>"+result+"</i>";
        sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        sql += "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        sql += "WHERE barang_kategori.kategori_nama LIKE '%"+result+"%'";
    } else {
        result = query;
        title = "Hasil pencarian untuk <i>"+result+"</i>";
        sql = "SELECT barang_data.barang_id, barang_data.nama, barang_kategori.kategori_nama, barang_data.harga, barang_data.image_url, barang_data.deskripsi ";
        sql += "FROM barang_data INNER JOIN barang_kategori ON barang_data.kategori_id = barang_kategori.kategori_id ";
        sql += "WHERE barang_data.nama LIKE '%"+result+"%'";
    }
    $query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
    int total_row = mysql_num_rows($query);
    
    int start_number = 0;
    int this_page = 1;
    String temp ="";
    if(request.getParameter("page") != null) {
        if(isInteger(request.getParameter("page"))) {
            this_page = Integer.parseInt(request.getParameter("page"));
            if((total_row > (this_page - 1)*10) && (this_page > 0))
            {
                start_number = (this_page - 1)*10;
            }
            else
            {
                start_number = 0;
            }
        }
    }
%>
<h1><% out.println(title); %></h1>
<% 
    if(total_row == 0) {
        out.println ("<p><i>Hasil pencarian tidak ada.</i></p>");
    } else { 
        sql += " LIMIT "+start_number+", 10;";
        query = mysql_query($sql, $this->__connection) or trigger_error(mysql_error(), E_USER_ERROR);
        while($barang = mysql_fetch_assoc($query)) {
    %>
<div class="table sresult" onSubmit="return addToShoppingChartBarang(this)">
    <div class="row">
        <span class="column"><img src="<% if($barang['image_url'] == "" || $barang['image_url'] == null) out.println(HOME_URL+"assets/image/default.png"); else out.println(HOME_URL+decodeURIComponent(barang['image_url'].replace(/\+/g, ' '))) %>" alt="Default" width="100" height="100"></span>
        <span class="column" style="vertical-align: top">
            <h3><a href="<% out.println(HOME_URL+"barang/"+$barang['barang_id']); %>"><% out.println($barang['nama']); %></a></h3>
            <p>Rp.<% out.println(NumberFormat.getInstance(Locale.GERMANY).format($barang['harga'])); %><br>
            <% out.println($barang['deskripsi']); %><br>
            <form onSubmit="return addToShoppingChart(this)"><span>Kuantitas: </span><input type="hidden" name="id_barang" value="<?php print $barang['barang_id']; ?>"><input type="text" name="qty" onKeyUp="validateQtyBarang(this)"> <input type="submit" value="+" disabled="disabled"></form></p>
        </span>
    </div>
</div>
<?php 
        }
        $sisa = $total_row % 10;
        $total_page = (($total_row - $sisa) / 10) + 1;
        print '<div align="center">Page';
        for($i = 1; $i <= $total_page; $i++) {
            if($i == $this_page) print ' - <b>'.$i.'</b>';
            else print ' - <a href="?query='.urlencode($_GET['query']).'&page='.$i.'">'.$i.'</a>';
        }
        print '</div>';
    }
%>