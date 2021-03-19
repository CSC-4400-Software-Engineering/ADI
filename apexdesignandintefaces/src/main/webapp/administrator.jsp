<html>
    <head>
        <title>Administrator</title>
        <%@include file="header.jsp" %>
        <script src="otherScripts.js"></script>
    </head>
    <body>
        <div class="w3-row">
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Add Product</h1>
                        <form name="addProduct" action="addProductAction" method="POST" enctype="multipart/form-data" class="w3-container w3-padding-large">
                            <!-- test page <form name="addProduct" action="addProductAction.jsp" method="POST" class="w3-container w3-padding-large"> -->
                            <label>Brand</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productBrand" id="productBrandID" size="100" onInput="verifyBrand()"/>
                            <label>Model</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productModel" id="productModelID" size="100" onInput="verifyModel()"/>
                            <label>Type</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productType" id="productTypeID" size="50" onInput="verifyType()"/>
                            <label>Price</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productPrice" id="productPriceID" size="20" onInput="verifyPrice()"/>
                            <label>Description</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productDescription" id="productDescriptionID" size="500" onInput="verifyDescription()"/>
                            <label>Stock</label>
                            <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productStock" id="productStockID" size="20" onInput="verifyStock()"/>
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
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>