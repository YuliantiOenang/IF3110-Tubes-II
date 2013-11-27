package ingsmusic.servlets;

import java.io.PrintWriter;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ingsmusic.jsp.*;
/**
 * Servlet implementation class registration
 */
@WebServlet(description = "servlet product", urlPatterns = { "/product" })
public class product extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO Auto-generated method stub
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		String query = "SELECT * FROM `product` WHERE `product_id` = " + request.getParameter("id");

		ResultSet rs = mysql.send(query);
		String json = "";

		try {
			rs.next();
			json = "{name:" + rs.getString("name") + "}";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			json = "{status:0, message:'product not found', data:null}";
		}

		mysql.close(rs);

		//out.println("<h1>Hello World from GET method</h1>");
  
		out.print(json);
		out.flush();
	}
}
