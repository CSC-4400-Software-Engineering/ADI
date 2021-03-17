<%-- 
    Document   : checkout
    Created on : Mar 15, 2021, 11:41:50 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="header.jsp"%>
        <title>Checkout</title>
    </head>
    <body>
        <%      
            if (session.getAttribute("email").equals("null") || session.getAttribute("logged").equals("null"))
            {
            
            }
            session.setAttribute("email", "sgoyette430@gmail.com");
            //sql statements for querying the database 
            String firstNamesql = "select firstName from user where email like '" + session.getAttribute("email") + "'";
            String lastNamesql = "select lastName from user where email like '" + session.getAttribute("email") + "'";
            String emailsql = "select email from user where email like '" + session.getAttribute("email") + "'";
            String phonesql = "select phone from user where email like '" + session.getAttribute("email") + "'";
            String streetAddresssql = "select streetAddress from user where email like '" + session.getAttribute("email") + "'";
            String citysql = "select city from user where email like '" + session.getAttribute("email") + "'";
            String statesql = "select state from user where email like '" + session.getAttribute("email") + "'";
            String creditCardNumsql = "select creditCardNum from user where email like '" + session.getAttribute("email") + "'";
            String creditCardExpsql = "select creditCardExp from user where email like '" + session.getAttribute("email") + "'";

            //actual connections to the database to grab data and store in variables
            DBConnect dbConnect = new DBConnect(); //java way of creating new class/variable of type "DBConnect" named dbConnect
            String firstName = dbConnect.stringFinder(firstNamesql);
            String lastName = dbConnect.stringFinder(lastNamesql);
            String userEmail = dbConnect.stringFinder(emailsql);
            String phone = dbConnect.stringFinder(phonesql);
            String streetAddress = dbConnect.stringFinder(streetAddresssql);
            String city = dbConnect.stringFinder(citysql);
            String state = dbConnect.stringFinder(statesql);
            String creditCardNum = dbConnect.stringFinder(creditCardNumsql);
            String creditCardExp = dbConnect.stringFinder(creditCardExpsql);

        %>
        <div class="w3-card-4 w3-margin">
            <div class="w3-row w3-theme-d4 w3-padding">
                <h2>Please Enter and Confirm Your Information Below</h2>
            </div>

            <form name="checkoutForm" action="checkoutFormAction.jsp" class="w3-container" method="get">

                <div class="w3-row-padding">
                    <div class="w3-col s6">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="firstName" type="text" id="firstName" value="<%=firstName%>" required>
                            <label>First Name</label>
                        </p>   
                    </div>
                    <div class="w3-col s6">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="lastName" type="text" id="lastName" value="<%=lastName%>" required>
                            <label>Last Name</label>
                        </p>    
                    </div>
                </div>
                <div class="w3-row-padding">
                    <div class="w3-col s6">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="email" type="email" id="email" value="<%=userEmail%>" required>
                            <label>Email</label>
                        </p>
                    </div>
                    <div class="w3-col s6">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="phoneNumber" type="text" id="phoneNumber" value="<%=phone%>" required>
                            <label>Phone Number</label>
                        </p>    
                    </div>
                </div>

                <div class="w3-row-padding">
                    <h4><b>Shipping Information</b></h4>
                </div>

                <div class="w3-row-padding">
                    <div class="w3-col s4">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="streetAddress" type="text" id="streetAddress" placeholder="Street Address" value="<%=streetAddress%>" required>
                            <label>Street Address</label>    
                        </p>
                    </div>
                    <div class="w3-col s4">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="city" type="text" id="city" value="<%=city%>" required>
                            <label>City</label>
                        </p>
                    </div>
                    <div class="w3-col s4">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="state" type="text" id="state" value="<%=state%>" required>
                            <label>State</label>
                        </p>
                    </div>
                </div>

                <div class="w3-row-padding">
                    <h4><b>Billing Information</b></h4>
                </div>

                <div class="w3-row-padding">
                    <div class="w3-col s8">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="creditCardNum" type="text" id="creditCardNum" value="<%=creditCardNum%>" required>
                            <label>Credit Card Number</label>
                        </p>
                    </div>
                    <div class="w3-col s2">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="expiration" type="text" id="expiration" value="<%=creditCardExp%>" required>
                            <label>Expiration Date</label>
                        </p>
                    </div>   
                    <div class="w3-col s2">
                        <p>
                            <input class="w3-input w3-round w3-light-grey" name="CVV" type="text" id="CVV" required>
                            <label>CVV</label>
                        </p>
                    </div>
                </div>

                <div 
                    class="w3-row-padding w3-center w3-red" id="error">
                </div>

                <div class="w3-row">
                    <div class="w3-col s6 w3-padding">
                        <button class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset">Clear</button>
                    </div>
                    <div class="w3-col s6 w3-padding">
                        <button class="w3-button w3-block w3-section w3-green w3-ripple w3-padding"type="submit">Place Order</button>
                    </div>
                </div>
            </form>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>