<%@page import="myBeans.DBConnect"%>
<html>
            <%
            DBConnect dbConnect = new DBConnect();
        %>
    <head>
        <title>Administrator</title>
        <%@include file="header.jsp" %>
    </head>
    <div class="w3-row">
        <div class="w3-col m4">
            <h1 class="w3-animate-opacity">Add Product</h1>
            <form name="addProduct" action="addProductAction.jsp" method="POST" class=" w3-light-grey w3-border w3-card">
                <label>Brand</label>
                <input required class="w3-input w3-border" type="text" name="productBrand" size="100"/>
                <label>Model</label>
                <input required class="w3-input w3-border" type="text" name="productModel" size="100"/>
                <label>Type</label>
                <input required class="w3-input w3-border" type="text" name="productType" size="50"/>
                <label>Price</label>
                <input required class="w3-input w3-border" type="number" name="productPrice" size="20"/>
                <label>Description</label>
                <input required class="w3-input w3-border" type="text" name="productDescription" size="500"/>
                <label>Stock</label>
                <input required class="w3-input w3-border" type="number" name="productStock" size="20"/>
                <label>Picture</label>
                <br>
                <input required type="file" name="productPicture"/>
                <br>
                <br>
                <input class="w3-button w3-border w3-hover-white" type="submit" value="Submit"/>
                <input class="w3-button w3-border w3-hover-white" type="reset" value="Reset" />
            </form>
        </div>

    </div>
</html>