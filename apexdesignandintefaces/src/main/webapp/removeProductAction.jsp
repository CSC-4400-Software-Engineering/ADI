<%@page import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Remove Product</title>
    </head>
    <body>
        <%

            String productIDInput = request.getParameter("productDropDown");
            String sqlInput = "DELETE FROM product WHERE productID LIKE '" + productIDInput + "'";
            DBConnect dbConnect = new DBConnect();
            String connectMessage = dbConnect.insertData(sqlInput);

            if (connectMessage.equals("Closed")) {
                response.sendRedirect("administrator.jsp?removeMessage=Product removed from inventory!");
            }
        %>
    </body>
</html>
