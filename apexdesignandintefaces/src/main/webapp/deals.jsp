<%-- 
    Document   : deals
    Created on : Apr 2, 2021, 10:35:53 PM
    Author     : Adrien
--%>

<%@page import="myBeans.DBConnect"%>
<html>
    <head>
        <title>Deals!</title>
        <link rel="stylesheet" href="productStyle.css">
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
        <h1 class="w3-container w3-theme-d4">Items on Sale</h1>
        <table>
        <% 
            DBConnect dbConnect = new DBConnect();
            String query = "SELECT Model, Brand, Type, CONCAT('$', ROUND(price, 2)) AS 'List Price', CONCAT('$', ROUND((price * (100 - sale) / 100), 2)) AS 'Sale Price', CONCAT('$', ROUND((price - (price * (100 - sale) / 100)), 2), ' (', sale, '%)') AS 'Savings', CASE WHEN stock > 0 THEN 'In Stock' WHEN stock = 0 THEN 'Out of Stock' END AS 'Supply' FROM product WHERE sale > 0 ORDER BY stock DESC, brand, price DESC";
            String nullTest = dbConnect.fetchInfo(query);
            if(nullTest.length() == 0){
                out.print("No Sales are currently ongoing");
            }
            else{
                String table = dbConnect.htmlTable(query);
                out.print(table);
            }
        %>
        </table>
        <br/>
    <%@include file="footer.jsp" %>
    </body>
</html>