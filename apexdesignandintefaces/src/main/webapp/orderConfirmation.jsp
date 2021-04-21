<%-- 
    Document   : orderConfirmation
    Created on : Mar 21, 2021, 9:26:04 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <title>Order Confirmation</title>
        <script>
            $("#portals").show(); //this shows the boxes that say admin and customer
            $("#logout").hide(); //this hides the one that says welcome to whoever is logged in
        </script>
    </head>
    <body>
        <%
            //get the products info, basically pull ID and inCart 
            
            //String[] products = {};
            //get the make SQL statements, INSERT (add products to order, link customers ID with order, etc)
            
            //call SQL methods to create orders (updateDB(SQL statements))
            
            String currentUserID;
            DBConnect dbConnect = new DBConnect();
            if(session.getAttribute("email") != null){
                currentUserID = dbConnect.fetchInfo("select userID from user where email like '" + session.getAttribute("email") + "'");
            }
            else {
                currentUserID = "0";
            }
            out.print(currentUserID);
            String addOrder = dbConnect.insertData("INSERT INTO onlineorder (userID, timeStamp) VALUES (" + currentUserID + ", CURRENT_TIMESTAMP)");
            String currentOrder = dbConnect.fetchInfo("SELECT max(orderID) FROM `onlineorder`");
            String addOrderProduct = dbConnect.insertData("INSERT INTO onlineorderproduct (orderID, productID, quantity) VALUES (" + currentOrder + ", 1, 1)");
            %>
        <div class="w3-padding">
            <div class="w3-card-4 w3-margin">

                <h1 class="w3-center w3-container w3-theme-d3 w3-padding"><b>Order Confirmed!</b></h1>
                <h3 class="w3-padding">
                    Your order has been sent in for processing. We will send a follow up email to <%String userEmail = request.getParameter("email"); out.print(userEmail);%>.<br>
                    Please wait 3-5 business days to check that your payment has gone through. 
                </h3>  
            </div> 
        </div>

        <%@include file="footer.jsp" %>
    </body>
</html>