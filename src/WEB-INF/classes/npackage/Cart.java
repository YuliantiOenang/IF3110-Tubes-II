package npackage;
 
import java.util.ArrayList;
  
public class Cart{
	private ArrayList allCartItems = new ArrayList();
	private int hargaTotal ;
  
	public int getItemCount() {
		return allCartItems.size();
	}
	
	public void deleteCartItem(String index) {
		int itemIndex = 0;
		try {
			itemIndex = Integer.parseInt(index);
			allCartItems.remove(itemIndex - 1);
			calculateHargaTotal();
		}catch(NumberFormatException nfe) {
			System.out.println("Error while deleting cart item: "+nfe.getMessage());
			nfe.printStackTrace();
		}
	}
	
	public void updateCartItem(String strItemIndex, String strQuantity) {
		int jumHarga = 0;
		int harga = 0;
		int jumlah = 0;
		int index = 0;
		CartItem cartItem = null;
		try {
			index = Integer.parseInt(strItemIndex);
			jumlah = Integer.parseInt(strQuantity);
			if(jumlah>0) {
				cartItem = (CartItem)allCartItems.get(index-1);
				harga = cartItem.getHarga();
				jumHarga = harga*jumlah;
				cartItem.setJumlah(jumlah);
				cartItem.setJumHarga(jumHarga);
				calculateHargaTotal();
			}
		} catch (NumberFormatException nfe) {
			System.out.println("Error while updating cart: "+nfe.getMessage());
			nfe.printStackTrace();
		}
	
	}
	
	public void addCartItem(String nama, String strHarga, String kategori, String strQuantity, String detail) {
		int jumHarga = 0;
		int harga = 0;
		int jumlah = 0;
		CartItem cartItem = new CartItem();
		try {
			harga = Integer.parseInt(strHarga);
			jumlah = Integer.parseInt(strQuantity);
			if(jumlah>0) {
				jumHarga = harga*jumlah;
				cartItem.setNama(nama);
				cartItem.setHarga(harga);
				cartItem.setKategori(kategori);
				cartItem.setJumlah(jumlah);
				cartItem.setDetail(detail);
				cartItem.setJumHarga(jumHarga);
				allCartItems.add(cartItem);
				calculateHargaTotal();
			}
		} catch (NumberFormatException nfe) {
			System.out.println("Error while parsing from String to primitive types when adding item: "+nfe.getMessage());
			nfe.printStackTrace();
		}
	}
	
	public void addCartItem(CartItem cartItem) {
		allCartItems.add(cartItem);
	}
	
	public CartItem getCartItem(int index) {
		CartItem cartItem = null;
		if(allCartItems.size()>index) {
			cartItem = (CartItem) allCartItems.get(index);
		}
		return cartItem;
	}
	
	public ArrayList getCartItems() {
		return allCartItems;
	}
	public void setCartItems(ArrayList allCartItems) {
		allCartItems = allCartItems;
	}
	public int getHargaTotal() {
		return hargaTotal;
	}
	public void setHargaTotal(int hargaTotal) {
		hargaTotal = hargaTotal;
	}
	
	protected void calculateHargaTotal() {
		int hargaTotal = 0;
		for(int counter=0;counter<allCartItems.size();counter++){
			CartItem cartItem = (CartItem) allCartItems.get(counter);
			hargaTotal+=cartItem.getJumHarga();
		}
		setHargaTotal(hargaTotal);
	}
}