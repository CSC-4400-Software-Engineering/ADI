<%@page import="myBeans.DBConnect"%>
<html>
    <%
        DBConnect dbConnect = new DBConnect();
    %>
    <head>
        <title>Administrator</title>
        <%@include file="header.jsp" %>
        <script src="otherScripts.js"></script>
    </head>
    <div class="w3-row">
        <div class="w3-col m4">
            <h1>Add Product</h1>
            <form name="addProduct" action="addProductAction" method="POST" enctype="multipart/form-data" class=" w3-light-grey w3-padding-large w3-border w3-card">
                <label>Brand</label>
                <input required class="w3-margin-top w3-margin-bottom w3-input w3-border" type="text" name="productBrand" id="productBrandID" size="100" onInput="verifyBrand()"/>
                <label>Model</label>
                <input required class="w3-margin-top w3-margin-bottom w3-input w3-border" type="text" name="productModel" id="productModelID" size="100" onInput="verifyModel()"/>
                <label>Type</label>
                <input required class="w3-margin-top w3-margin-bottom w3-input w3-border" type="text" name="productType" id="productTypeID" size="50" onInput="verifyType()"/>
                <label>Price</label>
                <input required class="w3-margin-top w3-margin-bottom w3-input w3-border" type="text" name="productPrice" id="productPriceID" size="20" onInput="verifyPrice()"/>
                <label>Description</label>
                <input required class="w3-margin-top w3-margin-bottom w3-input w3-border" type="text" name="productDescription" id="productDescriptionID" size="500" onInput="verifyDescription()"/>
                <label>Stock</label>
                <input required class="w3-margin-top w3-margin-bottom w3-input w3-border" type="text" name="productStock" id="productStockID" size="20" onInput="verifyStock()"/>
                <label>Picture</label>
                <br>
                <input required class="w3-margin-top w3-margin-bottom" type="file" name="productPicture"/>
                <br>
                <br>
                <input class="w3-button w3-border" type="submit" value="Submit"/>
                <input class="w3-button w3-border" type="reset" value="Reset" />
            </form>
            <% 
                if (request.getAttribute("successMessage") != null){
                out.println(request.getAttribute("successMessage"));
                }
            %>
        </div>

    </div>
</html>