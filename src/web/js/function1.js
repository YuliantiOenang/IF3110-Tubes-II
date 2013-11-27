/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

function cekJumlah()
{
	//mengambil semua variable dalam form login
	var id_keranjang = document.getElementById('idKeranjang').value;	
	
	var idBarang = document.getElementById('idBarang').value;	
	

	var jumlah = document.getElementById('jumlahBarang').value;
	//request ke file php
	http.open('get', 'changeJumlah.jsp?id='+id_keranjang+'&jumlah='+jumlah+"&idBarang="+idBarang,true);
	//cek hasil request 4 jika berhasil
	http.onreadystatechange = function()
	  {
		
		if (http.readyState==4 && http.status==200)
		{
			try
			{
			
			var decodeJSON = JSON.parse(http.responseText);
			
			alert("Maaf barang yang ada di stok tidak cukup.\n jumlah stok "+http.responseText);
			}
			catch(e)
			{
			alert("Berhasil mengganti transaksi.");
			}
		}
	  }
	http.send(); 
	
	
}
