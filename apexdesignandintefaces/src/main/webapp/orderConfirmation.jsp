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
            $("#portals").show(); //this shows the boxes that say admin and customer
            $("#logout").hide(); //this hides the one that says welcome to whoever is logged in
        </script>
    </head>
    <body>
        <%
            //String sql = "12, 2"; //, 17, 1, 16, 1, 15, 2";
            String sql = request.getParameter("productSQL");
            int index = sql.length()-1;
            char ch = ' ';
            sql = sql.substring(0, index)
              + ch
              + sql.substring(index + 1);
            
            String currentUserID;
            DBConnect dbConnect = new DBConnect();
            if(session.getAttribute("email") != null){
                currentUserID = dbConnect.fetchInfo("select userID from user where email like '" + session.getAttribute("email") + "'");
            }
            else {
                currentUserID = "1";
            }
            String addOrder = dbConnect.insertData("INSERT INTO onlineorder (orderID, userID, timeStamp) VALUES (0, " + currentUserID + ", CURRENT_TIMESTAMP)");
            String currentOrder = dbConnect.fetchInfo("SELECT max(orderID) FROM `onlineorder` where userID = '"+ currentUserID + "'");
            List<String> result = Arrays.asList(sql.split("\\s*,\\s*"));
            for (int i = 0; i < result.size(); i+=2) 
            {
            dbConnect.insertData("INSERT INTO onlineorderproduct (orderID, productID, quantity) VALUES (" + currentOrder + ", " + result.get(i) + ", " + result.get(i+1) + ")");
            } 
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
        <script>
            string test = "<%=currentUserID%>";
            localStorage.clear();
        </script>
        <%@include file="footer.jsp" %>
    </body>
</html>