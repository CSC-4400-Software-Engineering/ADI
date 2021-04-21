<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
            session.setAttribute("logged", "index");
            
            /* Clear the name and email just to be safe */
            
            session.setAttribute("name", "index");
            session.setAttribute("email", "index");
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
