<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <script>
            <%            
                if (logged == null || logged.equals("index")) {
                    out.print("$('#portals').show();");
                    out.print("$('#logout').hide();");
                } 
                else if (logged.equals("index") == false) {
                    out.print("$('#portals').hide();");
                    out.print("$('#logout').show();");
                }
            %>
        </script>
        <title>Cart</title>
    </head>
    <body>
        <div class="flexcontent">
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
            <input class="productSQL" type="hidden" name="productSQL" id="productSQL" value="?">
            <div class="w3-row-padding">
                <div class="w3-col s4 w3-padding"><br></div>
                <div class="w3-col s4 w3-padding">
                    <button class="w3-button w3-block w3-section w3-theme w3-ripple w3-padding" onclick="localStorage.clear(); location.reload()">Empty Cart</button>
                </div>
                <div class="w3-col s4 w3-padding"><br></div>
            </div>
            <div class="w3-row-padding">
                <div class="w3-col s4 w3-padding"><br></div>
                <div class="w3-col s4 w3-padding">
                    <a href="checkout.jsp" class="w3-button w3-block w3-section w3-theme w3-ripple w3-padding">Take Me to Checkout</a>
                </div>
                <div class="w3-col s4 w3-padding"><br></div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>