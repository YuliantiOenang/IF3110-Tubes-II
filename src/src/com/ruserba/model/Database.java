package com.ruserba.model;
 
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;

import java.util.ArrayList;
 
public class Database {
 
	private Connection conn = null;
 
	public Database(String url, String user_name, String password)
	{
		try {
			Class.forName("com.mysql.jdbc.Driver");
 			this.conn = DriverManager.getConnection(url, user_name, password);
 		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
 
	// Untuk custom query.
	public Connection getConnection()
	{
		return this.conn;
	}
 
	// Untuk custom query.
	// Not recommended. Sebaiknya menggunakan getConnection() + prepared statement.
	public ResultSet runQuery(String sql) throws SQLException
	{
		Statement sta = conn.createStatement();
		return sta.executeQuery(sql);
	}

	// Mengambil seluruh data produk.
	public Product getProductData(int product_id) throws SQLException
	{
		PreparedStatement stat = getConnection().prepareStatement("select * from barang where id_barang=?");
		stat.setInt(1, product_id);
		ResultSet res = stat.executeQuery();

		// Id produk tidak ditemukan.
		if (!res.next()) return null;

		// Dikuli... Semoga nggak ada typo... :p
		Product prod = new Product();
		prod.setIdBarang(res.getInt("id_barang"));
		prod.setIdKategori(res.getInt("id_kategori"));
		prod.setHarga(res.getInt("harga"));
		prod.setJumlahPembelian(res.getInt("jumlah_pembelian"));
		prod.setJumlahStok(res.getInt("jumlah_stok"));
		prod.setNamaBarang(res.getString("nama_barang"));
		prod.setSatuan(res.getString("satuan"));
		prod.setDeskripsi(res.getString("deskripsi"));
		prod.setNamaGambar(res.getString("nama_gambar"));
		prod.setNamaGambarThumb(res.getString("nama_gambar_thumb"));

		return prod;
	}

	private User getUserDataFromResultSet(ResultSet res) throws SQLException	{
		// Id produk tidak ditemukan.
		if (!res.next()) return null;

		// Dikuli... Lagi...
		User user = new User();
		user.setIdUser(res.getInt("id_user"));
		user.setUsername(res.getString("username"));
		user.setEmail(res.getString("email"));
		user.setPassword(res.getString("password"));
		user.setNamaLengkap(res.getString("nama_lengkap"));
		user.setProvinsi(res.getString("provinsi"));
		user.setKota(res.getString("kota"));
		user.setAlamat(res.getString("alamat"));
		user.setKodePos(res.getString("kode_pos"));
		user.setKontak(res.getString("kontak"));
		user.setNomorKartu(res.getString("nomor_kartu"));
		user.setNamaKartu(res.getString("nama_kartu"));
		user.setEkspirasiKartu(res.getString("ekspirasi_kartu"));

		return user;
	}

	public User getUserData(int user_id) throws SQLException
	{
		PreparedStatement stat = getConnection().prepareStatement("select * from user where id_user=?");
		stat.setInt(1, user_id);
		ResultSet res = stat.executeQuery();

		return getUserDataFromResultSet(res);
	}

	public User getUserDataFromUsername(String username) throws SQLException
	{
		PreparedStatement stat = getConnection().prepareStatement("select * from user where username=?");
		stat.setString(1, username);
		ResultSet res = stat.executeQuery();

		return getUserDataFromResultSet(res);
	}

	public Category getCategoryData(int category_id) throws SQLException
	{
		PreparedStatement stat = getConnection().prepareStatement("select * from kategori where id_kategori=?");
		stat.setInt(1, category_id);
		ResultSet res = stat.executeQuery();

		// Id produk tidak ditemukan.
		if (!res.next()) return null;

		// Dikuli... Lagi...
		Category cat = new Category();
		cat.setIdKategori(res.getInt("id_kategori"));
		cat.setNamaKategori(res.getString("nama_kategori"));

		return cat;
	}

	public ArrayList<String> getCategoryList() throws SQLException
	{
		PreparedStatement stat = getConnection().prepareStatement("select nama_kategori from kategori");
		ResultSet res = stat.executeQuery();

		ArrayList<String> lst = new ArrayList<String>();
		while (res.next())
		{
			lst.add(res.getString("nama_kategori"));
		}
		return lst;
	}

}
