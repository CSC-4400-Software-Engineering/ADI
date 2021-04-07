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
        <%
            DBConnect dbConnect = new DBConnect();
            String currentPicture = dbConnect.getPicture("SELECT picture FROM product WHERE productID LIKE ?", "13");
        %>
        
    </head>
    <body>
        <!--These are the products that we have to display. To do so from the database, we must make a DBConnect
        function that will print a repetitive version of this code as HTML statements based upon database
        queries determined by how the user got to this page (-->
        <div class="container">
            <div class="image">
                <%                    
                    out.print("<img style='width:100%' src='data:image/png;base64,");
                    out.println(currentPicture);
                    out.print("'/>");
                %>
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
                <script>
                    let products = [
    {
        name: "Dell Optiplex 7010",
        tag: "optiplex7010",
        price: 399,
        inCart: 0
        
    },
    {
        name: "HP Folio 9470M",
        tag: "folio9470m",
        price: 199,
        inCart: 0
    },
    {
        name: "Xbox Series X (Black)",
        tag: "xboxseriesx",
        price: 499,
        inCart: 0
    },
    {
        name: "JBL Charge 4",
       tag: "jblcharge4",
       price: 129,
       inCart: 0
   }
];
                </script>
        <%@include file="footer.jsp" %>
    </body>
</html>