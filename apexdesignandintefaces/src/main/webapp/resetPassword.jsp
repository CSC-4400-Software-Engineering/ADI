<%-- 
    Document   : resetPassword
    Created on : Apr 2, 2021, 8:17:41 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <%@include file="header.jsp"%>
    </head>
    <body>
        <%            String userEmail = (String) session.getAttribute("tempEmail");
            String givenAnswer = request.getParameter("givenAnswer");
            DBConnect dbConnect = new DBConnect();
            String correctAnswer = dbConnect.stringFinder("select securityAnswer from user where email like '" + userEmail + "'");
            String customerName = dbConnect.stringFinder("select firstName from user where email like '" + userEmail + "'");

            if (!givenAnswer.equals(correctAnswer)) {
                response.sendRedirect("customerPortal.jsp?incorrect");
            }
            
        %>
        <div class='w3-card-4 w3-margin'>
            <div class='w3-container w3-theme w3-center'><h1>Forgot Password</h1></div>
            <div class='w3-row w3-padding-64'>
                <div class='w3-col s3'><br></div>
                <div class='w3-col s6 w3-card-4 w3-padding-64 w3-center w3-margin'>
                    <form action='resetPasswordAction.jsp' method='POST' onsubmit="return passwordValid()">
                        <h2 class='w3-center w3-padding'>Please enter a new password</h2>
                        <input class='w3-padding w3-center w3-large' type='password' name='password' id='password'><br><br>
                        <h2 class='w3-center w3-padding'>Please confirm your password</h2>
                        <input class='w3-padding w3-center w3-large' type='password' name='confirmedPassword' id='confirmedPassword'>
                        <br><br>
                        <button class='w3-button w3-center w3-round-xxlarge w3-theme' type='submit'>Get Security Question</button>
                    </form><br><br>
                    <div class="w3-row-padding w3-center w3-red" id="error"></div>
                </div>
                <div class='w3-col s3'><br></div>
            </div>
        </div>

        <%session.removeAttribute("tempMessage");%>
        <%@include file="footer.jsp" %>
    </body>
</html>