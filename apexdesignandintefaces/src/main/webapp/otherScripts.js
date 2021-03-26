/* 
 * Misc Javascript functions
 */

/* Add Product functions */
function addProductVerifyBrand() {
    var theProductBrand = document.addProduct.productBrand.value;
    var theProductBrandLength = theProductBrand.length;

    if (theProductBrandLength > 100) {
        document.getElementById("productBrandID").setCustomValidity("Brand must not be greater than 100 characters in size!");
    }
    
    else {
        document.getElementById("productBrandID").setCustomValidity("");
    }
}

function addProductVerifyModel() {
    var theProductModel = document.addProduct.productModel.value;
    var theProductModelLength = theProductModel.length;
    
    if (theProductModelLength > 100) {
        document.getElementById("productModelID").setCustomValidity("Model must not be greater than 100 characters in size!");
    }
    
    else {
        document.getElementById("productModelID").setCustomValidity("");
    }
}

function addProductVerifyType() {
    var theProductType = document.addProduct.productType.value;
    var theProductTypeLength = theProductType.length;
    
    if (theProductTypeLength > 50) {
        document.getElementById("productTypeID").setCustomValidity("Type must not be greater than 50 characters in size!");
    }
    
    else {
        document.getElementById("productTypeID").setCustomValidity("");
    }
}

function addProductVerifyPrice() {

    var theProductPrice = document.addProduct.productPrice.value;
    var theProductPriceLength = theProductPrice.length;
    
    if (numericCheck(theProductPrice) === false) {
        document.getElementById("productPriceID").setCustomValidity("Price must be numeric!");
    }
    else if (theProductPriceLength > 20) {
        document.getElementById("productPriceID").setCustomValidity("Price must not be greater than 20 digits in size!");
    } 
    else {
        document.getElementById("productPriceID").setCustomValidity("");
    }
}

function addProductVerifyDescription() {
    var theProductDescription = document.addProduct.productDescription.value;
    var theProductDescriptionLength = theProductDescription.length;
    
    if (theProductDescriptionLength > 500) {
        document.getElementById("productDescriptionID").setCustomValidity("Description must not be greater than 500 characters in size!");
    } 
    else {
        document.getElementById("productDescriptionID").setCustomValidity("");
    }
}

function addProductVerifyStock() {
    var theProductStock = document.addProduct.productStock.value;
    var theProductStockLength = theProductStock.length;
    
    if (numericCheck(theProductStock) === false) {
        document.getElementById("productStockID").setCustomValidity("Stock must be numeric!");
    }
    else if (theProductStockLength > 20) {
        document.getElementById("productStockID").setCustomValidity("Stock must not be greater than 20 digits in size!");
    } 
    else {
        document.getElementById("productStockID").setCustomValidity("");
    }
}
/* Edit Product functions */
function editProductVerifyBrand() {
    var theProductBrand = document.editProductIntermediate.productBrand.value;
    var theProductBrandLength = theProductBrand.length;

    if (theProductBrandLength > 100) {
        document.getElementById("productBrandID").setCustomValidity("Brand must not be greater than 100 characters in size!");
    }
    
    else {
        document.getElementById("productBrandID").setCustomValidity("");
    }
}

function editProductVerifyModel() {
    var theProductModel = document.editProductIntermediate.productModel.value;
    var theProductModelLength = theProductModel.length;
    
    if (theProductModelLength > 100) {
        document.getElementById("productModelID").setCustomValidity("Model must not be greater than 100 characters in size!");
    }
    
    else {
        document.getElementById("productModelID").setCustomValidity("");
    }
}

function editProductVerifyType() {
    var theProductType = document.editProductIntermediate.productType.value;
    var theProductTypeLength = theProductType.length;
    
    if (theProductTypeLength > 50) {
        document.getElementById("productTypeID").setCustomValidity("Type must not be greater than 50 characters in size!");
    }
    
    else {
        document.getElementById("productTypeID").setCustomValidity("");
    }
}

function editProductVerifyPrice() {
    var theProductPrice = document.editProductIntermediate.productPrice.value;
    var theProductPriceLength = theProductPrice.length;
    
    if (numericCheck(theProductPrice) === false) {
        document.getElementById("productPriceID").setCustomValidity("Price must be numeric!");
    }
    else if (theProductPriceLength > 20) {
        document.getElementById("productPriceID").setCustomValidity("Price must not be greater than 20 digits in size!");
    } 
    else {
        document.getElementById("productPriceID").setCustomValidity("");
    }
}

function editProductVerifyDescription() {
    var theProductDescription = document.editProductIntermediate.productDescription.value;
    var theProductDescriptionLength = theProductDescription.length;
    
    if (theProductDescriptionLength > 500) {
        document.getElementById("productDescriptionID").setCustomValidity("Description must not be greater than 500 characters in size!");
    } 
    else {
        document.getElementById("productDescriptionID").setCustomValidity("");
    }
}

function editProductVerifyStock() {
    var theProductStock = document.editProductIntermediate.productStock.value;
    var theProductStockLength = theProductStock.length;
    
    if (numericCheck(theProductStock) === false) {
        document.getElementById("productStockID").setCustomValidity("Stock must be numeric!");
    }
    else if (theProductStockLength > 20) {
        document.getElementById("productStockID").setCustomValidity("Stock must not be greater than 20 digits in size!");
    } 
    else {
        document.getElementById("productStockID").setCustomValidity("");
    }
}
/* Function to check if input is numeric */
function numericCheck(inputString) {
    return /^[0-9]+$/.test(inputString);
}
