package com.ruserba.web;

import com.ruserba.model.Database;
 
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
 
public class DatabaseInit implements ServletContextListener {
 	
    public void contextInitialized(ServletContextEvent event) {
    	ServletContext sc = event.getServletContext();
 
    	String url = sc.getInitParameter("url");
    	String username = sc.getInitParameter("username");
    	String password = sc.getInitParameter("password");
    	String database = sc.getInitParameter("database");
    	Database db = new Database(url + database, username, password);
    	sc.setAttribute("db", db);
     }
 
    public void contextDestroyed(ServletContextEvent arg0) {

    }
 
}
