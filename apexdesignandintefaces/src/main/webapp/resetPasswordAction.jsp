<%-- 
    Document   : resetPasswordAction
    Created on : Apr 4, 2021, 11:13:57 PM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String password = request.getParameter("password");
            String userEmail = (String) session.getAttribute("tempEmail");
            String sql = "UPDATE user SET password='" + password + "' where email like '" + userEmail + "'";
            DBConnect dbConnect = new DBConnect();
            String outcome = dbConnect.insertData(sql);
            
            if (outcome.substring(0, 6).equals("Error:")){
            session.setAttribute("tempMessage", outcome);
            response.sendRedirect("loginPortal.jsp?" + outcome);
            }
            else if (outcome.equals("Closed")){
            //session.setAttribute("tempMessage", "Success");
            response.sendRedirect("loginPortal.jsp");
            }
        %>
    </body>
</html>