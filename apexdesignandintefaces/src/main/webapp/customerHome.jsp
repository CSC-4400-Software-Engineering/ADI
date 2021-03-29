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
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
        <link rel="stylesheet" href="productStyle.css">
    </head>
    <body>
        <h1 class="w3-container w3-theme-d4">All Products</h1>
        <table>
          <% 
            DBConnect dbConnect = new DBConnect(); 
            String table = dbConnect.htmlTable("select firstName, lastName, email, phone, streetAddress, city, state from user where email like '" + email + "'");
            out.print(table);
            %>
        </table>
        <%@include file="footer.jsp" %>
    </body>
</html>
