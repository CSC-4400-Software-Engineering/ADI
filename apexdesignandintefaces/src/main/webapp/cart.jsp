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
        <script>
            $("#portals").show(); //this shows the boxes that say admin and customer
            $("#logout").hide(); //this hides the one that says welcome to whoever is logged in
        </script>
        <title>Cart</title>
    </head>
    <body>
        <div class="pictures"></div>
        <div class="products-container">
            <div class="product-header">
                <h5 class="product-title">Product</h5>
                <h5 class="price">Price</h5>
                <h5 class="quantity">Quantity</h5>
                <h5 class="total">Total</h5>
            </div>
            <div class="products">
                <!--This is where we populate the products in the cart -->
            </div>
        </div>
        
        <form name="checkout" action="checkout.jsp" class="w3-container" method="get" id="checkoutForm">
            <div class="w3-row-padding">
                <div class="w3-col s4 w3-padding"><br></div>
                <div class="w3-col s4 w3-padding">
                    <button class="w3-button w3-block w3-section w3-theme w3-ripple w3-padding" id="submitButton" type="submit">Take Me to Checkout</button>
                </div>
                <div class="w3-col s4 w3-padding"><br></div>
            </div>
        </form>
       <%@include file="footer.jsp" %>
    </body>
</html>