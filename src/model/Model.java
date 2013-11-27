package model;

import java.util.*;
import java.sql.*;

public class Model
{
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost:3306/ruserba";

	//  Database credentials
	static final String USER = "root";
	static final String PASS = "";
	
	private Vector<HashMap<String,String>> data;
	
	private String tabelname;
	
	public Model(String tabel)
	{
		data = new Vector<HashMap<String,String>>();
		
		tabelname = tabel;
	}
	
	public Vector<HashMap<String,String>> findAll()
	{
		execute("SELECT * FROM '" + tabelname +"'");
		return getDataVector();
	}
	
	public Vector<HashMap<String,String>> findByCondition(String cond)
	{
		execute("SELECT * FROM `" + tabelname + "` WHERE " + cond);
		return getDataVector();
	}
	
	public HashMap<String,String> findById(int id)
	{
		findByCondition("id = " + id);
		return getDataVector().firstElement();
	}
	
	public Vector<HashMap<String,String>> executeSQL(String sql)
	{
		execute(sql);
		return getDataVector();
	}
	
	public Vector<HashMap<String,String>> updateSQL(String sql)
	{
		update(sql);
		return getDataVector();
	}
	
	protected void update(String sql){
		java.sql.Connection con;
		java.sql.Statement stmt;
		ResultSet rs;
		ResultSetMetaData rsmd;
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			
			 // Open a connection
			con = DriverManager.getConnection(DB_URL, USER, PASS);
			 
			// Execute a query
			stmt = con.createStatement();
			stmt.executeUpdate(sql);
			
			System.out.println("Data updated");
			
			// Clean-up environment
			stmt.close();
			con.close();
			
		} catch(SQLException e) {
			System.out.println("SQL Error.");
			e.printStackTrace();
		} catch (ClassNotFoundException cnfex) {
			System.out.println("com.mysql.Driver class not found.");
			cnfex.printStackTrace();
		}
	}
	
	protected void execute(String sql)
	{
		java.sql.Connection con;
		java.sql.Statement stmt;
		ResultSet rs;
		ResultSetMetaData rsmd;
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			
			 // Open a connection
			con = DriverManager.getConnection(DB_URL, USER, PASS);
			 
			// Execute a query
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			
			//Extract data from result set
			data.clear();
			while(rs.next()){
				HashMap<String,String> hasm = new HashMap<String,String>();
				for (int i = 1;i<=rsmd.getColumnCount();i++) {
					hasm.put(rsmd.getColumnName(i), rs.getString(i));
				}
				data.add(hasm);
		    }
			
			// Clean-up environment
			rs.close();
			stmt.close();
			con.close();
			
		} catch(SQLException e) {
			System.out.println("SQL Error.");
			e.printStackTrace();
		} catch (ClassNotFoundException cnfex) {
			System.out.println("com.mysql.Driver class not found.");
			cnfex.printStackTrace();
		}
	}
	
	public Vector<HashMap<String,String>> getDataVector() {
		return data;
	}
	public int getDataCount() {
		return data.size();
	}
	public HashMap<String,String> getData(int idx) {
		if (idx<getDataCount())
			return data.elementAt(idx);
		else
			return null;
	}
	public String getDataColumn(int idx,String column) {
		return getData(idx).get(column);
	}
	public void newRecord(){
		data.clear();
		data.add(new HashMap<String,String>());
	}
	public void addValue(String column, String value){
		if (data.size()!=1)
		{
			data.clear();
			data.add(new HashMap<String,String>());
		}
		data.firstElement().put(column, value);
	}
	public void save(){
		java.sql.Connection con;
		java.sql.Statement stmt;
		ResultSet rs;
		ResultSetMetaData rsmd;
		String sql;
		
		// Generate Query
		sql = "INSERT INTO `" + tabelname + "` (";
		boolean first = true;
		for (String key : data.firstElement().keySet())
		{
			if (first) first = false;else sql = sql + ",";
			sql = sql + "`" + key + "`";
		}
		sql = sql + ") VALUES (";
		first = false;
		for (String key : data.firstElement().keySet())
		{
			if (first) first = false; else sql = sql + ",";
			sql = sql + "'" + data.firstElement().get(key) + "'";
		}
		sql = sql + ");";
		
		try{
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver");
			
			 // Open a connection
			con = DriverManager.getConnection(DB_URL, USER, PASS);
			 
			// Execute a query
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			rsmd = rs.getMetaData();
			
			//Extract data from result set
			data.clear();
			while(rs.next()){
				HashMap<String,String> hasm = new HashMap<String,String>();
				for (int i = 1;i<=rsmd.getColumnCount();i++)
					hasm.put(rsmd.getCatalogName(i), rs.getString(i));
				data.add(hasm);
		    }
			
			// Clean-up environment
			rs.close();
			stmt.close();
			con.close();
			
		} catch(SQLException e) {
			System.out.println("SQL Error.");
			e.printStackTrace();
		} catch (ClassNotFoundException cnfex) {
			System.out.println("org.gjt.mm.mysql.Driver class not found.");
			cnfex.printStackTrace();
		}
	}
	
	public static String rupiahFormatter(String raw)
	{
		int nchar = raw.length();
		String rp = "";
		for (int i = nchar-1;i>=0;i--)
		{
			rp = raw.charAt(i) + rp;
			if (((nchar-i)%3==0)&&(i!=0))
				rp = "." + rp;
		}
		return rp;
	}
}
