<%-- 
    Document   : customerSignUpAction
    Created on : Mar 26, 2021, 5:51:17 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<html>
    <head>
        <title>Sign Up Action</title>
        <%@include file="header.jsp"%>
        <script>
            <%                
                if (logged == null || logged.equals("index")) {
                    out.print("$('#portals').show();");
                    out.print("$('#logout').hide();");
                } 
                else if (logged.equals("index") == false) {
                    out.print("$('#portals').hide();");
                    out.print("$('#logout').show();");
                }
            %>
        </script>
    </head>
    <body>
        <div class="flexcontent">
            <br>
            <%            
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String userEmail = request.getParameter("userEmail");
                String password = request.getParameter("password");
                String phone = request.getParameter("phone");
                String question = request.getParameter("securityQuestion");
                String answer = request.getParameter("securityAnswer");
                String streetAddress = request.getParameter("streetAddress");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String creditCardNum = request.getParameter("creditCardNum");
                String creditCardExp = request.getParameter("creditCardExp");

                String sql = "insert into user (firstName, lastName, email, password, phone, securityQuestion, securityAnswer, streetAddress, city, state, creditCardNum, creditCardExp, userType) "
                        + "values ('" + firstName + "', '" + lastName + "', '" + userEmail + "', '" + password + "', '" + phone + "', '" + question + "', '" + answer + "', '" + streetAddress + "', '" + city + "', '" + state + "', '" + creditCardNum + "', '" + creditCardExp + "', '1')";//query statement for inserting customers input into DB
                DBConnect dbConnect = new DBConnect(); //java way of creating new class/variable of type "DBConnect" named dbConnect
            %>
            <br>
            <div class="w3-row-padding">
                <div class="w3-col s4"><br></div>
                <div class="w3-col s4 w3-black w3-center">
                    <%if (dbConnect.insertData(sql) == "Closed") {
                            out.print("Success");
                        } else {
                            out.print(dbConnect.insertData(sql));
                        }%>
                </div>
                <div class="w3-col s4"><br></div>
            </div>
            <br>            
            <div class="w3-row-padding">
                <div class="w3-card-4">
                    <div class="w3-container w3-theme-d4">
                        <h3>Customer Registration Message</h3>
                    </div>

                    <div class='w3-row-padding'>
                        <h3>If you have encountered an error, go back and try again. If the registration was successful, the black box above will say the word "Success". If so, go back to the Customer Portal and attempt to log in.</h3>
                    </div>
                    <div class="w3-row-padding">
                        <div class="w3-col s4"><br></div>
                        <div class="w3-col s4">
                            <a href="loginPortal.jsp" class="w3-button w3-theme-d2">Go Back to the Customer Portal</a>
                        </div>
                        <div class="w3-col s4"><br></div>  
                    </div> 
                    <br>
                </div>
            </div>
            <br><br>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
