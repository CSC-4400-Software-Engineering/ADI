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
            <h3>Welcome to Apex Design and Interfaces!</h3>
            <h6> 732 Bridge Cr. Waltham, MA 02452<br>
                We are an independent software company that creates and designs websites and interfaces for businesses. <br>
                We got our start in Fitchburg, MA in 2021, bringing you <1 year experience!
            </h6>
        </div>
    </div>
    <%@include file="footer.jsp" %>
    </body>
</html>
