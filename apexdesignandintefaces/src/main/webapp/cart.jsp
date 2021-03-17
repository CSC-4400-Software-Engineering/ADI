<%-- 
    Document   : cart
    Created on : Mar 15, 2021, 11:18:41 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <title>Cart</title>
    </head>
    <body>
        <%
            session.setAttribute("email", "sgoyette430@gmail.com");

        %>
        <table border="1" cellpadding="5">
            <thead>
                <tr>
                    <th>Picture</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>NULL</td>
                    <td>Dell Optiplex 7010</td>
                    <td>Logitech Wireless Mouse</td>
                    <td>RedDragon RGB Mechanical Gaming Keyboard</td>
                </tr>
                <tr>
                    <td>NULL</td>
                    <td>$349.99</td>
                    <td>$13.98</td>
                    <td>$25.99</td>
                </tr>
                <tr>
                    <td>NULL</td>
                    <td>1</td>
                    <td>1</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>
        <form name="checkout" action="checkout.jsp" class="w3-container" method="get" id="checkoutForm">
            <div class="w3-row-padding">
                <div class="w3-col s4 w3-padding"><br></div>
                <div class="w3-col s4 w3-padding">
                    <button class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" id="submitButton" type="submit">Take Me to Checkout</button>
                </div>
                <div class="w3-col s4 w3-padding"><br></div>
            </div>
        </form>


        <%@include file="footer.jsp" %>
    </body>
</html>