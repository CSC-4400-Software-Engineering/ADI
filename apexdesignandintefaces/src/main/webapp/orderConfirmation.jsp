<%-- 
    Document   : orderConfirmation
    Created on : Mar 21, 2021, 9:26:04 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <title>Order Confirmation</title>
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
        <%            
            DBConnect dbConnect = new DBConnect();
            String userEmail = request.getParameter("email");
            String currentBrand;
            String currentModel;
            String currentPrice;

            //grab comma separated list. They're grouped by 2, anything with an even index is the productID
            //anything with an odd index is the cooresponding quantity for that item
            String productSQL = request.getParameter("productSQL");

            //because of the way the list is built, it ends with a comma. This must be chopped off at the end
            int index = productSQL.length() - 1;
            productSQL = productSQL.substring(0, index) + ' ' + productSQL.substring(index + 1);

            //we must also grab the userID so it can go in the database.
            //if there is no user logged in, set it to the guest
            String currentUserID;
            if (session.getAttribute("email") != null) {
                currentUserID = dbConnect.fetchInfo("select userID from user where email like '" + session.getAttribute("email") + "'");
            } else {
                currentUserID = "1";
            }

            //first, the order must created with the cooreseponding time stamp  
            //(prebuilt function), and the userID specified above.
            dbConnect.insertData("INSERT INTO onlineorder (orderID, userID, timeStamp) VALUES (0, " + currentUserID + ", CURRENT_TIMESTAMP)");

            //now grab that orderID from the database (most recent entry w/cooresponding userID
            String currentOrder = dbConnect.fetchInfo("SELECT max(orderID) FROM `onlineorder` where userID = '" + currentUserID + "'");

            //this takes our productSQL string and treated it like a list split by commas.
            //it breaks it up into the list variable 'result'
            List<String> result = Arrays.asList(productSQL.split("\\s*,\\s*"));

            //iterate through the array in the groups of 2, add products and 
            //quantity to many-to-many table by creating dbConnect statements
            for (int i = 0; i < result.size(); i += 2) {
                
                currentBrand = dbConnect.fetchInfo("SELECT brand FROM product WHERE productID LIKE '" + result.get(i) + "'");
                currentModel = dbConnect.fetchInfo("SELECT model FROM product WHERE productID LIKE '" + result.get(i) + "'");
                currentPrice = dbConnect.fetchInfo("SELECT price FROM product WHERE productID LIKE '" + result.get(i) + "'");
                
                dbConnect.insertData("INSERT INTO onlineorderproduct (orderID, productID, currentBrand, currentModel, currentPrice, quantity) VALUES (" + currentOrder + ", " + result.get(i) + ", '" + currentBrand + "', '" + currentModel + "', '" + currentPrice + "', " + result.get(i + 1) + ")");
            }
        %>
        <div class="w3-padding">
            <div class="w3-card-4 w3-margin">

                <h1 class="w3-center w3-container w3-theme-d3 w3-padding"><b>Order Confirmed!</b></h1>
                <h3 class="w3-padding">
                    Your order has been sent in for processing. We will send a follow up email to <%=userEmail%>.<br>
                    Please wait 3-5 business days to check that your payment has gone through. 
                </h3>  
            </div> 
        </div>
        <script>
            localStorage.clear();
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>