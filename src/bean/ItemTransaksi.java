package bean;

public class ItemTransaksi {
	private int qt;
	private String id_barang;
	private String request_tambahan;

	public ItemTransaksi(int qt, String id_barang, String request_tambahan) {
		super();
		this.qt = qt;
		this.id_barang = id_barang;
		this.request_tambahan = request_tambahan;
	}

	public int getQt() {
		return qt;
	}

	public void setQt(int qt) {
		this.qt = qt;
	}

	public String getId_barang() {
		return id_barang;
	}

	public void setId_barang(String id_barang) {
		this.id_barang = id_barang;
	}

	public String getRequest_tambahan() {
		return request_tambahan;
	}

	public void setRequest_tambahan(String request_tambahan) {
		this.request_tambahan = request_tambahan;
	}
}
