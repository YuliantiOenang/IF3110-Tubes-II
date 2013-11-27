package business;

public class Product {
	private int id;
	private String nama;
	private String gambar;
	private String kategori;
	private int harga;
	private int jumlah;
	private String keterangan;
	private int terjual;
	
	public Product() { }
	public Product(int id, String nama, String gambar, String kategori, int harga, 
			int jumlah, String keterangan, int terjual) {
		this.id = id;
		this.nama = nama;
		this.gambar = gambar;
		this.kategori = kategori;
		this.harga = harga;
		this.jumlah = jumlah;
		this.keterangan = keterangan;
		this.terjual = terjual;
	}
	
	public int getID() {
		return id;
	}
	
	public String getNama() {
		return nama;
	}
	
	public String getKategori() {
		return kategori;
	}
	
	public int getHarga() {
		return harga;
	}
	
	public String getGambar() {
		return gambar;
	}
	
	public int getJumlah() {
		return jumlah;
	}
	
	public String getKeterangan() {
		return keterangan;
	}
	
	public int getTerjual() {
		return terjual;
	}
	
	public void setNama(String nama) {
		this.nama = nama;
	}
	
	public void setGambar(String gambar) {
		this.gambar = gambar;
	}
	
	public void setHarga(int harga) {
		this.harga = harga;
	}
	
	public void setKategori(String kategori) {
		this.kategori = kategori;
	}
	
	public void setKeterangan(String keterangan) {
		this.keterangan = keterangan;
	}
	
	public void setID(int id) {
		this.id = id;
	}
	
	public void setTerjual(int terjual) {
		this.terjual = terjual;
	}
}
