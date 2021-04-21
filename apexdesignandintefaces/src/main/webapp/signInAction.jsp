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
            String userEmail = request.getParameter("signInEmail");
            String password = request.getParameter("signInPassword");
            String sql = "select firstName, userType, email from user where email = ? and password = ?";
            DBConnect dbConnect = new DBConnect();
            String[] result = dbConnect.isPwdValid(sql, userEmail, password);
            if (result[0].length() >= 6 && result[0].substring(0, 6).equals("Error:")) {
                session.setAttribute("logged", "index");
                response.sendRedirect("customerPortal.jsp?error='" + result[0] + "'");
            } 
            else {
                String userType = result[1];

                /* We should only have two userTypes */
                
                if (userType.equals("1") || userType.equals("0")) {

                    /* Once we are sure that the userType is valid, get and set the name and email */
                    
                    String name = result[0];
                    String email = result[2];
                    session.setAttribute("logged", userType);
                    session.setAttribute("name", name);
                    session.setAttribute("email", email);

                    /* Use the appropriate redirects for each userType */
                    
                    if (userType.equals("1")) {
                        response.sendRedirect("customerHome.jsp");
                    } 
                    else {
                        response.sendRedirect("administrator.jsp");
                    }
                } 
                else {

                    /* In the event we somehow get an invalid userType */
                    
                    session.setAttribute("logged", "index");
                    response.sendRedirect("customerPortal.jsp?error='Error: Invalid User Type'");
                }
            }
        %>
    </body>
</html>
