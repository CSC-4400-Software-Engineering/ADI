<html>
    <head>
        <title>Sebastian's Car Lot</title>
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
    <div class="container">
        <div class="bg"></div>
        <div class="content">
            <h3>Welcome to Sebastian's Car Lot!</h3>
            <h6>243 Main St. Fitchburg, MA <br>
                Bringing you a wide selection of quality cars since 2020! We sell meticulously combed through vehicles 
                at a fraction of the cost of major dealers. Shop New, Used, or even get a quote on your car!
            </h6>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    </body>
</html>
