package npackage;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
 
public class CartController extends HttpServlet {
  
 //public static final String addToCart

@Override 
public void doGet(HttpServletRequest request,
				  HttpServletResponse response)
	throws IOException, ServletException
{
	doPost(request, response);
}
 
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
   throws ServletException, IOException {
	
	try
	{
		String strAction = request.getParameter("action");
		
		if(strAction!=null && !strAction.equals("")) {
			if(strAction.equals("add")) {
				HttpSession session = request.getSession();
				String nama = request.getParameter("cartNama");
				System.out.print("nama"+nama);
				String strHarga = request.getParameter("cartHarga");
				String kategori = request.getParameter("cartKategori");
				String strQuantity = request.getParameter("cartQuantity");
				String detail = request.getParameter("cartDetail");
				
				Cart cart = null;
				
				Object objCart = session.getAttribute("cart");
				
				if(objCart!=null) {
					cart = (Cart) objCart ;
				} else {
					cart = new Cart();
					session.setAttribute("cart", cart);
				}
				
				cart.addCartItem(nama, strHarga, kategori, strQuantity, detail);
			} else if (strAction.equals("Update")) {
				updateCart(request);
			} else if (strAction.equals("Delete")) {
				deleteCart(request);
			}
		}
		response.sendRedirect("ShoppingBag.jsp");
	}
	catch (Throwable theException) 	    
	{
		 System.out.println(theException); 
	}
}
 
protected void deleteCart(HttpServletRequest request) {
	HttpSession session = request.getSession();
	String strItemIndex = request.getParameter("itemIndex");
	Cart cart = null;
	
	Object objCart = session.getAttribute("cart");
	if(objCart!=null) {
		cart = (Cart) objCart ;
	} else {
		cart = new Cart();
	}
	cart.deleteCartItem(strItemIndex);
}
 
protected void updateCart(HttpServletRequest request) {
	HttpSession session = request.getSession();
	String strQuantity = request.getParameter("quantity");
	String strItemIndex = request.getParameter("itemIndex");
	
	Cart cart = null;
	
	Object objCart = session.getAttribute("cart");
	if(objCart!=null) {
		cart = (Cart) objCart ;
	} else {
		cart = new Cart();
	}
	cart.updateCartItem(strItemIndex, strQuantity);
}
 
protected void addToCart(HttpServletRequest request, HttpServletResponse response) {
	HttpSession session = request.getSession();
	String nama = request.getParameter("cartNama");
	
	System.out.print("nama"+nama);
	String strHarga = request.getParameter("cartHarga");
	String kategori = request.getParameter("cartKategori");
	String strQuantity = request.getParameter("cartQuantity");
	String detail = request.getParameter("cartDetail");
	
	Cart cart = null;
	
	Object objCart = session.getAttribute("cart");
	
	if(objCart!=null) {
		cart = (Cart) objCart ;
	} else {
		cart = new Cart();
		session.setAttribute("cart", cart);
	}
	
	cart.addCartItem(nama, strHarga, kategori, strQuantity, detail);
}

}