<html>
    <head>
        <title>Desktops</title>
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
        <h1 class="w3-container w3-theme-d4">Desktops</h1>
        <table align="center" border="1" cellpadding="5">
            <thead>
                <tr>
                    <th>Picture</th>
                    <th>Name</th>
                    <th>Brand</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>NULL</td>
                    <td>Dell Optiplex 7010</td>
                    <td>Dell</td>
                    <td>$349.99</td>
                </tr>
                <tr>
                    <td>NULL</td>
                    <td>Logitech Wireless Mouse</td>
                    <td>Logitech</td>
                    <td>$13.98</td>
                </tr>
                <tr>
                    <td>NULL</td>
                    <td>RedDragon RGB Mechanical Gaming Keyboard</td>
                    <td>RedDragon</td>
                    <td>$25.99</td>
                </tr>
            </tbody>
        </table>
    <%@include file="footer.jsp" %>
    </body>
</html>
