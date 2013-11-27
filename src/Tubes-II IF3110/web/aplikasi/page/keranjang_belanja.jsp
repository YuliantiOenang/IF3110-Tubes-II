<form id="shopping_bag" class="table sbtable">
    <div class="row thead">
        <span class="column">Gambar</span>
        <span class="column">Nama barang / Permintaan</span>
        <span class="column">Qty</span>
        <span class="column">Harga per Unit</span>
        <span class="column">Harga Total</span>
    </div>
    <?php if($keranjang != null) {
    foreach($keranjang['data'] as $barang) {
    ?>
    <div class="row tcontent">
        <span class="column"><img src="<%= if(barang['image_url'] == "" || barang['image_url'] == null) out.println(HOME_URL+"assets/image/default.png"); else out.println(HOME_URL+decodeURIComponent(barang['image_url'].replace(/\+/g, ' '))); %>" alt="<%= barang['nama'] %>" width="100" height="100"></span>
        <span class="column">
            <a href="<%= HOME_URL+"barang/"+barang['barang_id'] %>"><%= barang['nama'] %></a>
            <p><%= barang['deskripsi'] %></p><% if(barang['detail_tambahan'] != null) out.println("<p><b>Detail tambahan:</b> "+barang['detail_tambahan']+"</p>"); %>
        </span>
        <span class="column"><input type="text" name="qty_<%= barang['barang_id'] %>" value="<%= barang['qty'] %>"></span>
        <span class="column">Rp. <% out.println(NumberFormat.getInstance(Locale.GERMANY).format(barang['harga'])); %></span>
        <span class="column">Rp. <% out.println(NumberFormat.getInstance(Locale.GERMANY).format(barang['harga']*barang['qty'])); %></span>
    </div>
    <?php } ?>
    <div class="row">
        <span class="column"></span>
        <span class="column"></span>
        <span class="column"></span>
        <span class="column"></span>
        <span class="column">Total: Rp. <% out.println(NumberFormat.getInstance(Locale.GERMANY).format(keranjang['total'])); %><p><input type="button" value="Simpan" onClick="saveToShoppingBag()"><input type="button" value="Beli" onClick="checkIsCard()"></p></span>
    </div>
    <?php } else { ?>
    <p>Tidak ada barang di keranjang</p>
    <?php } ?>
</form>