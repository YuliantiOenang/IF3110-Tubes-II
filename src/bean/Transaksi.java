package bean;

public class Transaksi {
	private Barang barang;
	private Integer quantity;
	private String reqTambahan;

	public Transaksi(Barang barang, Integer quantity, String reqTambahan) {
		super();
		this.barang = barang;
		this.quantity = quantity;
		this.reqTambahan = reqTambahan;
	}

	public Barang getBarang() {
		return barang;
	}

	public void setBarang(Barang barang) {
		this.barang = barang;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getReqTambahan() {
		return reqTambahan;
	}

	public void setReqTambahan(String reqTambahan) {
		this.reqTambahan = reqTambahan;
	}
}
