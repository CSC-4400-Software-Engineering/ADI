<%-- 
    Document   : forgotPassword
    Created on : Mar 31, 2021, 1:50:32 PM
    Author     : Sebastian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Customer Home</title>
        <%@include file="header.jsp" %>
        <script>
            $("#portals").show();
            $("#logout").hide();
        </script>
    </head>
    <body>
        <div class="w3-card-4 w3-margin">
            <div class="w3-container w3-theme w3-center"><h1>Forgot Password</h1></div>
            <div class="w3-row w3-padding-64">
                <div class="w3-col s3"><br></div>
                <div class="w3-col s6 w3-card-4 w3-padding-64 w3-center w3-margin">
                    <h2 class="w3-center w3-padding">Please enter your email</h2>
                    <input class="w3-padding w3-center w3-large" type="text" name="userEmail" id="userEmail" value=""/><br><br>
                    <button class="w3-button w3-center w3-round-xxlarge w3-theme">Send Password Retrieval Email</button>
                </div>
                <div class="w3-col s3"><br></div>
            </div>
        </div>
       
        <%@include file="footer.jsp" %>
    </body>
</html>
