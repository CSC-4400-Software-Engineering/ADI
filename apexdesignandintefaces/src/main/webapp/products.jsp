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
        <link rel="stylesheet" href="productStyle.css">
        <title>Products</title>
    </head>
    <body>
        <%            DBConnect dbConnect = new DBConnect();
            String productsScript = dbConnect.productScript("select brand, model, price, productID from product");
            out.print("<script>" + productsScript + "</script>");
            out.print(dbConnect.displayProducts("select productID, brand, model, price from product"));
%>
                <%@include file="footer.jsp"%>        
    </body>
</html>