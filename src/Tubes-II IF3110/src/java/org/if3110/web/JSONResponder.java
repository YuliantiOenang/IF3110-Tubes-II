/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.if3110.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Setyo Legowo <setyo.legowo@live.com>
 */
public class JSONResponder extends HttpServlet {
    /**
     *
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    @Override
    public void doPost(HttpServletRequest request, 
                      HttpServletResponse response) 
                      throws IOException, ServletException {
        String _do = null;
        String data = null;
        String output = null;
        String input_json = request.getParameter("data");
        try {
            JSONObject json = new JSONObject(input_json);
            _do = json.getString("todo");
            data = json.getJSONObject("data").toString();
        } catch (JSONException ex) {
            Logger.getLogger(JSONResponder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        try {
            if(_do == null) {
                out.println("<h1>Something wrong</h1>Look for data:<br>" + data);
            } else if(_do.equalsIgnoreCase("subkategori")){
                output = subkategori();
                out.print(output);
            } else if(_do.equalsIgnoreCase("searching")) {
                out.print(searching());
            } else if(_do.equalsIgnoreCase("login")) {
                out.print(login(data));
            } else if(_do.equalsIgnoreCase("pendaftaran")) {

            } else if(_do.equalsIgnoreCase("submitPendaftaran")) {

            } else if(_do.equalsIgnoreCase("getIdentity")) {

            } else if(_do.equalsIgnoreCase("changeIdentity")) {

            } else if(_do.equalsIgnoreCase("addToShoppingBag")) {

            } else if(_do.equalsIgnoreCase("saveToShoppingBag")) {

            } else if(_do.equalsIgnoreCase("checkCreditCardNumber")) {

            } else if(_do.equalsIgnoreCase("checkCard")) {

            }
        } catch (Exception ex) {
            Logger.getLogger(JSONResponder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public boolean is_valid_luhn(String number)
    {
        int[][] sumTable = {
            {0,1,2,3,4,5,6,7,8,9},
            {0,2,4,6,8,1,3,5,7,9}
        };
        int sum = 0;
        int flip = 0;
        for(int i = number.length() - 1; i >= 0; i--)
        {
            sum += sumTable[flip++ & 0x1][number.charAt(i) - '0'];
        }
        return sum % 10 == 0;
    }
    
    public String subkategori() throws Exception
    {
        ArrayList<String> data = new ArrayList<String>();
        JSONObject status;
        DBConnector dbCon = DBConnector.getInstance();
        Connection con = dbCon.getConnection();
        Statement st = con.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM barang_kategori;");
        if(res.next()) {
            status = new JSONObject().put("status", "success");
            do {
                data.add(res.getString("nama"));
            } while(res.next());
            status.put("data", data);
        } else {
            status = new JSONObject().put("status", "failed");
            status.put("data", "Tidak ada kategori didalam basis data.");
        }
        
        con.close();
        return status.toString();
    }
    
    public String searching() throws Exception
    {
        JSONObject json = new JSONObject().put("data", "Waw, nyampe");
        return json.toString();
    }
    
    public String login(String param) throws Exception
    {
        JSONObject data;
        JSONObject data_data;
        JSONArray param_array = new JSONArray(param);
        JSONObject param_array2 = param_array.getJSONObject(0);
        String username = param_array2.getString("nama_pengguna");
        String password = param_array2.getString("kata_sandi");
        Authentication ologin = new Authentication(username, password);
        if(ologin.CheckResultLogin())
        {
            ArrayList<String> ari = ologin.getNameUser();
            data = new JSONObject().put("status", "success");
            data_data = new JSONObject().put("nama_lengkap", ari.get(0));
            data_data.put("email", ari.get(1));
            data_data.put("user_id", ologin.getUserID());
            data.put("data", data_data);
        } else {
            data = new JSONObject().put("status", "failed");
        }
        return data.toString();
    }
    
    public String pendaftaran(String param) throws Exception
    {
        String sql = null;
        JSONObject json_result;
        JSONArray param_array = new JSONArray(param);
        JSONObject param_array2 = param_array.getJSONObject(0);
        if("username".equals(param_array2.getString("check_field")))
        {
            sql = "SELECT nama_pengguna FROM __user_login "
                    + "WHERE nama_pengguna = '" + 
                    param_array2.getString("value") + "'";
        } else if("email".equals(param_array2.getString("check_field")))
        {
            sql = "SELECT email FROM pelanggan_id WHERE email = '" +
                    param_array2.getString("value") + "'";
        }
        
        DBConnector dbCon = DBConnector.getInstance();
        Connection con = dbCon.getConnection();
        Statement st = con.createStatement();
        ResultSet res = st.executeQuery(sql);
        if(!res.next()) 
        {
            json_result = new JSONObject().put("status", "valid");
            json_result.put("data", "");
        } else {
            json_result = new JSONObject().put("status", "invalid");
            json_result.put("data", "Ada dalam basis data");
        }
        con.close();
        return json_result.toString();
    }
    
    public String submitPendaftaran(String param) throws Exception
    {
        JSONObject json_result = new JSONObject();
        JSONArray param_array = new JSONArray(param);
        JSONObject param_array2 = param_array.getJSONObject(0);
        Proses proses = new Proses();
        proses.pendaftaranNew(param_array2.getString("nama_pengguna"), 
                param_array2.getString("kata_sandi"),
                param_array2.getString("nama_lengkap"),
                param_array2.getString("email"));
        json_result.put("status", "success");
        JSONObject json_result2 = new JSONObject().put("nama_lengkap", param_array2.getString("nama_lengkap"));
        json_result2.put("email", param_array2.getString("email"));
        json_result2.put("user_id", proses.getUserID());
        json_result.put("data", json_result2);
        return json_result.toString();
    }
    
    public String getIdentity(String param) throws Exception
    {
        JSONObject json_result = new JSONObject();
        JSONObject json_result2;
        JSONArray param_array = new JSONArray(param);
        JSONObject param_array2 = param_array.getJSONObject(0);
        DBConnector dbCon = DBConnector.getInstance();
        Connection con = dbCon.getConnection();
        Statement st = con.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM pelanggan_addr WHERE user_id = " + 
                param_array2.getString("user_id") + ";");
        if(res.next()) {
            json_result.put("status", "success");
            json_result2 = new JSONObject().put("user_id", res.getString("user_id"));
            json_result2.put("alamat", res.getString("jalan"));
            json_result2.put("provinsi", res.getString("provinsi"));
            json_result2.put("kabupaten", res.getString("kabupaten"));
            json_result2.put("kodepos", res.getString("kode_pos"));
            json_result2.put("user_phone", res.getString("user_phone"));
            json_result.put("data", json_result2);
        } else {
            json_result.put("status", "failed");
            json_result.put("data", "Data tidak ditemukan");
        }
        con.close();
        return json_result.toString();
    }
    
    public String changeIdentity(String param) throws Exception
    {
        JSONObject json_result = new JSONObject();
        String sql;
        JSONObject json_result2;
        JSONArray param_array = new JSONArray(param);
        JSONObject param_array2 = param_array.getJSONObject(0);
        DBConnector dbCon = DBConnector.getInstance();
        Connection con = dbCon.getConnection();
        Statement st = con.createStatement();
        ResultSet res = st.executeQuery("SELECT * FROM pelanggan_addr WHERE user_id = " + 
                param_array2.getString("user_id") + ";");
        if(res.next()) {
            sql = "UPDATE pelanggan_addr SET ";
            sql += "jalan = '" + param_array2.getString("alamat") + "', ";
            sql += "provinsi = '" + param_array2.getString("provinsi") + "', ";
            sql += "kabupaten = '" + param_array2.getString("kabupaten") + "', ";
            sql += "kodepos = " + param_array2.getString("kodepos") + ", ";
            sql += "user_phone = '" + param_array2.getString("no_hp") + "' ";
            sql += "WHERE user_id = " + param_array2.getString("user_id") + ";";
        } else {
            sql = "INSERT INTO pelanggan_addr VALUES (";
            sql += param_array2.getString("user_id") + ", ";
            sql += "'"+ param_array2.getString("alamat") + "', ";
            sql += "'"+ param_array2.getString("provinsi") + "', ";
            sql += "'"+ param_array2.getString("kabupaten") + "', ";
            sql += param_array2.getString("kodepos") + ", ";
            sql += "'"+ param_array2.getString("no_hp") + "'";
            sql += ");";
        }
        
        st.executeQuery(sql);
        
        // Change full name
        sql = "UPDATE pelanggan_id SET ";
        sql += "nama_lengkap = '" + param_array2.getString("nama_lengkap") + "' ";
        sql += "WHERE user_id = " + param_array2.getString("user_id") + ";";
            
        con.close();
        return json_result.toString();
    }
}
