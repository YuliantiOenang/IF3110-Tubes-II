package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.net.httpserver.Filter;
import com.sun.net.httpserver.Filter.Chain;

public class Render {
	
	private Render() {}
	
	public static void Show(HttpServletRequest request, HttpServletResponse response, String jsp)
	{
		preRender(request,response);
		RequestDispatcher view = request.getRequestDispatcher(jsp);
		try {
			request.setCharacterEncoding("utf8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        response.setContentType("text/html");
	    try {
			view.forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}
	
	private static void preRender(HttpServletRequest request, HttpServletResponse response)
	{
		setLogin(request,response);
	}
	
	private static void setLogin(HttpServletRequest request, HttpServletResponse response)
	{
		String userid = null;
		Cookie[] cookies_arr = null;
		cookies_arr = request.getCookies();
		if( cookies_arr != null ){
			for (int i = 0; i < cookies_arr.length; i++){
				if (cookies_arr[i].getName().compareTo("accessid")==0)
					userid = cookies_arr[i].getValue();
			}
		}
		request.setAttribute("_pre_userid", userid);   
	}
}
