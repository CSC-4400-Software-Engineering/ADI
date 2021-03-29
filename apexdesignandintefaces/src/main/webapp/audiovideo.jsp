<%@page import="myBeans.DBConnect"%>
<html>
    <head>
        <title>Audio/Video</title>
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
        <h1 class="w3-container w3-theme-d4">Audio/Video</h1>
        <table>
          <% 
            DBConnect dbConnect = new DBConnect();
            String table = dbConnect.htmlTable("SELECT model, brand, type, price, CASE WHEN stock > 0 THEN 'In Stock' WHEN stock = 0 THEN 'Out of Stock' END AS 'supply' FROM product WHERE type LIKE \"Audio/Video\" ORDER BY stock DESC, brand, price DESC");
            out.print(table);
            %>
        </table>
        <br/>
    <%@include file="footer.jsp" %>
    </body>
</html>
