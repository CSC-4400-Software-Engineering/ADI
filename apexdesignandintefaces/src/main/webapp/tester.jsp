<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <link rel="stylesheet" href="productStyle.css">
        <title>Products</title>
    </head>
    <body>
        <%            
            DBConnect dbConnect = new DBConnect();
            out.print(dbConnect.displayProducts("select productID, brand, model, price, stock, sale from product where type='Desktop'"));
        %>
        <%@include file="footer.jsp"%>        
    </body>
</html>