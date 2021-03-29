<%-- 
    Document   : signInAction
    Created on : Mar 28, 2021, 3:10:10 PM
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
            //I need to double check that the employee exists in the database then send them to employeeHome.jsp
            String userEmail = request.getParameter("signInEmail");
            String password = request.getParameter("signInPassword");
            String sql = "select firstName, userType, email from user where email = ? and password = ?";
            DBConnect dbConnect = new DBConnect();
            String[] result = dbConnect.isPwdValid(sql, userEmail, password);
            if (result[0].length() >= 6 && result[0].substring(0, 6).equals("Error:")) {
                session.setAttribute("logged", "index");
                response.sendRedirect("customerPortal.jsp?error='" + result[0] + "'");
            } else {
                String name = result[0]; //this is the name pulled from the database
                String userType = result[1]; //this is the userType
                String email = result[2];
                if (userType.equals("1")) {
                    session.setAttribute("logged", userType);
                    session.setAttribute("name", name);
                    session.setAttribute("userEmail", email);
                    response.sendRedirect("customerHome.jsp");
                } else if (userType.equals("0")) {
                    session.setAttribute("logged", userType);
                    session.setAttribute("name", name);
                    session.setAttribute("userEmail", email);
                    response.sendRedirect("administrator.jsp");
                } else {
                    response.sendRedirect("index.jsp"); //this may not be needed, because any errors are already handled on line 20-22. Also see line 25
                }
            }
        %>
    </body>
</html>
