package kelas;


public class Barang {
	public int id_inven, id_cat, jumlah, harga;
	public String gambar, desc, nama;
	
	public Barang(String nm){
		nama = nm;
	}
	
	public String getNama(){
		return nama;
	}
}
