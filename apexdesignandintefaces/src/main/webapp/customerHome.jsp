<%-- 
    Document   : customerHome
    Created on : Mar 26, 2021, 9:59:43 PM
    Author     : Sebastian
--%>
<%@page import="myBeans.DBConnect"%>
<html>
    <head>
        <title>Customer Home</title>
        <%@include file="header.jsp" %>
        <%            if (logged == null || !logged.equals("1")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
    </head>
    <body>
        <div class="flexcontent">
            <%
                DBConnect dbConnect = new DBConnect();

                String firstName = dbConnect.stringFinder("select firstName from user where email like '" + email + "'");
                String lastName = dbConnect.stringFinder("select lastName from user where email like '" + email + "'");
                String phone = dbConnect.stringFinder("select phone from user where email like '" + email + "'");
                String streetAddress = dbConnect.stringFinder("select streetAddress from user where email like '" + email + "'");
                String city = dbConnect.stringFinder("select city from user where email like '" + email + "'");
                String state = dbConnect.stringFinder("select state from user where email like '" + email + "'");
                String creditCardNum = dbConnect.stringFinder("select creditCardNum from user where email like '" + email + "'");
                String creditCardExp = dbConnect.stringFinder("select creditCardExp from user where email like '" + email + "'");
            %>

            <div class="w3-container w3-padding-64 w3-margin">
                <div class="w3-col s3"><br></div>
                <div class="w3-col s6">
                    <div class="w3-card-4 w3-margin">
                        <div class="w3-container w3-theme w3-center"><h1>Customer Home</h1></div>
                        <div class="w3-row">
                            <div class="w3-col w3-center s6 w3-padding">
                                <div class="w3-container w3-center w3-theme w3-width"><h2>Personal Information</h2></div>
                                <div class="w3-container w3-padding-32">
                                    <h4 class="w3-left-align">
                                        Name: <%=firstName + " " + lastName%><br>
                                        Email: <%=email%><br>
                                        Phone Number: <%=phone%><br>
                                        Address: <%=streetAddress + ", " + city + ", " + state%><br>
                                    </h4>
                                </div>
                                <div class="w3-row-padding w3-center w3-red" id="error"></div>
                            </div>
                            <div class="w3-col w3-center s6 w3-padding">
                                <div class="w3-container w3-center w3-theme w3-width"><h2>Billing and Orders</h2></div>
                                <div class="w3-container w3-padding-32">
                                    <h4 class="w3-left-align">
                                        Credit Card: <%=creditCardNum%><br>
                                        Credit Card Expiration Date: <%=creditCardExp%><br>
                                    </h4>
                                </div>
                                <a href="orderHistory.jsp" class="w3-button w3-round-xxlarge w3-theme w3-center">Order History</a>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
            <div class="w3-col s3"><br></div>
        </div>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
