<html>
    <head>
        <title>Apex Design and Interfaces</title>
        <%@include file="header.jsp" %>
        <script>
            <%                if (logged == null || logged.equals("index")) {
                    out.print("$('#portals').show();");
                    out.print("$('#logout').hide();");
                } else if (logged.equals("index") == false) {
                    out.print("$('#portals').hide();");
                    out.print("$('#logout').show();");
                }
            %>
        </script>
    </head>
    <body>
        <div class="w3-container w3-padding-64 w3-margin">
            <div class="w3-col s3"><br></div>
            <div class="w3-col s6">
                <div class="w3-card-4 w3-theme-d2 w3-padding-64 container">
                    <h1 class="w3-margin">Welcome to Apex Design and Interfaces!</h1>
                    <h2 class="w3-margin"> 732 Bridge Cr. Waltham, MA 02452<br>
                        We are an independent software company that creates and designs websites and interfaces for businesses. <br>
                        We got our start in Fitchburg, MA in 2021, bringing you <1 year experience!
                    </h2>
                </div>  
            </div>
            <div class="w3-col s3"><br></div>


        </div>


        <%@include file="footer.jsp" %>
    </body>
</html>
