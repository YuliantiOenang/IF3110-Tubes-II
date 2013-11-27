<%@page import="java.sql.*"%>
<html>
    <head>
        <title>Accessing data in a database</title>
    </head>
    <body>
        <%

            try {
                // Step 1. Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Step 2. Create a Connection object
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/newcommerce",
                        "root", "");

               String namaitem = request.getParameter("tambah").trim();

                // Step 3. Create a Statement object and call its executeUpdate 
                // method to insert a record
                Statement s = con.createStatement();
                String sql = 
                  "INSERT INTO cart VALUES ('Michael', 'Franks', '12/12/2003', 'm')";
                //s.executeUpdate(sql);

                // Step 4. Use the same Statement object to obtain a ResultSet object
                 sql = "SELECT NAMA, HARGA, Stok, Category FROM items";
                ResultSet rs = s.executeQuery(sql);
                out.println("Nama     Harga   Stok    Makanan <br>");
                while (rs.next()) {


                    out.println("<a href=\"loaddetails.jsp?item=" + rs.getString(1) + "\">" + rs.getString(1) + "</a>" + " " + rs.getString(2) + " " + rs.getString(3) + " " + rs.getString(4) + " " + "<a href=\"../cart/addcart.jsp?tambah=" + rs.getString(1) + "\">add to cart</a>" + "<br>");
                   
                }

                rs.close();
                s.close();
                con.close();
            } catch (ClassNotFoundException e1) {
                // JDBC driver class not found, print error message to the console
                System.out.println(e1.toString());
            } catch (SQLException e2) {
                // Exception when executing java.sql related commands, print error message to the console
                System.out.println(e2.toString());
            } catch (Exception e3) {
                // other unexpected exception, print error message to the console
                System.out.println(e3.toString());
            }
        %>
    </body>
</html>