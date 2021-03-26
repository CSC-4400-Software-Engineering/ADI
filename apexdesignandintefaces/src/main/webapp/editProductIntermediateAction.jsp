<%@page import="myBeans.DBConnect"%>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <title>Test</title>
        <%@include file="header.jsp" %>
    </head>
    <body>
        <div class="w3-row">
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Test</h1>
                        <div class="w3-container w3-padding-large">
                            <%
                                String productIDInput = request.getParameter("productID");
                                
                                /* Strip any potential whitespace just to be safe */
                                
                                productIDInput = productIDInput.trim();
                                String productBrandInput = request.getParameter("productBrand");
                                String productModelInput = request.getParameter("productModel");
                                String productTypeInput = request.getParameter("productType");
                                String productPriceInput = request.getParameter("productPrice");
                                String productDescriptionInput = request.getParameter("productDescription");
                                String productStockInput = request.getParameter("productStock");
                                String productPictureInput = request.getParameter("productPicture");
                                
                                /* We refrain from updating the image in this test, since it needs to be done via servlet */

                                String sqlInput = "UPDATE product SET brand = '" + productBrandInput + "', model = '" + productModelInput + "', type = '" + productTypeInput + "', price = '" + productPriceInput + "', description = '" + productDescriptionInput + "', stock = '" + productStockInput + "' WHERE productID LIKE '" + productIDInput + "'";
                                DBConnect dbConnect = new DBConnect();
                                String connectMessage = dbConnect.insertData(sqlInput);
                                out.print("<li>Brand: <b>" + productBrandInput + "</b></li>");
                                out.print("<li>Model: <b>" + productModelInput + "</b></li>");
                                out.print("<li>Type: <b>" + productTypeInput + "</b></li>");
                                out.print("<li>Price: <b>" + productPriceInput + "</b></li>");
                                out.print("<li>Description: <b>" + productDescriptionInput + "</b></li>");
                                out.print("<li>Stock: <b>" + productStockInput + "</b></li>");
                                if (request.getParameter("productPicture") != "") {
                                    out.print("<li>Picture: <b>" + productPictureInput + "</b></li>");
                                }

                                if (connectMessage.equals("Closed")) {
                                    out.println("<li class='my-2'><b>Success!</b></li>");
                                    //response.sendRedirect("administrator.jsp?editMessage=Product in inventory edited!");
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