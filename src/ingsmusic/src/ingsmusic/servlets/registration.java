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
@WebServlet(description = "servlet registrasi", urlPatterns = { "/registration" })
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//TODO Auto-generated method stub
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		String query = "SELECT `name` FROM `account` WHERE `account_id` = 1";

		ResultSet rs = mysql.send(query);
		String s = "";

		try {
			rs.next();
			s = "{name:" + rs.getString("name") + "}";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mysql.close(rs);

		//out.println("<h1>Hello World from GET method</h1>");
  
		out.print(s);
		out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		String name = request.getParameter("name");
		String email_address = request.getParameter("email_address");
		String password = request.getParameter("password");
		String registration_date = request.getParameter("registration_date");
		String birthday_date = request.getParameter("birthday_date");
		String gender = request.getParameter("gender");
		String address_line1 = request.getParameter("address_line1");
		String address_line2 = request.getParameter("address_line2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String postal_code = request.getParameter("postal_code");
		String country = request.getParameter("country");
		String phone_number = request.getParameter("phone_number");
		String credit_card_holder = request.getParameter("credit_card_holder");
		String card_type = request.getParameter("card_type");
		String card_number = request.getParameter("card_number");
		String card_security_code = request.getParameter("card_security_code");
		String card_expiration_date = request.getParameter("card_expiration_date");
		String shopperpoint = request.getParameter("shopperpoint");
		
		String query =	"INSERT INTO account "
						+ "(name, email_address, password, registration_date, birthday_date, gender, address_line1,"
						+ " address_line2, city, state, postal_code, country, phone_number, credit_card_holder,"
						+ " card_type, card_number, card_security_code, card_expiration_date, shopperpoint)"
						+ "VALUES"
						+ "(" + name + ", " + email_address + ", " + password + ", " + registration_date + ", "
						+ birthday_date + ", " + gender + ", " + address_line1 + ", " + address_line2 + ", " + city + ", "
						+ state + ", " + postal_code + ", " + country + ", " + phone_number + ", " + credit_card_holder + ", "
						+ card_type + ", " + card_number + ", " + card_security_code + ", " + card_expiration_date + ", "
						+ shopperpoint + ");";

		mysql.send(query);
	}

}
