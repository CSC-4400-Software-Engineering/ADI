<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Search</title>
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
            String productSearch = request.getParameter("search");
            DBConnect dbConnect = new DBConnect();

            /* Create the in-line product Javascript */
            
            String productsScript = dbConnect.productScript("SELECT brand, model, price, productID FROM product WHERE model LIKE '%" + productSearch + "%' ORDER BY stock DESC");
            out.print("<script>" + productsScript + "</script>");
            
            /* Create the in-line prodyct CSS */
            
            String productStyle = dbConnect.productStyle("SELECT productID, brand, model, price, stock FROM product WHERE model LIKE '%" + productSearch + "%' ORDER BY stock DESC");
            out.print("<style>" + productStyle + "</style>");

            /* Display the products */
            
            String productSearchResult = dbConnect.displayProducts("SELECT productID, brand, model, price, stock FROM product WHERE model LIKE '%" + productSearch + "%' ORDER BY stock DESC");
            
            /* If the div is empty, the query probably did not return any products */
            
            if (productSearchResult.equals("<div class='container'></div>")) {
                out.print("<div class='container'>No Results Found</div>");
            } 
            else {
                out.print(productSearchResult);
            }
        %>
        <%@include file="footer.jsp"%>        
    </body>
</html>