<%@page import="myBeans.DBConnect"%>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <title>Test</title>
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
    </head>
    <body>
        <div class="w3-row">
            <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Test</h1>
                        <div class="w3-container w3-padding">
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <ul>
                                        <%
                                            String userIDInput = request.getParameter("userID");

                                            /* Strip any potential whitespace just to be safe */
                                            
                                            userIDInput = userIDInput.trim();
                                            String userFirstNameInput = request.getParameter("userFirstName");
                                            String userLastNameInput = request.getParameter("userLastName");
                                            String userEmailInput = request.getParameter("userEmail");
                                            //String userPasswordInput = request.getParameter("userPassword");
                                            String userStreetAddressInput = request.getParameter("userStreetAddress");
                                            String userCityInput = request.getParameter("userCity");
                                            String userStateInput = request.getParameter("userState");
                                            String userPhoneInput = request.getParameter("userPhone");
                                            String userSecurityQuestionInput = request.getParameter("userSecurityQuestion");
                                            String userSecurityAnswerInput = request.getParameter("userSecurityAnswer");
                                            String userUserTypeInput = request.getParameter("userUserType");
                                            String userCreditCardNumInput = request.getParameter("userCreditCardNum");
                                            String userCreditCardExpInput = request.getParameter("userCreditCardExp");

                                            String sqlInput = "UPDATE user SET firstName = '" + userFirstNameInput + "', lastName = '" + userLastNameInput + "', email = '"
                                                    + userEmailInput + "', streetAddress = '" + userStreetAddressInput + "', city = '"
                                                    + userCityInput + "', state = '" + userStateInput + "', phone = '"
                                                    + userPhoneInput + "', securityQuestion = '"
                                                    + userSecurityQuestionInput + "', securityAnswer = '"
                                                    + userSecurityAnswerInput + "', userType = '"
                                                    + userUserTypeInput + "', creditCardNum = '"
                                                    + userCreditCardNumInput + "', creditCardExp = '"
                                                    + userCreditCardExpInput + "' WHERE userID LIKE '" + userIDInput + "'";

                                            DBConnect dbConnect = new DBConnect();
                                            String connectMessage = dbConnect.insertData(sqlInput);
                                            out.print("<li>First Name: <b>" + userFirstNameInput + "</b></li>");
                                            out.print("<li>Last Name: <b>" + userLastNameInput + "</b></li>");
                                            out.print("<li>Email: <b>" + userEmailInput + "</b></li>");
                                            //out.print("<li>Password: <b>" + userPasswordInput + "</b></li>");
                                            out.print("<li>Street Address: <b>" + userStreetAddressInput + "</b></li>");
                                            out.print("<li>City: <b>" + userCityInput + "</b></li>");
                                            out.print("<li>State: <b>" + userStateInput + "</b></li>");
                                            out.print("<li>Phone: <b>" + userPhoneInput + "</b></li>");
                                            out.print("<li>Security Question: <b>" + userSecurityQuestionInput + "</b></li>");
                                            out.print("<li>Security Answer: <b>" + userSecurityAnswerInput + "</b></li>");
                                            out.print("<li>User Type: <b>" + userUserTypeInput + "</b></li>");
                                            out.print("<li>Credit Card Number: <b>" + userCreditCardNumInput + "</b></li>");
                                            out.print("<li>Credit Card Expiration: <b>" + userCreditCardExpInput + "</b></li>");

                                            if (connectMessage.equals("Closed")) {
                                                out.println("<li class='my-2'><b>Success!</b></li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>