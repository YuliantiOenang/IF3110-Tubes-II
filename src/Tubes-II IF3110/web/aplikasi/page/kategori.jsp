<%@page import="java.text.NumberFormat"%>
<%! public static String HOME_URL = "http://localhost/tugas_web2/"; %>
<div class="kategori">
    <h1><%= kategori['nama_kategori'] %></h1>
    <p>
        <a class="sorting" href="?by=nama&amp;sort=asc&amp;page=1">Sorting By Name Ascending</a>
        <a class="sorting" href="?by=nama&amp;sort=desc&amp;page=1">Sorting By Name Descending</a>
        <a class="sorting" href="?by=harga&amp;sort=asc&amp;page=1">Sorting By Price Ascending</a>
        <a class="sorting" href="?by=harga&amp;sort=desc&amp;page=1">Sorting By Price Descending</a>
    </p>
	<p>
		<% Object size= page_no; %>
		<% for (i = 1; i <= size;i++) {%>
			<% 
				String uri = "?page="+i;
				if (filter == true) uri = "?by=nama&amp;sort=desc&amp;page="+i;
			
			%>
			<a class="sorting" href="<%= uri %>"><%= i %></a>
		<% } %>
	</p>
    <?php foreach($kategori['data'] as $barang) { ?>
    <div class="box_barang">
        <img class="gambar_barang" src="<% if(barang['image_url'] == "" || barang['image_url'] == null) out.println(HOME_URL+"assets/image/default.png"); else out.println(HOME_URL+decodeURIComponent(barang['image_url'].replace(/\+/g, ' ')); %>" alt="<%= barang['nama'] %>" height="100" width="100">
        <a href="<%= HOME_URL+"barang/"+barang['barang_id'] %>"><%= barang['nama'] %></a>
        <span class="harga">Rp.<% out.println(NumberFormat.getInstance(Locale.GERMANY).format(barang['harga'])); %></span>
        <form onSubmit="return addToShoppingChart(this)"><input type="hidden" name="id_barang" value="<%= barang['barang_id'] %>"><input type="text" name="qty" onKeyUp="validateQty(this)"><input type="submit" value="+" disabled="disabled"></form>
    </div>
    <?php } ?>
</div>