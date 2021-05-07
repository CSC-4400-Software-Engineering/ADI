/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function switchForms() {
    var x = document.getElementById("signUpForm");
    var y = document.getElementById("signInForm");

    if (x.style.display === "none") {
        x.style.display = "block";
        y.style.display = "none";
    } else {
        x.style.display = "none";
        y.style.display = "block";
    }
}

function signUpFirst() {
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var phone = document.getElementById("phone").value;
    var phoneRegex = /^\d{10}$/;
    var streetAddress = document.getElementById("streetAddress").value;
    var city = document.getElementById("city").value;
    var creditCardNum = document.getElementById("creditCardNum").value;
    var creditCardRegex = /^\d{16}$/;
    var creditCardExp = document.getElementById("creditCardExp").value;
    var expRegex = /^([1][0-2]|[0][1-9])([2][1-9])$/;
    var error = document.getElementById("error");
    
    if (firstName.length > 50) {
        error.innerHTML = "Please limit first name to only 50 Characters";
        return false;
    }
    if (lastName.length > 50) {
        error.innerHTML = "Please limit last name to only 50 Characters";
        return false;
    }
    if (phone.length > 10 || !phoneRegex.test(phone)) {
        error.innerHTML = "Phone number invalid, please enter 10 digit phone numbers only";
        return false;
    }
    if (streetAddress.length > 100) {
        error.innerHTML = "Please limit street address to 100 characters";
        return false;
    }
    if (city.length > 50) {
        error.innerHTML = "Please limit city to 50 characters";
        return false;
    }
    if (!creditCardRegex.test(creditCardNum)) {
        error.innerHTML = "Please enter valid 16 digit credit card number";
        return false;
    }
    if (!expRegex.test(creditCardExp)) {
        error.innerHTML = "Please enter valid expiration date as 4 digit number";
        return false;
    }
    return true;
}

function signUpSecond() {
    var email = document.getElementById("userEmail").value;
    var confirmedEmail = document.getElementById("confirmedEmail").value;
    var password = document.getElementById("password").value;
    var confirmedPassword = document.getElementById("confirmedPassword").value;
    var error = document.getElementById("error");
    var emailregex = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    var passwordregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;

    //check that the emails match
    if (email !== confirmedEmail)
    {
        error.innerHTML = "Emails do not match";
        return false;
    }

    //check that the email is valid
    else if (!emailregex.test(email))
    {
        error.innerHTML = "Email is not valid";
        return false;
    }

    //check that the passwords match
    else if (password !== confirmedPassword)
    {
        error.innerHTML = "Passwords do not match";
        return false;
    }
    //check that the passwords are 
    else if (!passwordregex.test(password))
    {
        error.innerHTML = "Password isn't valid format";
        return false;
    }

    return true;
}

function signIn()
{
    var email = document.getElementById("signInEmail").value;
    var password = document.getElementById("signInPassword").value;
    var errorBlock = document.getElementById("logInError");
    var emailregex = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    var passwordregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;

    if (!emailregex.test(email)) {
        errorBlock.innerHTML = "Email is not valid";
        return false;
    }

    if (!passwordregex.test(password)) {
        errorBlock.innerHTML = "Password is not valid";
        return false;
    }

    return true;
}

function passwordValid()
{
    var password = document.getElementById("password").value;
    var confirmedPassword = document.getElementById("confirmedPassword").value;
    var errorBlock = document.getElementById("error");
    var passwordregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;

    //check that the passwords match
    if (password !== confirmedPassword)
    {
        errorBlock.innerHTML = "Passwords do not match";
        return false;
    }
    //check that the passwords are 
    else if (!passwordregex.test(password))
    {
        errorBlock.innerHTML = "Password isn't valid format";
        return false;
    }

    return true;
    return true;
}

function verifyFirst() {
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var email = document.getElementById("email").value;
    var emailRegex = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/;
    var creditCardNum = document.getElementById("creditCardNum").value;
    var creditCardRegex = /^\d{16}$/;
    var creditCardExp = document.getElementById("creditCardExp").value;
    var expRegex = /^([1][0-2]|[0][1-9])([2][1-9])$/;
    var CVV = document.getElementById("CVV").value;
    var CVVRegex = /^\d{3}$/;
    var error = document.getElementById("error");

    if (firstName.length > 50) {
        error.innerHTML = "Please limit first name to only 50 Characters";
        return false;
    }
    if (lastName.length > 50) {
        error.innerHTML = "Please limit last name to only 50 Characters";
        return false;
    }
    if (!emailRegex.test(email) || email.length > 100) {
        error.innerHTML = "Email is not valid";
        return false;
    }
    if (!creditCardRegex.test(creditCardNum)) {
        error.innerHTML = "Please enter valid 16 digit credit card number";
        return false;
    }
    if (!expRegex.test(creditCardExp)) {
        error.innerHTML = "Please enter valid expiration date as 4 digit number";
        return false;
    }
    if (!CVVRegex.test(CVV)) {
        error.innerHTML = "Please enter valid 3 digit security code";
        return false;
    }
    return true;
}

function verifySecond() {
    var phone = document.getElementById("phoneNumber").value;
    var phoneRegex = /^\d{10}$/;
    var streetAddress = document.getElementById("streetAddress").value;
    var city = document.getElementById("city").value;
    var error = document.getElementById("error");

    if (phone.length > 10 || !phoneRegex.test(phone)) {
        error.innerHTML = "Phone number invalid, please enter 10 digit phone numbers only";
        return false;
    }
    if (streetAddress.length > 100) {
        error.innerHTML = "Please limit street address to 100 characters";
        return false;
    }
    if (city.length > 50) {
        error.innerHTML = "Please limit city to 50 characters";
        return false;
    }
}