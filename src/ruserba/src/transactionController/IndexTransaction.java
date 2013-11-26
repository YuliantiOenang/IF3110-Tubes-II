package transactionController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javaModel.Barang;
import javaModel.Helper;
import javaModel.Kategori;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import databaseLib.DatabaseAdapter;

/**
 * Servlet implementation class Home
 */
@WebServlet("/cart")
public class IndexTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DatabaseAdapter DBA = new DatabaseAdapter();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexTransaction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		boolean isLogin;
		if (session.getAttribute("isLogin")!=null)
			isLogin = (boolean)session.getAttribute("isLogin");
		else
			isLogin = false;
		
		if (isLogin) {
			int total = 0;
			int ind = 1;
			
			if (session.getAttribute("dibeli")!=null) {
				ArrayList <String> array = (ArrayList<String>) session.getAttribute("dibeli");
				Kategori kategori = new Kategori(DBA);
				ind = 1;
				total = 0;
				for (String item : array) {
					if ((session.getAttribute(item)!=null) && (session.getAttribute(item) > 0)){
						Barang data = new Barang(DBA);
						$brg = $data->cari('nama=:n',array(':n'=>$item));
						echo "
						<div class='row'>
							<div class='list_body' id='no'><p>".$ind.".</p></div>
							<div class='list_body' id='item'><p><b>".$kategori->cari('id=:_id',array('_id'=>$brg->id_kategori))->nama_kategori." :</b><br/> &nbsp &nbsp &nbsp".$item."</p></div>
							<div class='list_body' id='price'><p>IDR ".$this->toCurrency($brg->harga)."</p></div>
							<div class='list_body' id='qty'><input id='quantity_".$brg->nama."' type='number' onkeyup='cekCart(\"".$brg->nama."\", ".$_SESSION[$item].")' value='".$_SESSION[$item]."'></input></div>
							<input type='hidden' id='id_barang_".$brg->nama."' value='".$brg->nama."'>
							<div class='list_body' id='subtotal'><p>IDR ".$this->toCurrency($brg->harga*$_SESSION[$item])."</p></div>
							<div class='list_body' id='remove'><a href='".$this->makeUrl("barang/delete/".$brg->id)."' title='Remove ".$item." from your Shopping Cart'>x</a></div>
						</div>
						";
						total += $brg->harga*$_SESSION[$item];
						ind++;
					}
				}
			} 
			request.setAttribute("total_shopping",total);

			
			request.setAttribute("includeJspContent", "shoppingcart.jsp");
			request.getRequestDispatcher("/view/layout.jsp").forward(request, response);	
		} else {
			response.sendRedirect("home");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
