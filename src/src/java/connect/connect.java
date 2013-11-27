/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author HP
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

public class connect {
    
    public Connection con;
    public Statement stat;
    public void dbopen() throws Exception{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/alat_pesta","root","");
            stat = con.createStatement();
        }catch(Exception ex){
            JOptionPane.showMessageDialog(null,ex,"error",JOptionPane.ERROR_MESSAGE);
        }
    }
}
