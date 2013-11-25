package javaModel;

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
}
