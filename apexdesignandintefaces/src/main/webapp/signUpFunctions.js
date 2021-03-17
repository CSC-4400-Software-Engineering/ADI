/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function validate()
{
    var password = document.getElementById("password").value;
    var confirmedPassword = document.getElementById("confirmedPassword").value;
    var errorElement = document.getElementById("error");
    var passwordregx = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
   
    if (!passwordregx.test(password))
    {
        errorElement.innerHTML = "Password is invalid";
        return false;
    }
    
    if (confirmedPassword != password) //this just checks if both text fields are the same. Using !== checks if the variable types are the same too but I was receiving errors with it
    {
        errorElement.innerHTML = "Passwords do not match";
        return false;
    }
    
    return true;
}

function customerSignUp(){
    var email = document.getElementById("email").value;
    var confirmedEmail = document.getElementById("confirmedEmail").value;
    var errorElement = document.getElementById("error");
    var emailregex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    
    if (!emailregex.test(email) || !emailregex.test(confirmedEmail))
    {
        errorElement.innerHTML = "Not a valid email";
        return false;
    }
    
    if (email != confirmedEmail)
    {
        errorElement.innerHTML = "Emails do not match";
        return false;
    }
    return true;
}