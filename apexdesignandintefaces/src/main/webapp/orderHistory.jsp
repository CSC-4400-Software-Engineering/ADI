<%-- 
    Document   : orderHistory
    Created on : Apr 17, 2021, 3:46:18 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
         <%            
            if (logged == null || !logged.equals("1")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <title>Order History</title>
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
        <link rel="stylesheet" href="productStyle.css">
    </head>
    <body>
        <div class="w3-card-4 w3-margin">
            <div class="w3-container w3-theme w3-center"><h1>Order History</h1></div>
            <div class="w3-row">
                <div class="w3-col w3-center s12 w3-padding">
                    
                    <div class="w3-container w3-padding-32">
                        <table style="width: 100%; font-size: xx-large;">
                            <%
                                DBConnect dbConnect = new DBConnect();
                                String table = dbConnect.orderHistory(email);
                                out.print(table);
                            %>
                        </table>
                    </div>
                    <div class="w3-row-padding w3-center w3-red" id="error"></div>
                </div>
                
            </div>
        </div>
        
        <%@include file="footer.jsp"%>        
    </body>
</html>