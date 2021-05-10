<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Deals</title>
        <%@include file="header.jsp"%>
        <link rel="stylesheet" href="productStyle.css">
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
    </head>
    <body>
        <div class="flexcontent">
            <%
                DBConnect dbConnect = new DBConnect();

                /* Display the products */
                
                String productDealsResult = dbConnect.displayProducts("SELECT productID, brand, model, price, stock, sale FROM product WHERE sale LIKE '1' ORDER BY stock DESC");

                /* If the tags are empty, the query probably did not return any products */
                
                if (productDealsResult.equals("<div class='container'></div><script>let products = [];</script><style></style>")) {
                    out.print("<div class='container'><h3>No sales are currently ongoing</h3></div>");
                } 
                else {
                    out.print(productDealsResult);
                }
            %>
        </div>
        <%@include file="footer.jsp"%>        
    </body>
</html>