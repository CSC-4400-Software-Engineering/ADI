<%-- 
    Document   : products
    Created on : Mar 19, 2021, 10:33:54 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        
        <%@include file="header.jsp"%>
        <title>Products</title>
    </head>
    <body>
        <!--These are the products that we have to display. To do so from the database, we must make a DBConnect
        function that will print a repetitive version of this code as HTML statements based upon database
        queries determined by how the user got to this page (-->
        <div class="container">
            <div class="image">
                <img src="Images/optiplex7010.jpg" alt="optiplex7010"/>
                <h3>Dell Optiplex 7010</h3> <!--This would be something like "<h3>" + brand + " " + model + "</h3>" --->
                <h3>$399</h3>  <!--This would be something like "<h3>$" + price + "</h3>" --->
                <a class="add-cart cart1" href="#">Add to Cart</a> <!--This would be the same always --->
            </div>

            <div class="image">
                <img src="Images/folio9470m.jpg" alt="folio9470m"/>
                <h3>HP Folio 9470M</h3>
                <h3>$199</h3>
                <a class="add-cart cart2" href="#">Add to Cart</a>
            </div>

            <div class="image">
                <img src="Images/xboxseriesx.png" alt="xboxseriesx"/>
                <h3>Xbox Series X (Black)</h3>
                <h3>$499</h3>
                <a class="add-cart cart3" href="#">Add to Cart</a>
            </div>

            <div class="image">
                <img src="Images/jblcharge4.jpg" alt="jblcharge4"/>
                <h3>JBL Charge 4</h3>
                <h3>$129</h3>
                <a class="add-cart cart4" href="#">Add to Cart</a>
            </div> 
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>