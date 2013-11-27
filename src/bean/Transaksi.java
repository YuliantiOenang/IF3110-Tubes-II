package bean;

import java.util.ArrayList;

public class Transaksi {
	private Barang barang;
	private Integer qt;
	private String request_tambahan;

	public Transaksi(Barang barang, Integer qt, String request_tambahan) {
		super();
		this.barang = barang;
		this.qt = qt;
		this.request_tambahan = request_tambahan;
	}

	public Barang getBarang() {
		return barang;
	}

	public void setBarang(Barang barang) {
		this.barang = barang;
	}

	public Integer getQt() {
		return qt;
	}

	public void setQt(Integer qt) {
		this.qt = qt;
	}

	public String getRequest_tambahan() {
		return request_tambahan;
	}

	public void setRequest_tambahan(String request_tambahan) {
		this.request_tambahan = request_tambahan;
	}

}
