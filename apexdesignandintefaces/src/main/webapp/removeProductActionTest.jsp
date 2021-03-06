<%@page import="myBeans.DBConnect"%>
<!DOCTYPE HTML>
<html lang="en-us">
    <head>
        <title>Test</title>
        <%@include file="header.jsp" %>
        <%            
            if (logged == null || !logged.equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
    </head>
    <body>
        <div class="flexcontent">
            <div class="w3-row">
                <div class="w3-col m4">
                    <div class="w3-padding">
                        <div class="w3-card-4">
                            <h1 class="w3-container w3-theme-d4">Test</h1>
                            <div class="w3-container w3-padding">
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <ul>
                                            <%
                                                String productIDInput = request.getParameter("productDropDown");
                                                String sqlInput = "DELETE FROM product WHERE productID LIKE '" + productIDInput + "'";
                                                DBConnect dbConnect = new DBConnect();
                                                String connectMessage = dbConnect.insertData(sqlInput);
                                                out.print("<li>ProductID: <b>" + productIDInput + "</b></li>");
                                                if (connectMessage.equals("Closed")) {
                                                    out.println("<li class='my-2'><b>Success!</b></li>");
                                                }
                                            %>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
