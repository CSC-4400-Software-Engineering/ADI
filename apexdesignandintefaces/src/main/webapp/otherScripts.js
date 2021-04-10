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

/* This is for setting the validity onchange. Purely aesthetic */
function removeProductDropDownSwitch() {
    document.getElementById("productDropDownID").setCustomValidity("");   
}

function removeProductConfirm() {
  var productDropDown = document.getElementById("productDropDownID");
  var productModel = productDropDown.options[productDropDown.selectedIndex].text;
  
  if (productModel !== "Select one ...") {
      return confirm("Are you sure you want to remove " + productModel + " from the inventory?");
  }
  /* Set the validity just in case. This is needed for browsers that are chromium-based. */
  else {
      document.getElementById("productDropDownID").setCustomValidity("Please select an item in the list.");
  }
}

function editUserVerifyFirstName() {
    var theUserFirstName = document.editUserIntermediate.userFirstName.value;
    var theUserFirstNameLength = theUserFirstName.length;
    
    if (theUserFirstNameLength > 50) {
        document.getElementById("userFirstNameID").setCustomValidity("First Name must not be greater than 50 characters in size!");
    } 
    else {
        document.getElementById("userFirstNameID").setCustomValidity("");
    }
}

function editUserVerifyLastName() {
    var theUserLastName = document.editUserIntermediate.userLastName.value;
    var theUserLastNameLength = theUserLastName.length;
    
    if (theUserLastNameLength > 50) {
        document.getElementById("userLastNameID").setCustomValidity("Last Name must not be greater than 50 characters in size!");
    } 
    else {
        document.getElementById("userLastNameID").setCustomValidity("");
    }
}

function editUserVerifyEmail() {
    var theUserEmail = document.editUserIntermediate.userEmail.value;
    var theUserEmailLength = theUserEmail.length;
    
    if (emailCheck(theUserEmail) === false) {
        document.getElementById("userEmailID").setCustomValidity("Email is not valid!");
    }    
    else if (theUserEmailLength > 100) {
        document.getElementById("userEmailID").setCustomValidity("Email must not be greater than 100 characters in size!");
    } 
    else {
        document.getElementById("userEmailID").setCustomValidity("");
    }
}

function editUserVerifyPassword() {
    var theUserPassword = document.editUserIntermediate.userPassword.value;
    var theUserPasswordLength = theUserPassword.length;
    
    if (passwordCheck(theUserPassword) === false) {
        document.getElementById("userPasswordID").setCustomValidity("Password is not valid!");
    }    
    else if (theUserPasswordLength > 30) {
        document.getElementById("userPasswordID").setCustomValidity("Password must not be greater than 30 characters in size!");
    } 
    else {
        document.getElementById("userPasswordID").setCustomValidity("");
    }
}

function editUserVerifyStreetAddress() {
    var theUserStreetAddress = document.editUserIntermediate.userStreetAddress.value;
    var theUserStreetAddressLength = theUserStreetAddress.length;
    
    if (theUserStreetAddressLength > 100) {
        document.getElementById("userStreetAddressID").setCustomValidity("Street Address must not be greater than 100 characters in size!");
    } 
    else {
        document.getElementById("userStreetAddressID").setCustomValidity("");
    }
}

function editUserVerifyCity() {
    var theUserCity = document.editUserIntermediate.userCity.value;
    var theUserCityLength = theUserCity.length;
    
    if (theUserCityLength > 50) {
        document.getElementById("userCityID").setCustomValidity("City must not be greater than 50 characters in size!");
    } 
    else {
        document.getElementById("userCityID").setCustomValidity("");
    }
}

function editUserVerifyPhone() {
    var theUserPhone = document.editUserIntermediate.userPhone.value;
    var theUserPhoneLength = theUserPhone.length;
    
    if (numericCheck(theUserPhone) === false) {
        document.getElementById("userPhoneID").setCustomValidity("Phone must be numeric!");
    }  
    else if (theUserPhoneLength > 10) {
        document.getElementById("userPhoneID").setCustomValidity("Phone must not be greater than 10 digits in size!");
    } 
    else {
        document.getElementById("userPhoneID").setCustomValidity("");
    }
}

function editUserVerifySecurityAnswer() {
    var theUserSecurityAnswer = document.editUserIntermediate.userSecurityAnswer.value;
    var theUserSecurityAnswerLength = theUserSecurityAnswer.length;
    
    if (theUserSecurityAnswerLength > 100) {
        document.getElementById("userSecurityAnswerID").setCustomValidity("Security Answer must not be greater than 100 characters in size!");
    } 
    else {
        document.getElementById("userSecurityAnswerID").setCustomValidity("");
    }
}

function editUserVerifyCreditCardNum() {
    var theUserCreditCardNum = document.editUserIntermediate.userCreditCardNum.value;
    var theUserCreditCardNumLength = theUserCreditCardNum.length;
    
    if (theUserCreditCardNumLength > 16) {
        document.getElementById("userCreditCardNumID").setCustomValidity("Credit Card Number must not be greater than 16 digits in size!");
    } 
    else {
        document.getElementById("userCreditCardNumID").setCustomValidity("");
    }
}

function editUserVerifyCreditCardExp() {
    var theUserCreditCardExp = document.editUserIntermediate.userCreditCardExp.value;
    var theUserCreditCardExpLength = theUserCreditCardExp.length;
    
    if (theUserCreditCardExpLength > 4) {
        document.getElementById("userCreditCardExpID").setCustomValidity("Credit Card Expiration must not be greater than 4 digits in size!");
    } 
    else {
        document.getElementById("userCreditCardExpID").setCustomValidity("");
    }
}

/* Function to check if input is numeric */
function numericCheck(inputString) {
    return /^[0-9]+$/.test(inputString);
}

function emailCheck(inputString) {
    var sebastiansPatentedEmailRegex = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    return sebastiansPatentedEmailRegex.test(inputString);
}

function passwordCheck(inputString) {
    var sebastiansPatentedPasswordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
    return sebastiansPatentedPasswordRegex.test(inputString);
}