<html>
    <head>
        <title>Apex Design and Interfaces</title>
        <%@include file="header.jsp" %>
        <script>
            <%                
                if (logged == null || logged.equals("index")) {
                    out.print("$('#portals').show();");
                    out.print("$('#logout').hide();");
                } 
                else if (logged.equals("index") == false) {
                    out.print("$('#portals').hide();");
                    out.print("$('#logout').show();");
                }
            %>
        </script>
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
