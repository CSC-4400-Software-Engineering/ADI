<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>All Products</title>
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

            /* Display the products */
            
            out.print(dbConnect.displayProducts("SELECT productID, brand, model, price, stock, sale FROM product ORDER BY stock DESC"));
        %>
        <%@include file="footer.jsp"%>        
    </body>
</html>