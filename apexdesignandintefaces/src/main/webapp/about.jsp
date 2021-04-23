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
            <div class="content">
                <h3>About</h3>
                <h6>Dummy</h6>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
