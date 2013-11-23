package barangController;

import java.io.IOException;
import java.io.PrintWriter;

import javaModel.Barang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import databaseLib.DatabaseAdapter;

import org.json.JSONObject;
/**
 * Servlet implementation class IndexBarang
 */
@WebServlet("/barang")
//Digabung langsung dengan search disini.
//Index barang artinya adalah search tanpa parameter
public class IndexBarang extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private DatabaseAdapter DBA;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexBarang() {
        super();
        DBA = new DatabaseAdapter();
        // TODO Auto-generated constructor stub
    }

    private String genQuery(HttpServletRequest request)
    {
    	String Query = "select barang.id, barang.nama, barang.harga, " +
				"barang.gambar, barang.stok, kategori.nama_kategori, kategori.gambar from barang" +
				" join kategori on barang.id_kategori = kategori.id";
		
		/* Berdasarkan nama */
		String nameSearch = request.getParameter("search");
		if ((nameSearch != null) && (!nameSearch.equals("")))
		{
			Query = Query + " AND barang.nama LIKE '%"+nameSearch+"%' ";
		}
		
		/* Berdasarkan kategori */
		String kategori = request.getParameter("kategori");
		if ((kategori != null) && (!kategori.equals("")))
		{
			Query = Query + " AND kategori.nama_kategori LIKE '%"+kategori+"%' ";
		}
		
		/* Berdasarkan harga */
		String harga = request.getParameter("harga");
		String operator = request.getParameter("operator");
		
		if ((harga != null) && (operator != null) && (!harga.equals("")) && (!operator.equals("")))
		{
			if (operator.equals("L"))
				Query = Query + " AND barang.harga < " + harga + " ";
			else if (operator.equals("E"))
				Query = Query + " AND barang.harga = " + harga + " ";
			else if (operator.equals("G"))
				Query = Query + " AND barang.harga > " + harga + " ";
		}
		/* Sorting */
		String sort = request.getParameter("sort");
		String JenisSort = request.getParameter("jenisSort");
		if ((sort != null) && (JenisSort != null))
		{
			if (sort.equals("nama")) Query = Query + " order by barang.nama ";
			else if (sort.equals("kategori")) Query = Query + " order by kategori.nama_kategori ";
			else if (sort.equals("harga")) Query = Query + " order by barang.harga ";
			
			Query = Query + " "+JenisSort;
		}
    	return Query;
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String page = request.getParameter("page");
		if (page != null)
		{
			try
			{
				Barang B2 = new Barang(DBA);
				B2.executeQuery("select * from barang");
				int jmlData = B2.nama.size();
				System.out.println(jmlData);
				
				//HTTP/1.1 200 OK Content-Type
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				//header harus diset
				PrintWriter out = response.getWriter();
				Integer limit = Integer.parseInt(page) * 10;
				Integer offset = limit - 10;
				String Query = genQuery(request);
				Query = Query + " LIMIT "+offset+",10 ";

				Barang B = new Barang(DBA);
				B.executeQuery(Query);
				System.out.println(Query);
				
				int size = B.nama.size();
				int i;
				String str="";
				for (i=0;i<size;i++)
				{
					str = str + "<tr>";
					str = str + "<td>" + B.nama.get(i)+ "</td>";
					str = str + "<td>" + B.harga.get(i) + "</td>";
					str = str + "<td>" + "<img src='/ruserba/images/barang/"+B.gambar.get(i)+"' width='100' height='100'>" + "</td>";
					str = str + "<td>" + B.stok.get(i) + "</td>";
					str = str + "</tr>";
				}
				JSONObject json = new JSONObject();
				json.put("content",str);
				json.put("pageOf",page);
				json.put("jmlPage", jmlData/10);
				out.write(json.toString());
				out.close();
			}catch (Exception e){}
		}
		else
		{
			request.getRequestDispatcher("/view/Barang.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
