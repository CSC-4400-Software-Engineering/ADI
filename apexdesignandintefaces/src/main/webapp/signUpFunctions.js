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

function signUp() {
    var email = document.getElementById("userEmail").value;
    var confirmedEmail = document.getElementById("confirmedEmail").value;
    var password = document.getElementById("password").value;
    var confirmedPassword = document.getElementById("confirmedPassword").value;
    var errorBlock = document.getElementById("error");
    var emailregex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var passwordregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
    
    //check that the emails match
    if (email !== confirmedEmail)
    {
        errorBlock.innerHTML = "Emails do not match";
        return false;
    }
    
    //check that the email is valid
    else if (!emailregex.test(email))
    {
       errorBlock.innerHTML = "Email is not valid";
       return false;
    }
    
    //check that the passwords match
    else if (password !== confirmedPassword)
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
}

function signIn() 
{
    var email = document.getElementById("signInEmail").value;
    var password = document.getElementById("signInPassword").value;
    var errorBlock = document.getElementById("logInError");
    var emailregex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    var passwordregex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
    
    if (!emailregex.test(email)){
        errorBlock.innerHTML = "Email is not valid";
        return false;
    }
    
    if (!passwordregex.test(password)){
        errorBlock.innerHTML = "Password is not valid";
        return false;
    }
    
    return true;
}