package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Barang {
	private String id_barang;
	private String nama_barang;
	private String gambar_barang;
	private int harga_barang;
	private int kategori_barang;
	private int n_beli;
	private String keterangan;
	private int stok;

	public Barang(ResultSet rs) throws SQLException {
		id_barang = rs.getObject(1).toString();
		nama_barang = rs.getObject(2).toString();
		gambar_barang = rs.getObject(3).toString();
		harga_barang = Integer.parseInt(rs.getObject(4).toString());
		kategori_barang = Integer.parseInt(rs.getObject(5).toString());
		n_beli = Integer.parseInt(rs.getObject(6).toString());
		keterangan = rs.getObject(7).toString();
		stok = Integer.parseInt(rs.getObject(8).toString());
	}

	public String getId_barang() {
		return id_barang;
	}

	public void setId_barang(String id_barang) {
		this.id_barang = id_barang;
	}

	public String getNama_barang() {
		return nama_barang;
	}

	public void setNama_barang(String nama_barang) {
		this.nama_barang = nama_barang;
	}

	public String getGambar_barang() {
		return gambar_barang;
	}

	public void setGambar_barang(String gambar_barang) {
		this.gambar_barang = gambar_barang;
	}

	public int getHarga_barang() {
		return harga_barang;
	}

	public void setHarga_barang(int harga_barang) {
		this.harga_barang = harga_barang;
	}

	public int getKategori_barang() {
		return kategori_barang;
	}

	public void setKategori_barang(int kateori_barang) {
		this.kategori_barang = kateori_barang;
	}

	public int getN_beli() {
		return n_beli;
	}

	public void setN_beli(int n_beli) {
		this.n_beli = n_beli;
	}

	public String getKeterangan() {
		return keterangan;
	}

	public void setKeterangan(String keterangan) {
		this.keterangan = keterangan;
	}

	public int getStok() {
		return stok;
	}

	public void setStok(int stok) {
		this.stok = stok;
	}
}
