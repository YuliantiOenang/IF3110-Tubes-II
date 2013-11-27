package javaModel;

import javax.servlet.http.HttpSession;

import databaseLib.DatabaseAdapter;

public class Helper {
	static DatabaseAdapter DBA = new DatabaseAdapter();
	public Helper() {
		
	}
	public static Kategori findAllKategori() {
		String Query = "select * from kategori";
		Kategori K = new Kategori(DBA);
		K.executeQuery(Query);
		return K;
	}
	public static String getUserLogged(HttpSession session) {
		if (session.getAttribute("isLogin")!=null) {
			if (Boolean.parseBoolean(session.getAttribute("isLogin").toString())) {
				return (String)session.getAttribute("username");
			}
		}
		return "";
	}
}
