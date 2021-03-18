<%@page import="myBeans.DBConnect"%>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Test</title>
    </head>
    <body>
        <!-- 
        Test page for connecting and adding products to the database
        Make sure the enctype is not specified in the form when using this page
        This really should not be used anymore, but it's here just in case 
        -->
        <%
            String productBrandInput = request.getParameter("productBrand");
            String productModelInput = request.getParameter("productModel");
            String productTypeInput = request.getParameter("productType");
            String productPriceInput = request.getParameter("productPrice");
            String productDescriptionInput = request.getParameter("productDescription");
            String productStockInput = request.getParameter("productStock");
            String productPicture = request.getParameter("productPicture");
            
            /* Note that we do not actually insert the image in this test */

            String willsLongBeyondAllReasonableComprehensionSqlInput = "INSERT INTO product (productID, brand, model, type, price, description, stock) VALUES (0, '" + productBrandInput + "', '" + productModelInput + "', '" + productTypeInput + "', '" + productPriceInput + "', '" + productDescriptionInput + "', '" + productStockInput + "')";
            DBConnect dbConnect = new DBConnect();
            String connectMessage = dbConnect.insertData(willsLongBeyondAllReasonableComprehensionSqlInput);
            out.print("<li class='my-2'>Brand: <b>" + productBrandInput + "</b></li>");
            out.print("<li class='my-2'>Model: <b>" + productModelInput + "</b></li>");
            out.print("<li class='my-2'>Type: <b>" + productTypeInput + "</b></li>");
            out.print("<li class='my-2'>Price: <b>" + productPriceInput + "</b></li>");
            out.print("<li class='my-2'>Description: <b>" + productDescriptionInput + "</b></li>");
            out.print("<li class='my-2'>Stock: <b>" + productStockInput + "</b></li>");
            out.print("<li class='my-2'>Picture: <b>" + productPicture + "</b></li>");
            //out.println(connectMessage);
            if (connectMessage.equals("Closed")) {
                //response.sendRedirect("administrator.jsp");
                out.println("<li class='my-2'><b>Success!</b></li>");
            }
        %>
    </body>
</html>
