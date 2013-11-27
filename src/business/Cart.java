package business;

import java.util.*;

public class Cart {
	private HashMap<Product, Integer> cart;
	
	public Cart() {
		cart = new HashMap<Product, Integer> ();
	}
	
	public HashMap<Product, Integer> getCart() {
		return cart;
	}
	
	public void addProduct(Product product, int quantity) {
		if(cart.containsKey(product.getNama())) {
			cart.put(product, cart.get(product) + quantity);
		} else {
			cart.put(product, quantity);
		}
	}
	
	public void deleteProduct(Product product) {
		cart.remove(product);
	}
	
	public void changeQuantity(Product product, int quantity) {
		cart.put(product, quantity);
	}
	
	public void emptyCart() {
		cart.clear();
	}
	
	public boolean isEmpty() {
		return cart.isEmpty();
	}
}
