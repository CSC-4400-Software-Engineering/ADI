<%-- 
    Document   : customer
    Created on : Mar 17, 2021, 10:49:53 AM
    Author     : Sebastian
--%>
<html>
    <head>
        <title>Customer Portal</title>
        <%@include file="header.jsp" %>
        <script>
            $("#portals").show(); //this shows the boxes that say admin and customer
            $("#logout").hide(); //this hides the one that says welcome to whoever is logged in
        </script>
    </head>
    <body>
        <div class="w3-row">
            <p><br></p>
            <div class="w3-twothird w3-padding">
                <div class="w3-card-4">
                    <div class="w3-container w3-theme-d4">
                        <h2>Sign Up</h2>
                    </div>
                    <form name="customerSignUpForm" action="customerAction.jsp" class="w3-container" method="get" onsubmit="return (customerSignUp() && validate())">

                        <div class="w3-row-padding">
                            <h4><b>Basic Information</b></h4>
                        </div>
                        <div class="w3-row-padding">
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="firstName" type="text" id="firstName" required>
                                    <label>First Name</label></p>   
                            </div>
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="lastName" type="test" id="lastName" required>
                                    <label>Last Name</label></p>    
                            </div>
                        </div>

                        <div class="w3-row-padding">
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="email" type="email" id="email" required>
                                    <label>Email</label></p>
                            </div>
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="confirmedEmail" type="email" id="confirmedEmail" required>
                                    <label>Confirm Email</label></p>    
                            </div>
                        </div>

                        <div class="w3-row-padding">
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="password" type="password" id="password" placeholder="8-30 characters, capital, lowercase, number" required>
                                    <label>Create Password</label></p>
                            </div>
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="confirmedPassword" type="password" id="confirmedPassword" required>
                                    <label>Confirm Password</label></p>    
                            </div>
                        </div>


                        <div class="w3-row-padding">
                            <h4><b>Shipping Information</b></h4>
                        </div>

                        <div class="w3-row-padding">
                            <div class="w3-col s4">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="streetAddress" type="text" id="streetAddress" placeholder="Street Address" required>
                                    <label>Street Address</label>    
                                </p>
                            </div>
                            <div class="w3-col s4">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="city" type="text" id="city"required>
                                    <label>City</label>
                                </p>
                            </div>
                            <div class="w3-col s4">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="state" type="text" id="state" required>
                                    <label>State</label>
                                </p>
                            </div>
                        </div>

                        <div class="w3-row-padding">
                            <div class="w3-col s6">
                                <p>
                                    <select class="w3-select w3-border w3-round w3-light-grey" name="securityQuestion" id="securityQuestion" required>
                                        <option disabled selected value="">Select Option</option>
                                        <option>What is your Fathers middle name?</option>
                                        <option>What is your Mothers maiden name?</option>
                                        <option>What was the name of the street you grew up on?</option>
                                        <option>Where did you go to second grade?</option>
                                        <option>What is the name of your first pet?</option>
                                    </select>
                                    <label>Security Question</label>
                                </p>
                            </div>
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="securityAnswer" type="text" id="securityAnswer" required>
                                    <label>Security Question Answer</label></p>    
                            </div>
                        </div>

                        <div class="w3-row-padding">
                            <h4><b>Billing Information (For Future Orders)</b></h4>
                        </div>

                        <div class="w3-row-padding">
                            <div class="w3-col s8">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="creditCardNum" type="text" id="creditCardNum"  required>
                                    <label>Credit Card Number</label>
                                </p>
                            </div>
                            <div class="w3-col s2">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="expiration" type="text" id="creditCardExp" required>
                                    <label>Expiration Date</label>
                                </p>
                            </div>   
                            <div class="w3-col s2">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="CVV" type="text" id="CVV" required>
                                    <label>CVV</label>
                                </p>
                            </div>
                        </div>

                        <div class="w3-row-padding w3-center w3-red" id="error">
                        </div>
                        <div class="w3-row">
                            <div class="w3-col s6 w3-padding">
                                <button class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset">Clear</button>
                            </div>
                            <div class="w3-col s6 w3-padding">
                                <button class="w3-button w3-block w3-section w3-green w3-ripple w3-padding"type="submit">Send</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>  

            <p><br></p>
            <div class="w3-third w3-padding">
                <div class="w3-card-4">
                    <div class="w3-container w3-theme-d4">
                        <h2>Login to Your Account</h2>
                    </div>
                    <form name="customerLogInForm" action="customerLogInAction.jsp" class="w3-container" method="get" onsubmit="return customerLogIn()">
                        <div class="w3-row-padding">
                            <div class="w3-row">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="logInEmail" type="email" id="logInEmail" required>
                                    <label>Email</label></p>
                            </div>
                        </div>
                        <div class="w3-row-padding">
                            <div class="w3-row">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="logInPassword" type="password" id="logInPassword" required>
                                    <label>Password</label></p>
                            </div>
                        </div>
                        <div class="w3-row-padding w3-center" id="logInError">
                        </div>
                        <div class="w3-row w3-padding">
                            <a class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" href="customerForgotPassword.jsp" type="button">Forgot Password</a>
                        </div>

                        <div class="w3-row">
                            <div class="w3-col s6 w3-padding">
                                <button class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset">Clear</button>
                            </div>
                            <div class="w3-col s6 w3-padding">
                                <button class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit">Login</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>  
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
