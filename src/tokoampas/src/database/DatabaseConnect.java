package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseConnect {
  private Connection connect = null;
  private Statement statement = null;
  private ResultSet resultSet = null;

  public void readDataBase() throws Exception {
    try {
      // This will load the MySQL driver, each DB has its own driver
      String url = "jdbc:mysql://localhost:3306/";
      String dbName = "tubes2_wbd";
      String driver = "com.mysql.jdbc.Driver";
      String userName = "root";
      String password = "";
      Class.forName(driver);
      // Setup the connection with the DB
      connect = DriverManager.getConnection(url+dbName
             ,userName,password);

    } 
    catch (Exception e) {
    	throw e;
    } 
    finally {
      close();
    }
    
    

  }
  
	public void executeQuery(String Query)
	{
		try
		{
			statement = connect.createStatement();
	  	  	resultSet = statement.executeQuery(Query);
		}catch (SQLException e){System.out.println("Error : "+e.getMessage());}
	}
	
	public void insertQuery(String Query)
	{
		try
		{
			statement = connect.createStatement();
	  	  	statement.execute(Query);
		}catch (SQLException e){System.out.println("Error : "+e.getMessage());}
	}
	
	public void deleteQuery(String Query)
	{
		try {
			statement = connect.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			statement.execute(Query);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ResultSet getQueryResult(){
		if (resultSet == null)
		{
			System.out.println("???");
			return null;
		}
		else
			return resultSet;
	}

  // You need to close the resultSet
  private void close() {
    try {
      if (resultSet != null) {
        resultSet.close();
      }

      if (statement != null) {
        statement.close();
      }

      if (connect != null) {
        connect.close();
      }
    } catch (Exception e) {

    }
  }

} 