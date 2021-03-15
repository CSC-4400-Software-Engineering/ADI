<%@page import="myBeans.DBConnect"%>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Test</title>
    </head>
    <body>
        <%
            String productBrandInput = request.getParameter("productBrand");
            String productModelInput = request.getParameter("productModel");
            String productTypeInput = request.getParameter("productType");
            String productPriceInput = request.getParameter("productPrice");
            String productDescriptionInput = request.getParameter("productDescription");
            String productStockInput = request.getParameter("productStock");
            //String productPicture = request.getParameter("productPicture");

            String willsLongBeyondAllReseasonableComprehensionSqlInput = "INSERT INTO product (productID, brand, model, type, price, description, stock) VALUES (0, '" + productBrandInput + "', '" + productModelInput + "', '" + productTypeInput + "', '" + productPriceInput + "', '" + productDescriptionInput + "', '" + productStockInput + "')";
            DBConnect dbConnect = new DBConnect();
            String connectMessage = dbConnect.insertData(willsLongBeyondAllReseasonableComprehensionSqlInput);
            out.println(connectMessage);
            if (connectMessage.equals("Closed")) {
                response.sendRedirect("administrator.jsp");
            }
        %>
    </body>
</html>
