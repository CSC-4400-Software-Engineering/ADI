<%-- 
    Document   : customer
    Created on : Mar 17, 2021, 10:49:53 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<html>
    <head>
        <title>Customer Portal</title>
        <%@include file="header.jsp" %>
        <script>
            $("#portals").show(); //this shows the boxes that say admin and customer
            $("#logout").hide(); //this hides the one that says welcome to whoever is logged in
            $("#signUpForm").show();
            $("#signInForm").hide();
        </script>
    </head>
    <body>
            <p><br></p>
            <div class="w3-padding w3-margin" id="signUpForm">
                <div class="w3-card-4">
                    <div class="w3-container w3-theme-d4">
                        <h2 class="w3-left">Sign Up</h2>
                        <h4 class="w3-right">Already have an account? <button onclick="switchForms()">&nbsp; Sign In &nbsp;</button></h4>
                    </div>
                    <form name="customerSignUp" action="customerSignUpAction.jsp" class="w3-container" method="get" onsubmit="return signUp()">

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
                                    <input class="w3-input w3-round w3-light-grey" name="lastName" type="text" id="lastName" required>
                                    <label>Last Name</label></p>    
                            </div>
                        </div>

                        <div class="w3-row-padding">
                            <div class="w3-col s6">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="userEmail" type="email" id="userEmail" required>
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
                            <div class="w3-col s3">
                                <p>
                                <input class="w3-input w3-round w3-light-grey" name="phone" type="number" id="phone" required></input>
                                <label>Phone Number</label>
                                </p>
                            </div>
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
                            <div class="w3-col s3">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="securityAnswer" type="text" id="securityAnswer" required>
                                    <label>Security Question Answer</label></p>    
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
                                     <select class="w3-select w3-border w3-round w3-light-grey" name="state" id="state" required>
                                        <option disabled selected value="">Select State</option>
                                        <option>Alabama</option>
                                        <option>Arizona</option>
                                        <option>Arkansas</option>
                                        <option>California</option>
                                        <option>Colorado</option>
                                        <option>Connecticut</option>
                                        <option>Delaware</option>
                                        <option>DC</option>
                                        <option>Florida</option>
                                        <option>Georgia</option>
                                        <option>Idaho</option>
                                        <option>Illinois</option>
                                        <option>Indiana</option>
                                        <option>Iowa</option>
                                        <option>Kansas</option>
                                        <option>Kentucky</option>
                                        <option>Louisiana</option>
                                        <option>Maine</option>
                                        <option>Maryland</option>
                                        <option>Massachusetts</option>
                                        <option>Michigan</option>
                                        <option>Minnesota</option>
                                        <option>Mississippi</option>
                                        <option>Missouri</option>
                                        <option>Montana</option>
                                        <option>Nebraska</option>
                                        <option>Nevada</option>
                                        <option>New Hampshire</option>
                                        <option>New Jersey</option>
                                        <option>New Mexico</option>
                                        <option>New York</option>
                                        <option>North Carolina</option>
                                        <option>North Dakota</option>
                                        <option>Ohio</option>
                                        <option>Oklahoma</option>
                                        <option>Oregon</option>
                                        <option>Pennsylvania</option>
                                        <option>Rhode Island</option>
                                        <option>South Carolina</option>
                                        <option>South Dakota</option>
                                        <option>Tennessee</option>
                                        <option>Texas</option>
                                        <option>Utah</option>
                                        <option>Vermont</option>
                                        <option>Virginia</option>
                                        <option>Washington</option>
                                        <option>West Virginia</option>
                                        <option>Wisconsin</option>
                                        <option>Wyoming</option>
                                    </select>
                                    <label>State</label>
                                </p>
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
                            <div class="w3-col s4">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="creditCardExp" type="text" id="creditCardExp" required>
                                    <label>Expiration Date</label>
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
                                <button class="w3-button w3-block w3-section w3-green w3-ripple w3-padding"type="submit">Sign Up</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>  

            <p><br></p>
            <div class="w3-padding w3-row" id="signInForm" style="display: none;">
                <div class="w3-col s3"><br></div>
                <div class="w3-card-4 w3-margin w3-col s6">
                    <div class="w3-container w3-theme-d4">
                        <h2 class="w3-left">Login to Your Account</h2>
                        <h4 class="w3-right">Don't have an account? <button onclick="switchForms()">&nbsp; Sign Up &nbsp;</button></h4>
                    </div>
                    <form name="customerSignInForm" action="signInAction.jsp" class="w3-container" method="post" onsubmit="return signIn()">
                        <br>
                        <div class="w3-row-padding">
                            <div class="w3-row">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="signInEmail" type="email" id="signInEmail" required>
                                    <label>Email</label></p>
                            </div>
                        </div>
                        <div class="w3-row-padding">
                            <div class="w3-row">
                                <p>
                                    <input class="w3-input w3-round w3-light-grey" name="signInPassword" type="password" id="signInPassword" required>
                                    <label>Password</label></p>
                            </div>
                        </div>
                        <div class="w3-row-padding w3-center" id="logInError">
                        </div>
                        <div class="w3-row w3-padding">
                            <a class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" href="forgotPassword.jsp" type="button">Forgot Password</a>
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
                <div class="w3-col s3"><br></div>
            </div>  
       
        <%@include file="footer.jsp" %>
    </body>
</html>
