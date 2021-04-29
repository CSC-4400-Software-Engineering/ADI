<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title><%out.println(request.getParameter("productNameConcat"));%></title>
        <%@include file="header.jsp"%>
        <link rel="stylesheet" href="productStyle.css">
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
        <%
            String productID = request.getParameter("productID");
            DBConnect dbConnect = new DBConnect();
            String currentProductBrandSqlInput = "SELECT brand FROM product WHERE productID LIKE '" + productID + "'";
            String currentProductModelSqlInput = "SELECT model FROM product WHERE productID LIKE '" + productID + "'";
            String currentProductPriceSqlInput = "SELECT price FROM product WHERE productID LIKE '" + productID + "'";
            String currentProductDescriptionSqlInput = "SELECT description FROM product WHERE productID LIKE '" + productID + "'";
            
            String currentProductBrand = dbConnect.fetchInfo(currentProductBrandSqlInput);
            String currentProductModel = dbConnect.fetchInfo(currentProductModelSqlInput);
            String currentProductPrice = dbConnect.fetchInfo(currentProductPriceSqlInput);
            String currentProductDescription = dbConnect.fetchInfo(currentProductDescriptionSqlInput);
            String currentPicture = dbConnect.getPicture("SELECT picture FROM product WHERE productID LIKE ?", productID);

        %>
        <div class="w3-row">
        <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4">Product Details</h1>
                        <div class="w3-container w3-padding">
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <ul>
                                    <%
                                        out.print("<li>Brand: <b>" + currentProductBrand + "</b></li>");
                                        out.print("<li>Model: <b>" + currentProductModel + "</b></li>");
                                        out.print("<li>Price: <b>" + currentProductPrice + "</b></li>");
                                        out.print("<li>Description: <b>" + currentProductDescription + "</b></li>");
                                    %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          <div class="w3-col m4">
                <div class="w3-padding">
                    <div class="w3-card-4">
                        <h1 class="w3-container w3-theme-d4"><%out.println(request.getParameter("productNameConcat"));%></h1>
                        <div class="w3-container w3-padding">
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <%
                                        out.print("<img style='width:100%' src='data:image/png;base64," + currentPicture + "'/>");
                                    %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp"%>        
    </body>
</html>