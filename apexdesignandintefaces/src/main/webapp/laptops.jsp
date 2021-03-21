<%@page import="myBeans.DBConnect"%>
<html>
    <head>
        <title>Laptops</title>
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
        <h1 class="w3-container w3-theme-d4">Laptops</h1>
        <table>
        <% 
            DBConnect dbConnect = new DBConnect();
            String table = dbConnect.htmlTable("SELECT picture, model, brand, description, price, stock FROM product WHERE stock > 0 AND type LIKE \"Laptop\" ORDER BY brand, price");
            out.print(table);
        %>
        </table>
    <%@include file="footer.jsp" %>
    </body>
</html>
