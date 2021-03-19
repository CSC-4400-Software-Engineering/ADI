<%@page import="myBeans.DBConnect"%>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <title>Test</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <!-- 
        Test page for connecting and adding products to the database
        Make sure the enctype is not specified in the form when using this page
        This really should not be used anymore, but it's here just in case 
        -->
        <div class="w3-row">
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Test</h1>
                        <div class="w3-container w3-padding-large">
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
                                out.print("<li>Brand: <b>" + productBrandInput + "</b></li>");
                                out.print("<li>Model: <b>" + productModelInput + "</b></li>");
                                out.print("<li>Type: <b>" + productTypeInput + "</b></li>");
                                out.print("<li>Price: <b>" + productPriceInput + "</b></li>");
                                out.print("<li>Description: <b>" + productDescriptionInput + "</b></li>");
                                out.print("<li>Stock: <b>" + productStockInput + "</b></li>");
                                out.print("<li>Picture: <b>" + productPicture + "</b></li>");
                                //out.println(connectMessage);
                                if (connectMessage.equals("Closed")) {
                                    //response.sendRedirect("administrator.jsp");
                                    out.println("<li class='my-2'><b>Success!</b></li>");
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
