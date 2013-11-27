package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.ItemTransaksi;


@WebServlet("/addcart")
public class addcart extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public addcart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		ArrayList<ItemTransaksi> IT = new ArrayList<ItemTransaksi>();
		int qt = Integer.parseInt(request.getParameter("qt"));
		String id_barang = request.getParameter("id_barang");
		String request_tambahan = request.getParameter("request_tambahan");
		ItemTransaksi temp = new ItemTransaksi(qt, id_barang,
				request_tambahan);
		IT.add(temp);
		session.setAttribute("IT", IT);
		ArrayList<ItemTransaksi> req = (ArrayList<ItemTransaksi>) session.getAttribute("IT");
		System.out.println(req.get(0).getRequest_tambahan());
		response.sendRedirect("");
		System.out.print("masukkkk");
	}

}
