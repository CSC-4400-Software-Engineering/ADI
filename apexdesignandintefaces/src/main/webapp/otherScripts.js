/* 
 * Misc Javascript functions
 */


function verifyBrand() {
    var theProductBrand = document.addProduct.productBrand.value;
    var theProductBrandLength = theProductBrand.length;

    if (theProductBrandLength > 100) {
        document.getElementById("productBrandID").setCustomValidity("Brand must not be greater than 100 characters in size!");
    }
    
    else {
        document.getElementById("productBrandID").setCustomValidity("");
    }
}

function verifyModel() {
    var theProductModel = document.addProduct.productModel.value;
    var theProductModelLength = theProductModel.length;
    
    if (theProductModelLength > 100) {
        document.getElementById("productModelID").setCustomValidity("Model must not be greater than 100 characters in size!");
    }
    
    else {
        document.getElementById("productModelID").setCustomValidity("");
    }
}

function verifyType() {
    var theProductType = document.addProduct.productType.value;
    var theProductTypeLength = theProductType.length;
    
    if (theProductTypeLength > 50) {
        document.getElementById("productTypeID").setCustomValidity("Type must not be greater than 50 characters in size!");
    }
    
    else {
        document.getElementById("productTypeID").setCustomValidity("");
    }
}

function verifyPrice() {

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

function verifyDescription() {
    var theProductDescription = document.addProduct.productDescription.value;
    var theProductDescriptionLength = theProductDescription.length;
    
    if (theProductDescriptionLength > 500) {
        document.getElementById("productDescriptionID").setCustomValidity("Description must not be greater than 500 characters in size!");
    } 
    else {
        document.getElementById("productDescriptionID").setCustomValidity("");
    }
}

function verifyStock() {
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
/* Function to check if input is numeric */
function numericCheck(inputString) {
    return /^[0-9]+$/.test(inputString);
}
