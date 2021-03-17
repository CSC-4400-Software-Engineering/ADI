<%-- 
    Document   : header
    Created on : Mar 15, 2021, 10:32:53 AM
    Author     : Sebastian
--%>
<html>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="apexTheme.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <script> 
        <!--Code given by Mahadev last semester that prevents people from clicking the back button once logged out. This makes it so that
        people can't get on the computer and into your account right after they log off and walk away from the computer. -->
                        function preventBack() {
                        window.history.forward();
                        }
                setTimeout("prev            entBack()", 0);
                window.onunload = f            unction () {
                null
                };
  </script>    

    <body id="home"> <!--this id makes it so that we can make a button on the page that says "take me to the top" -->
        <!--Top bar with Logo, website name, address -->
        <div class="w3-bar w3-theme w3-padding">
            <div class="w3-col s2"><img src="images/apexLogo.png" alt="apexLogo" class="responsive"/></div>
            <div class="w3-col s8 w3-center"><h1>Apex Design and Interfaces</h1></div>
            <div class="w3-col s2 w3-right-align"> <p>732 Bridge Cr. <br>Waltham, MA 02452</p></div>
        </div>

            <% // session control
                String logged = (String) session.getAttribute("logged");
                String name = (String) session.getAttribute("name");
                String email = (String) session.getAttribute("email");
      
            %> 

            <!--Second bar down, has buttons with drop down on left and sign up on the right -->
            <div class="w3-bar w3-theme-d2">
                <div class="w3-col s6">
                    <a href="index.jsp" class="w3-bar-item w3-button w3-theme-l1 w3-medium"><i class="fa fa-home w3-margin-right"></i>Home</a>
                    <div class="w3-dropdown-hover w3-medium">
                        <button class="w3-button">Products <i class="fa fa-caret-down"></i></button>     
                        <div class="w3-dropdown-content w3-card-4 w3-bar-block">
                            <a href="products.jsp/laptops" class="w3-bar-item w3-button">Laptops</a>
                            <a href="products.jsp/desktops" class="w3-bar-item w3-button">Desktops</a>
                            <a href="products.jsp/tv" class="w3-bar-item w3-button">TVs</a>
                            <a href="products.jsp/videogames" class="w3-bar-item w3-button">Video Games/Consoles</a>
                            <a href="products.jsp/audiovideo" class="w3-bar-item w3-button">Audio/Video</a>
                        </div>
                    </div>
                    <a href="products.jsp/deals" class="w3-bar-item w3-button w3-medium">Deals!</a>
                    <a href="about.jsp" class="w3-bar-item w3-button w3-medium">About</a>     
                </div>            
                <div class="w3-col s6" id="portals">
                    <a href="customer.jsp" class="w3-bar-item w3-right w3-button w3-theme-l1">Customer Portal</a>
                    <a href="administrator.jsp" class="w3-bar-item w3-right w3-button w3-theme-l1 w3-border-right">Admin Portal</a>
                </div>
                <div class="w3-col s6" id="logout">
                    <a href="logoutAction.jsp" class="w3-bar-item w3-right w3-button w3-theme-l1">Logout</a>
                    <div class="w3-bar-item w3-right w3-theme-l1 w3-border-right">Welcome: <%= name%></div>
                    <a href="toHomeAction.jsp" class="w3-bar-item w3-right w3-button w3-theme-l1 w3-border-right">Home</a>

                    <!--
                    junk code I believe, used to help me last semester
                    <form class="form-inline" name="logout" action="logoutAction.jsp" method="post">
                        <button type="submit" class="w3-bar-item w3-right w3-button w3-theme-l1">Logout</button>
                        <div class="w3-bar-item w3-right w3-theme-l1 w3-border-right">
                            <label for="welcome">Welcome:&nbsp;</label><%= name%>
                        </div>
                    </form>
                    <a type="submit" href="toHomeAction.jsp" class="w3-bar-item w3-right w3-button w3-theme-d1">Home</a>
                    <!--<form class="form-inline" name="toHome" action="toHomeAction.jsp" method="post">
                        <button type="submit" class="w3-bar-item w3-right w3-button w3-theme-d2">Home</button>
                    </form>-->
                </div>
            </div>
        </body>
    </html>