<%@page import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit User</title>
    </head>
    <body>
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

            if (connectMessage.equals("Closed")) {
                response.sendRedirect("administrator.jsp?editUserMessage=User edited!");
            }
        %>
    </body>
</html>
