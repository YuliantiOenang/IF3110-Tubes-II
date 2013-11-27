package controller.barang;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Render;
import model.Barang;

@WebServlet("/barang/search")
public class search extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public search() {
        super();
        // TODO Auto-generated constructor stub
    }
	
	private Vector<HashMap<String,String>> data;
	private Barang barang;
	
	String q;
	String kat;
	String h1, h2;
	int hal;
	String sort;
	int total;
	String paging;
	private static final String[] sortby = new String[] {"nama asc", "nama desc", "harga asc", "harga desc"};
	String query;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		q = request.getParameter("q");
		kat = request.getParameter("kat") ;
		h1 = request.getParameter("h1");
		h2 = request.getParameter("h2");
		hal = Integer.parseInt(request.getParameter("hal"));
		sort = request.getParameter("sort");
		query = "q="+q+"&sort="+sort+"&kat="+kat+"&h1="+h1+"&h2="+h2;
		
		if(!Arrays.asList(sortby).contains(sort)) {
			sort = null;
		}
		barang = new Barang();
		barang.findByCondition("nama LIKE "+q+" and id_kategori="+kat+" and harga BETWEEN "+h1+" and "+h2);
		barang.formatAllCurrency();
		data = barang.getDataVector();
		total = data.size();
		paging = barang.paginasi(total,hal,10, query);
		request.setAttribute("title", "Search");
		request.setAttribute("model", data);
		request.setAttribute("paging", paging);
		Render.Show(request, response, "browse.jsp");

	}

}
