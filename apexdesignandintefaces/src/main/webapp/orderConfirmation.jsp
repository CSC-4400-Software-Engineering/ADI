<%-- 
    Document   : orderConfirmation
    Created on : Mar 21, 2021, 9:26:04 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
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
        <div class="flexcontent">
            <%
                DBConnect dbConnect = new DBConnect();
                String userEmail = request.getParameter("email");
                String currentUserID;
                String currentBrand;
                String currentModel;
                String currentPrice;
                String currentStock;

                //grab comma separated list. They're grouped by 2, anything with an even index is the productID
                //anything with an odd index is the cooresponding quantity for that item
                String productSQL = request.getParameter("productSQL");

                //because of the way the list is built, it ends with a comma. This must be chopped off at the end
                int index = productSQL.length() - 1;
                productSQL = productSQL.substring(0, index) + ' ' + productSQL.substring(index + 1);

                //this takes our productSQL string and treated it like a list split by commas.
                //it breaks it up into the list variable 'result'
                List<String> result = Arrays.asList(productSQL.split("\\s*,\\s*"));

                /* 
                 Priming stock read for the first product
                 Prevents floating orderIDs
                 */
                
                ArrayList<String> allowedProducts = new ArrayList<String>();
                ArrayList<String> unallowedProducts = new ArrayList<String>();
                
                
                for (int i = 0; i < result.size(); i += 2) {
                    
                    
                    currentStock = dbConnect.fetchInfo("SELECT stock FROM product WHERE productID LIKE '" + result.get(i) + "'");
                    
                    if (!(Integer.parseInt(result.get(i + 1)) > Integer.parseInt(currentStock))) {
                        allowedProducts.add(result.get(i));
                        allowedProducts.add(result.get(i + 1));
                        }
                    else {
                        unallowedProducts.add(result.get(i));
                        unallowedProducts.add(result.get(i + 1));
                        
                    }
                }

                if (!(allowedProducts.isEmpty())) {
                    //we must also grab the userID so it can go in the database.
                    //if there is no user logged in, set it to the guest
                    if (session.getAttribute("email") != null) {
                        currentUserID = dbConnect.fetchInfo("select userID from user where email like '" + session.getAttribute("email") + "'");
                    } 
                    else {
                        currentUserID = "1";
                    }

                    //first, the order must created with the cooreseponding time stamp  
                    //(prebuilt function), and the userID specified above.
                    dbConnect.insertData("INSERT INTO onlineorder (orderID, userID, timeStamp) VALUES (0, " + currentUserID + ", CURRENT_TIMESTAMP)");

                    //now grab that orderID from the database (most recent entry w/cooresponding userID
                    String currentOrder = dbConnect.fetchInfo("SELECT max(orderID) FROM `onlineorder` where userID = '" + currentUserID + "'");

                    //iterate through the array in the groups of 2, add products and 
                    //quantity to many-to-many table by creating dbConnect statements
                    for (int i = 0; i < allowedProducts.size(); i += 2) {

                        currentBrand = dbConnect.fetchInfo("SELECT brand FROM product WHERE productID LIKE '" + allowedProducts.get(i) + "'");
                        currentModel = dbConnect.fetchInfo("SELECT model FROM product WHERE productID LIKE '" + allowedProducts.get(i) + "'");
                        currentPrice = dbConnect.fetchInfo("SELECT price FROM product WHERE productID LIKE '" + allowedProducts.get(i) + "'");
                        currentStock = dbConnect.fetchInfo("SELECT stock FROM product WHERE productID LIKE '" + allowedProducts.get(i) + "'");


                        /* Decrease the stock by the quantity ordered */
                        dbConnect.insertData("UPDATE product SET stock='" + (Integer.parseInt(currentStock) - Integer.parseInt(allowedProducts.get(i + 1))) + "' WHERE productID LIKE " + allowedProducts.get(i));
                        dbConnect.insertData("INSERT INTO onlineorderproduct (orderID, productID, currentBrand, currentModel, currentPrice, quantity) VALUES (" + currentOrder + ", " + allowedProducts.get(i) + ", '" + currentBrand + "', '" + currentModel + "', '" + currentPrice + "', " + allowedProducts.get(i + 1) + ")"); 

                    }
                    
                    out.print("<div class='w3-padding'>");
                    out.print("<div class='w3-card-4 w3-margin'>");
                    out.print("<h1 class='w3-center w3-container w3-theme-d3 w3-padding'><b>Order Confirmed!</b></h1>");
                    out.print("<h3 class='w3-padding'> Your order has been sent in for processing. We will send a follow up email to .<br> Please wait 3-5 business days to check that your payment has gone through.</h3>");
                    out.print("</div></div>");

                }
                if (!(unallowedProducts.isEmpty())) {
                    
                    out.print("<div class='w3-padding'>");
                    out.print("<div class='w3-card-4 w3-margin'>");
                    out.print("<h1 class='w3-center w3-container w3-theme-d3 w3-padding'><b>Sorry</b></h1>");
                    out.print("<h3 class='w3-padding'>The following products could not be ordered:</h3>");
            
                    for (int i = 0; i < unallowedProducts.size(); i += 2) {
                        
                        currentBrand = dbConnect.fetchInfo("SELECT brand FROM product WHERE productID LIKE '" + unallowedProducts.get(i) + "'");
                        currentModel = dbConnect.fetchInfo("SELECT model FROM product WHERE productID LIKE '" + unallowedProducts.get(i) + "'");
                        
                        out.print("<h3 class='w3-padding'>" + currentBrand + " " + currentModel + "</h3>");
                       
                    }
                    
                    out.print("</div></div>");
        
                }
            %>
            <!--<div class="w3-padding">
                <div class="w3-card-4 w3-margin">

                    <h1 class="w3-center w3-container w3-theme-d3 w3-padding"><b>Order Confirmed!</b></h1>
                    <h3 class="w3-padding">
                        Your order has been sent in for processing. We will send a follow up email to %=userEmail%.<br>
                        Please wait 3-5 business days to check that your payment has gone through. 
                    </h3>  
                </div> 
            </div>-->
            <script>
                localStorage.clear();
            </script>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>