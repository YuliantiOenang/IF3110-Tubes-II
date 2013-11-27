<%@page import="java.sql.*"%>
<html>
    <head>
        <title>Accessing data in a database</title>
    </head>
    <script>
        function updatecart(namaitem) {



            url = "index.jsp?n=" + n + "&p=" + p;
            return url;


        }

    </script>
    <body>
        <%@include file="..\header.jsp" %>
        <%
            String namabarang = request.getParameter("n");
            String jumlahbarang = request.getParameter("j");
            //out.println("java" + namabarang + jumlahbarang);
            try {
                // Step 1. Load the JDBC driver
                Class.forName("com.mysql.jdbc.Driver");

                // Step 2. Create a Connection object
                Connection con = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/newcommerce",
                        "root", "");

                System.out.println("got connection");
                int total;
                int beli;
                int perbuah;
                int supertotal = 0;

                // Step 3. Create a Statement object and call its executeUpdate 
                // method to insert a record
                Statement s = con.createStatement();

                String sql =
                        "UPDATE cart SET NAMAITEM='" + namabarang + "', JUMLAH='" + jumlahbarang + "' WHERE NAMAITEM = '" + namabarang + "'";
                //  out.println(sql);
                s.executeUpdate(sql);


                // Step 4. Use the same Statement object to obtain a ResultSet object
                sql = "SELECT * FROM cart";

                ResultSet rs = s.executeQuery(sql);
                out.println("CART<br><br>");
                while (rs.next()) {


                    out.println(rs.getString(1) + ", dengan jumlah yang ingin dibeli : " + rs.getString(2) + " buah <input id=\"" + rs.getString(1) + "\" type=\"text\" placeholder=\"Masukkan jumlah\" /> <button onclick=\"var n= \'" + rs.getString(1) + "\';var j = document.getElementById(n).value;alert(n);alert(j);window.location.href=\'index.jsp?n=\'+n+'&j='+j\">beli</button>");
                    beli = Integer.parseInt(rs.getString(2));

                    Statement s2 = con.createStatement();

                    // out.println(rs2.getString(1));

                    String sql2 = "SELECT Stok, Harga from items where nama='" + rs.getString(1) + "'";
                    ResultSet rs2 = s2.executeQuery(sql2);
                    while (rs2.next()) {
                        out.println("Stok " + rs2.getString(1) + "<br>Harga perbuah Rp." + rs2.getString(2) + "         Jangan melebihi stok!<br><br>");
                        perbuah = Integer.parseInt(rs2.getString(2));

                        total = beli * perbuah;

                        supertotal += total;

                    }

                }

                rs.close();

                s.close();
                con.close();
                out.println("Total Belanja Anda adalah Rp." + supertotal);
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
    <br><a href="../registercard.jsp">Purchase</a>
</html>