<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Edit User</title>
        <%@include file="header.jsp" %>
        <%            
            if (logged == null || !logged.equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
        <script src="otherScripts.js"></script>
    </head>
    <body>
        <div class="flexcontent">
            <%
                int dropDownID = Integer.parseInt(request.getParameter("userDropDown"));

                DBConnect dbConnect = new DBConnect();
                String currentUserFirstNameSqlInput = "SELECT firstName FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserLastNameSqlInput = "SELECT lastName FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserEmailSqlInput = "SELECT email FROM user WHERE userID LIKE '" + dropDownID + "'";
                //String currentUserPasswordSqlInput = "SELECT password FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserStreetAddressSqlInput = "SELECT streetAddress FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserCitySqlInput = "SELECT city FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserStateSqlInput = "SELECT state FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserPhoneSqlInput = "SELECT phone FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserSecurityQuestionSqlInput = "SELECT securityQuestion FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserSecuritAnswerSqlInput = "SELECT securityAnswer FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserUserTypeSqlInput = "SELECT userType FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserCreditCardNumSqlInput = "SELECT creditCardNum FROM user WHERE userID LIKE '" + dropDownID + "'";
                String currentUserCreditCardExpSqlInput = "SELECT creditCardExp FROM user WHERE userID LIKE '" + dropDownID + "'";

                String currentUserFirstName = dbConnect.fetchInfo(currentUserFirstNameSqlInput);
                String currentUserLastName = dbConnect.fetchInfo(currentUserLastNameSqlInput);
                String currentUserEmail = dbConnect.fetchInfo(currentUserEmailSqlInput);
                //String currentUserPassword = dbConnect.fetchInfo(currentUserPasswordSqlInput);
                String currentUserStreetAddress = dbConnect.fetchInfo(currentUserStreetAddressSqlInput);
                String currentUserCity = dbConnect.fetchInfo(currentUserCitySqlInput);
                String currentUserState = dbConnect.fetchInfo(currentUserStateSqlInput);
                String currentUserPhone = dbConnect.fetchInfo(currentUserPhoneSqlInput);
                String currentUserSecurityQuestion = dbConnect.fetchInfo(currentUserSecurityQuestionSqlInput);
                String currentUserSecurityAnswer = dbConnect.fetchInfo(currentUserSecuritAnswerSqlInput);
                String currentUserUserType = dbConnect.fetchInfo(currentUserUserTypeSqlInput);
                String currentUserCreditCardNum = dbConnect.fetchInfo(currentUserCreditCardNumSqlInput);
                String currentUserCreditCardExp = dbConnect.fetchInfo(currentUserCreditCardExpSqlInput);

            %>
            <div class="container">
                <div class="w3-col m6">
                    <div class="w3-padding">
                        <div class="w3-card-4">
                            <h1 class="w3-container w3-theme-d4">Edit User</h1>
                            <%                            
                                if (testEnable == true) {
                                    out.println("<form name='editUserIntermediate' action='editUserIntermediateActionTest.jsp' method='POST' class'w3-container w3-padding'>");
                                } 
                                else {
                                    out.println("<form name='editUserIntermediate' action='editUserIntermediateAction.jsp' method='POST' class='w3-container w3-padding'>");
                                }
                            %>
                            <input type="hidden" name="userID" value="<%out.println(dropDownID);%>">
                            <div class="w3-row-padding">
                                <div class="w3-col s6">
                                    <label>First Name</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userFirstName" id="userFirstNameID" size="50" value="<%out.println(currentUserFirstName);%>" onInput="editUserVerifyFirstName()"/>
                                </div>

                                <div class="w3-col s6">
                                    <label>Last Name</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userLastName" id="userLastNameID" size="50" value="<%out.println(currentUserLastName);%>" onInput="editUserVerifyLastName()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Email</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userEmail" id="userEmailID" size="100" value="<%out.println(currentUserEmail);%>" onInput="editUserVerifyEmail()"/>
                                </div>
                            </div>
                            <!--
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Password</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userPassword" id="userPasswordID" size="30" value="%out.println(currentUserPassword);%" onInput="editUserVerifyPassword()"/>
                                </div>
                            </div> 
                            -->
                            <div class="w3-row-padding">
                                <div class="w3-col s4">
                                    <label>Street Address</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userStreetAddress" id="userStreetAddressID" size="100" value="<%out.println(currentUserStreetAddress);%>" onInput="editUserVerifyStreetAddress()"/>
                                </div>
                                <div class="w3-col s4">
                                    <label>City</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userCity" id="userCityID" size="50" value="<%out.println(currentUserCity);%>" onInput="editUserVerifyCity()"/>
                                </div>
                                <div class="w3-col s4">
                                    <label>State</label>
                                    <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="userState">
                                        <!-- The following code was generated using python, as I was too lazy to write it myself. lol -->
                                        <option <% if (currentUserState.equals("Alabama")) {
                                                out.println("selected");
                                            } %>>Alabama</option>
                                        <option <% if (currentUserState.equals("Alaska")) {
                                                out.println("selected");
                                            } %>>Alaska</option>
                                        <option <% if (currentUserState.equals("Arizona")) {
                                                out.println("selected");
                                            } %>>Arizona</option>
                                        <option <% if (currentUserState.equals("Arkansas")) {
                                                out.println("selected");
                                            } %>>Arkansas</option>
                                        <option <% if (currentUserState.equals("California")) {
                                                out.println("selected");
                                            } %>>California</option>
                                        <option <% if (currentUserState.equals("Colorado")) {
                                                out.println("selected");
                                            } %>>Colorado</option>
                                        <option <% if (currentUserState.equals("Connecticut")) {
                                                out.println("selected");
                                            } %>>Connecticut</option>
                                        <option <% if (currentUserState.equals("Delaware")) {
                                                out.println("selected");
                                            } %>>Delaware</option>
                                        <option <% if (currentUserState.equals("Washington, D.C.")) {
                                                out.println("selected");
                                            } %>>Washington, D.C.</option>
                                        <option <% if (currentUserState.equals("Florida")) {
                                                out.println("selected");
                                            } %>>Florida</option>
                                        <option <% if (currentUserState.equals("Georgia")) {
                                                out.println("selected");
                                            } %>>Georgia</option>
                                        <option <% if (currentUserState.equals("Hawaii")) {
                                                out.println("selected");
                                            } %>>Hawaii</option>
                                        <option <% if (currentUserState.equals("Idaho")) {
                                                out.println("selected");
                                            } %>>Idaho</option>
                                        <option <% if (currentUserState.equals("Illinois")) {
                                                out.println("selected");
                                            } %>>Illinois</option>
                                        <option <% if (currentUserState.equals("Indiana")) {
                                                out.println("selected");
                                            } %>>Indiana</option>
                                        <option <% if (currentUserState.equals("Iowa")) {
                                                out.println("selected");
                                            } %>>Iowa</option>
                                        <option <% if (currentUserState.equals("Kansas")) {
                                                out.println("selected");
                                            } %>>Kansas</option>
                                        <option <% if (currentUserState.equals("Kentucky")) {
                                                out.println("selected");
                                            } %>>Kentucky</option>
                                        <option <% if (currentUserState.equals("Louisiana")) {
                                                out.println("selected");
                                            } %>>Louisiana</option>
                                        <option <% if (currentUserState.equals("Maine")) {
                                                out.println("selected");
                                            } %>>Maine</option>
                                        <option <% if (currentUserState.equals("Maryland")) {
                                                out.println("selected");
                                            } %>>Maryland</option>
                                        <option <% if (currentUserState.equals("Massachusetts")) {
                                                out.println("selected");
                                            } %>>Massachusetts</option>
                                        <option <% if (currentUserState.equals("Michigan")) {
                                                out.println("selected");
                                            } %>>Michigan</option>
                                        <option <% if (currentUserState.equals("Minnesota")) {
                                                out.println("selected");
                                            } %>>Minnesota</option>
                                        <option <% if (currentUserState.equals("Mississippi")) {
                                                out.println("selected");
                                            } %>>Mississippi</option>
                                        <option <% if (currentUserState.equals("Missouri")) {
                                                out.println("selected");
                                            } %>>Missouri</option>
                                        <option <% if (currentUserState.equals("Montana")) {
                                                out.println("selected");
                                            } %>>Montana</option>
                                        <option <% if (currentUserState.equals("Nebraska")) {
                                                out.println("selected");
                                            } %>>Nebraska</option>
                                        <option <% if (currentUserState.equals("Nevada")) {
                                                out.println("selected");
                                            } %>>Nevada</option>
                                        <option <% if (currentUserState.equals("New Hampshire")) {
                                                out.println("selected");
                                            } %>>New Hampshire</option>
                                        <option <% if (currentUserState.equals("New Jersey")) {
                                                out.println("selected");
                                            } %>>New Jersey</option>
                                        <option <% if (currentUserState.equals("New Mexico")) {
                                                out.println("selected");
                                            } %>>New Mexico</option>
                                        <option <% if (currentUserState.equals("New York")) {
                                                out.println("selected");
                                            } %>>New York</option>
                                        <option <% if (currentUserState.equals("North Carolina")) {
                                                out.println("selected");
                                            } %>>North Carolina</option>
                                        <option <% if (currentUserState.equals("North Dakota")) {
                                                out.println("selected");
                                            } %>>North Dakota</option>
                                        <option <% if (currentUserState.equals("Ohio")) {
                                                out.println("selected");
                                            } %>>Ohio</option>
                                        <option <% if (currentUserState.equals("Oklahoma")) {
                                                out.println("selected");
                                            } %>>Oklahoma</option>
                                        <option <% if (currentUserState.equals("Oregon")) {
                                                out.println("selected");
                                            } %>>Oregon</option>
                                        <option <% if (currentUserState.equals("Pennsylvania")) {
                                                out.println("selected");
                                            } %>>Pennsylvania</option>
                                        <option <% if (currentUserState.equals("Rhode Island")) {
                                                out.println("selected");
                                            } %>>Rhode Island</option>
                                        <option <% if (currentUserState.equals("South Carolina")) {
                                                out.println("selected");
                                            } %>>South Carolina</option>
                                        <option <% if (currentUserState.equals("South Dakota")) {
                                                out.println("selected");
                                            } %>>South Dakota</option>
                                        <option <% if (currentUserState.equals("Tennessee")) {
                                                out.println("selected");
                                            } %>>Tennessee</option>
                                        <option <% if (currentUserState.equals("Texas")) {
                                                out.println("selected");
                                            } %>>Texas</option>
                                        <option <% if (currentUserState.equals("Utah")) {
                                                out.println("selected");
                                            } %>>Utah</option>
                                        <option <% if (currentUserState.equals("Vermont")) {
                                                out.println("selected");
                                            } %>>Vermont</option>
                                        <option <% if (currentUserState.equals("Virginia")) {
                                                out.println("selected");
                                            } %>>Virginia</option>
                                        <option <% if (currentUserState.equals("Washington")) {
                                                out.println("selected");
                                            } %>>Washington</option>
                                        <option <% if (currentUserState.equals("West Virginia")) {
                                                out.println("selected");
                                            } %>>West Virginia</option>
                                        <option <% if (currentUserState.equals("Wisconsin")) {
                                                out.println("selected");
                                            } %>>Wisconsin</option>
                                        <option <% if (currentUserState.equals("Wyoming")) {
                                                out.println("selected");
                                            } %>>Wyoming</option>
                                    </select>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Phone</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userPhone" id="userPhoneID" size="10" value="<%out.println(currentUserPhone);%>" onInput="editUserVerifyPhone()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s6">
                                    <label>Security Question</label>
                                    <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="userSecurityQuestion">
                                        <option <% if (currentUserSecurityQuestion.equals("What is your Fathers middle name?")) {
                                                out.println("selected");
                                            } %>>What is your Fathers middle name?</option>
                                        <option <% if (currentUserSecurityQuestion.equals("What is your Mothers maiden name?")) {
                                                out.println("selected");
                                            } %>>What is your Mothers maiden name?</option>
                                        <option <% if (currentUserSecurityQuestion.equals("What was the name of the street you grew up on?")) {
                                                out.println("selected");
                                            } %>>What was the name of the street you grew up on?</option>
                                        <option <% if (currentUserSecurityQuestion.equals("Where did you go to second grade?")) {
                                                out.println("selected");
                                            } %>>Where did you go to second grade?</option>
                                        <option <% if (currentUserSecurityQuestion.equals("What is the name of your first pet?")) {
                                                out.println("selected");
                                            } %>>What is the name of your first pet?</option>
                                    </select>
                                </div>
                                <div class="w3-col s6">
                                    <label>Security Answer</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userSecurityAnswer" id="userSecurityAnswerID" size="100" value="<%out.println(currentUserSecurityAnswer);%>" onInput="editUserVerifySecurityAnswer()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>User Type</label>
                                    <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="userUserType">
                                        <!-- 0 for Admin, 1 for customer -->
                                        <option value="0" <% if (currentUserUserType.equals("0")) {
                                                out.println("selected");
                                            } %>>Admin</option>
                                        <option value="1" <% if (currentUserUserType.equals("1")) {
                                                out.println("selected");
                                            } %>>Customer</option>
                                    </select>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s6">
                                    <label>Credit Card Number</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userCreditCardNum" id="userCreditCardNumID" size="16" value="<%out.println(currentUserCreditCardNum);%>" onInput="editUserVerifyCreditCardNum()"/>
                                </div>
                                <div class="w3-col s6">
                                    <label>Credit Card Expiration</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="userCreditCardExp" id="userCreditCardExpID" size="4" value="<%out.println(currentUserCreditCardExp);%>" onInput="editUserVerifyCreditCardExp()"/>
                                </div>
                            </div>
                            <br>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>