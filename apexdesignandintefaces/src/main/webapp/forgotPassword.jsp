<%-- 
    Document   : forgotPassword
    Created on : Mar 31, 2021, 1:50:32 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Forgot Password</title>
        <%@include file="header.jsp" %>
        <script>
            $("#portals").show();
            $("#logout").hide();
        </script>
        <%            String returnedQuestion = (String) session.getAttribute("tempMessage");
                      String tempEmail = (String) session.getAttribute("tempEmail");
                      DBConnect dbConnect = new DBConnect();
        %>
    </head>
    <body>
        <div class="w3-card-4 w3-margin">
            <div class="w3-container w3-theme w3-center"><h1>Forgot Password</h1></div>
            <div class="w3-row w3-padding-64">
                <div class="w3-col s3"><br></div>
                <div class="w3-col s6 w3-card-4 w3-padding-64 w3-center w3-margin">
                    <%
                        //form that reveals itself when the users question has been fetched using their email
                        if (returnedQuestion == null) {
                            out.println("<form action='forgotPasswordAction.jsp' method='POST'>"
                                    + "<h2 class='w3-center w3-padding'>Please enter your email</h2>"
                                    + "<input class='w3-padding w3-center w3-large' type='text' name='userEmail' id='userEmail'><br><br>"
                                    + "<button class='w3-button w3-center w3-round-xxlarge w3-theme' type='submit'>Get Security Question</button></form>");
                        }
                        else if (returnedQuestion != null) {
                            out.println("<form action='resetPassword.jsp' method='POST'>"
                                    + "<h2 class='w3-center w3-padding'>" + returnedQuestion + "</h2>"
                                    + "<input class='w3-padding w3-center w3-large' type='text' name='givenAnswer' id='givenAnswer'><br><br>"
                                    + "<button class='w3-button w3-center w3-round-xxlarge w3-theme' type='submit'>Submit Answer</button></form>");
                        }
                        session.removeAttribute(returnedQuestion);
                     %>
                    <div class="w3-row-padding w3-center w3-red" id="error">
                    </div>
                </div>
                <div class="w3-col s3"><br></div>
            </div>
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>
