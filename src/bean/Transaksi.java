package bean;

import java.util.ArrayList;

public class Transaksi {
	private Barang barang;
	private Integer quantity;
	private String reqTambahan;
	private ArrayList<String> card;

	public Transaksi(Barang barang, Integer quantity, String reqTambahan, ArrayList<String> card) {
		super();
		this.barang = barang;
		this.quantity = quantity;
		this.reqTambahan = reqTambahan;
		this.card = card;
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
	
	public void setCard(ArrayList<String> card) {
		this.card=card;
	}
	
	public ArrayList<String> getCard(){
		return this.card;
	}
}
