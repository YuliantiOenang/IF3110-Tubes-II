<%-- 
    Document   : checkout
    Created on : Nov 27, 2013, 6:49:54 PM
    Author     : compaq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>
        <div id="main">
            
            <div id="header">
                <div id="widgetBar">

                    <div class="headerWidget">
                        [ language toggle ]
                    </div>

                    <div class="headerWidget">
                        [ checkout button ]
                    </div>

                    <div class="headerWidget">
                        [ shopping cart widget ]
                    </div>

                </div>

                <a href="../../WEB-INF/">
                    <img src="res/sirup.jpg" id="logo" alt="Ruserba Logo">
                </a>

                <img src="res/logo.png" id="logoText" alt="Ruserba: Apa Apa Ada Semua Serba Ada">
            </div>

            <div id="centerColumn">

                <h2>checkout</h2>

                <p>[ text ]</p>

                <form action="purchase" method="post">

                    <table id="checkoutTable">
                        <tr>
                            <td>[ form containing fields to
                                <br>capture customer details ]</td>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="submit button"></td>
                        </tr>

                    </table>

                </form>

                <div id="infoBox">

                    <div style="border: black solid 1px; height:100px; padding: 10px">
                        [ purchase conditions ]
                    </div>

                    <div id="priceBox">
                        [ purchase calculations:<br>subtotal + delivery charge ]
                    </div>
                </div>
            </div>

            <div id="footer">
                <hr>
                <p id="footerText">[ footer text ]</p>
            </div>
        </div>
    </body>
</html>
