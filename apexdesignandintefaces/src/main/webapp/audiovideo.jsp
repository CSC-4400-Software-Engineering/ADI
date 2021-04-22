<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Audio/Video</title>
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
        <%            
            DBConnect dbConnect = new DBConnect();

            /* Create the in-line product Javascript */
            
            String productsScript = dbConnect.productScript("SELECT brand, model, price, productID FROM product WHERE type LIKE 'Audio/Video' ORDER BY stock DESC");
            out.print("<script>" + productsScript + "</script>");

            /* Display the products */
            
            out.print(dbConnect.displayProducts("SELECT productID, brand, model, price, stock FROM product WHERE type LIKE 'Audio/Video' ORDER BY stock DESC"));

        %>
        <%@include file="footer.jsp"%>        
    </body>
</html>