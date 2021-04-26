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
            String productsScript = dbConnect.productScript("select brand, model, price, productID from product");
            out.print("<script>" + productsScript + "</script>");
            out.print(dbConnect.displayProducts("select productID, brand, model, price from product where type='Desktop'"));
        %>
        <%@include file="footer.jsp"%>        
    </body>
</html>