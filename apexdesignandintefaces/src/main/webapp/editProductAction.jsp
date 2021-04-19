<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit Product</title>
        <%@include file="header.jsp" %>
        <%            
            if (logged == null || !logged.equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
        <script src="otherScripts.js"></script>
    </head>
    <body>
        <%            
            int dropDownID = Integer.parseInt(request.getParameter("productDropDown"));

            DBConnect dbConnect = new DBConnect();
            String currentProductBrandSqlInput = "SELECT brand FROM product WHERE productID LIKE '" + dropDownID + "'";
            String currentProductModelSqlInput = "SELECT model FROM product WHERE productID LIKE '" + dropDownID + "'";
            String currentProductTypeSqlInput = "SELECT type FROM product WHERE productID LIKE '" + dropDownID + "'";
            String currentProductPriceSqlInput = "SELECT price FROM product WHERE productID LIKE '" + dropDownID + "'";
            String currentProductDescriptionSqlInput = "SELECT description FROM product WHERE productID LIKE '" + dropDownID + "'";
            String currentProductStockSqlInput = "SELECT stock FROM product WHERE productID LIKE '" + dropDownID + "'";

            String currentProductBrand = dbConnect.fetchInfo(currentProductBrandSqlInput);
            String currentProductModel = dbConnect.fetchInfo(currentProductModelSqlInput);
            String currentProductType = dbConnect.fetchInfo(currentProductTypeSqlInput);
            String currentProductPrice = dbConnect.fetchInfo(currentProductPriceSqlInput);
            String currentProductDescription = dbConnect.fetchInfo(currentProductDescriptionSqlInput);
            String currentProductStock = dbConnect.fetchInfo(currentProductStockSqlInput);
            String currentPicture = dbConnect.getPicture("SELECT picture FROM product WHERE productID LIKE ?", request.getParameter("productDropDown"));
        %>
        <div class="w3-row">
            <div class="w3-col m3">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Edit Product</h1>
                        <form name="editProductIntermediate" action="editProductIntermediateAction" method="POST" enctype="multipart/form-data" class="w3-container w3-padding">
                            <!-- test page <form name="editProductIntermediate" action="editProductIntermediateActionTest.jsp" method="POST" class="w3-container w3-padding"> -->
                            <input type="hidden" name="productID" value="<%out.println(dropDownID);%>">
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Brand</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productBrand" id="productBrandID" size="100" value="<%out.println(currentProductBrand);%>" onInput="editProductVerifyBrand()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Model</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productModel" id="productModelID" size="100" value="<%out.println(currentProductModel);%>" onInput="editProductVerifyModel()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Type</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productType" id="productTypeID" size="50" value="<%out.println(currentProductType);%>" onInput="editProductVerifyType()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Price</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productPrice" id="productPriceID" size="20" value="<%out.println(currentProductPrice);%>" onInput="editProductVerifyPrice()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Description</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productDescription" id="productDescriptionID" size="500" value="<%out.println(currentProductDescription);%>" onInput="editProductVerifyDescription()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Stock</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productStock" id="productStockID" size="20" value="<%out.println(currentProductStock);%>" onInput="editProductVerifyStock()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Picture</label>
                                    <br>
                                    <input class="w3-margin-top w3-margin-bottom" type="file" name="productPicture"/>
                                </div>
                            </div>
                            <br>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Picture</h1>
                        <div class="w3-container w3-padding">
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <%
                                        out.print("<img style='width:100%' src='data:image/png;base64," + currentPicture + "'/>");
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>