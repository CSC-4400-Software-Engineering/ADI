<%-- 
    Document   : searchAction
    Created on : Mar 25, 2021, 12:57:30 PM
    Author     : Adrien
--%>

<%@page import="myBeans.DBConnect"%>
<html>
    <head>
        <title>Search Results</title>
        <%@include file="header.jsp" %>
        <script>
            $("#portals").show();
            $("#logout").hide();
        </script>
        
        <% if ((logged != null) && (logged.equals("index"))) {
            String error = request.getParameter("error");
            if (error != null) {
        %>
    <div class="w3-small w3-red col-sm-4 float-right">
        <%= error%>
    </div>
    <%} } %>
    </head>
    
    <body>
        <h1 class="w3-container w3-theme-d4">
        <%
            String searchInput = request.getParameter("search");
            out.print("Search Results for " + searchInput);
        %>
        </h1>
        <table>
        <%
            DBConnect dbConnect = new DBConnect();
            String table = dbConnect.htmlTable("SELECT brand, model, type, price, CASE WHEN stock > 0 THEN 'In Stock' WHEN stock = 0 THEN 'Out of Stock' END FROM product WHERE brand LIKE '%" + searchInput + "%' OR model LIKE '%" + searchInput + "%' OR type LIKE '%" + searchInput + "%' OR description LIKE '%" + searchInput + "%' ORDER BY stock DESC, brand, price");
            out.print(table);
        %>
        </table>
    <%@include file="footer.jsp" %>
    </body>
</html>