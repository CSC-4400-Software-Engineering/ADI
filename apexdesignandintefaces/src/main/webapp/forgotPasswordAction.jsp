<%-- 
    Document   : forgotPasswordAction
    Created on : Apr 1, 2021, 6:58:59 PM
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
            //grab security question from the database
            String userEmail = request.getParameter("userEmail");
            String sql = "select securityQuestion from user where email like '" + userEmail + "'";
            DBConnect dbConnect = new DBConnect();
            String returnedQuestion = dbConnect.stringFinder(sql);
            if (returnedQuestion.substring(0, 6).equals("Error: ")){
            response.sendRedirect("customerPortal.jsp?error");
            }
            else{
            response.sendRedirect("forgotPassword.jsp?returnedQuestion='" + returnedQuestion + "'");
            }
        %>
    </body>
</html>