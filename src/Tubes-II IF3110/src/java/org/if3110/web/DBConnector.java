/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.if3110.web;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Setyo Legowo <setyo.legowo@live.com>
 */
public class DBConnector {
    private static DBConnector connector_ = null;
    public static DBConnector getInstance()
            throws Exception {
        if(connector_ == null) {
            connector_ = new DBConnector();
        }
        return connector_;
    }
    public Connection getConnection()
            throws Exception {
        // Get DataSource
        Context ctx = new InitialContext();
        DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/DB");
        Connection c = ds.getConnection();
        return c;
    }
}
