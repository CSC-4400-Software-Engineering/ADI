<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator</title>
        <%@include file="header.jsp" %>
        <script src="otherScripts.js"></script>
    </head>
    <body>
        <%            
            DBConnect dbConnect = new DBConnect();
            String productDropDown;
        %>
        <div class="w3-row">
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Add Product</h1>
                        <form name="addProduct" action="addProductAction" method="POST" enctype="multipart/form-data" class="w3-container w3-padding-large">
                            <!-- test page <form name="addProduct" action="addProductAction.jsp" method="POST" class="w3-container w3-padding-large"> -->
                            <label>Brand</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productBrand" id="productBrandID" size="100" onInput="addProductVerifyBrand()"/>
                            <label>Model</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productModel" id="productModelID" size="100" onInput="addProductVerifyModel()"/>
                            <label>Type</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productType" id="productTypeID" size="50" onInput="addProductVerifyType()"/>
                            <label>Price</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productPrice" id="productPriceID" size="20" onInput="addProductVerifyPrice()"/>
                            <label>Description</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productDescription" id="productDescriptionID" size="500" onInput="addProductVerifyDescription()"/>
                            <label>Stock</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productStock" id="productStockID" size="20" onInput="addProductVerifyStock()"/>
                            <label>Picture</label>
                            <br>
                            <input required class="w3-margin-top w3-margin-bottom" type="file" name="productPicture"/>
                            <br>
                            <br>
                            <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                            <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                        </form>
                    </div>
                </div>
                <%
                    if (request.getParameter("addMessage") != null) {
                        out.println("<div class='w3-padding'>");
                        out.println(request.getParameter("addMessage"));
                        out.println("</div>");
                    }
                %>
            </div>
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Edit Product</h1>
                        <form name="editProduct" action="editProductAction.jsp" method="GET" class="w3-container w3-padding-large">
                            <label>Product</label>
                            <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="productDropDown">
                                <%
                                    productDropDown = dbConnect.dropdown("SELECT productID, model FROM product");
                                    out.println(productDropDown);
                                %>
                            </select>
                            <br>
                            <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                            <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                        </form>
                    </div>
                </div>
                <%
                    if (request.getParameter("editMessage") != null) {
                        out.println("<div class='w3-padding'>");
                        out.println(request.getParameter("editMessage"));
                        out.println("</div>");
                    }
                %>
            </div>
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Remove Product</h1>
                        <form name="removeProduct" action="removeProductAction.jsp" method="POST" class="w3-container w3-padding-large">
                        <!-- test page <form name="removeProduct" action="removeProductActionTest.jsp" method="POST" class="w3-container w3-padding-large"> -->
                            <label>Product</label>
                            <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="productDropDown" id="productDropDownID" onchange="removeProductDropDownSwitch()">
                                <%
                                    productDropDown = dbConnect.dropdown("SELECT productID, model FROM product");
                                    out.println(productDropDown);
                                %>
                            </select>
                            <br>
                            <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                            <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit" onclick="return removeProductConfirm()" />
                        </form>
                    </div>
                </div>
                <%
                    if (request.getParameter("removeMessage") != null) {
                        out.println("<div class='w3-padding'>");
                        out.println(request.getParameter("removeMessage"));
                        out.println("</div>");
                    }
                %>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>