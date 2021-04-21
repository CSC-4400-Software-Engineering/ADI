<%-- 
    Document   : checkout
    Created on : Mar 15, 2021, 11:41:50 AM
    Author     : Sebastian
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <script>
            $("#portals").show(); //this shows the boxes that say admin and customer
            $("#logout").hide(); //this hides the one that says welcome to whoever is logged in
        </script>
        <%@include file="header.jsp"%>
        <title>Checkout</title>
    </head>
    <body>
        <%            
            String sessionString = (String) session.getAttribute("email");
            String firstNamesql;
            String lastNamesql;
            String emailsql;
            String phonesql;
            String streetAddresssql;
            String citysql;
            String statesql;
            String creditCardNumsql;
            String creditCardExpsql;

            String firstName;
            String lastName;
            String userEmail;
            String phone;
            String streetAddress;
            String city;
            String state;
            String creditCardNum;
            String creditCardExp;

            if (sessionString == null) {
                //sql statements for querying the database 
                firstName = "";
                lastName = "";
                userEmail = "";
                phone = "";
                streetAddress = "";
                city = "";
                state = "";
                creditCardNum = "";
                creditCardExp = "";
            } else {
                firstNamesql = "select firstName from user where email like '" + session.getAttribute("email") + "'";
                lastNamesql = "select lastName from user where email like '" + session.getAttribute("email") + "'";
                emailsql = "select email from user where email like '" + session.getAttribute("email") + "'";
                phonesql = "select phone from user where email like '" + session.getAttribute("email") + "'";
                streetAddresssql = "select streetAddress from user where email like '" + session.getAttribute("email") + "'";
                citysql = "select city from user where email like '" + session.getAttribute("email") + "'";
                statesql = "select state from user where email like '" + session.getAttribute("email") + "'";
                creditCardNumsql = "select creditCardNum from user where email like '" + session.getAttribute("email") + "'";
                creditCardExpsql = "select creditCardExp from user where email like '" + session.getAttribute("email") + "'";

                //actual connections to the database to grab data and store in variables
                DBConnect dbConnect = new DBConnect(); //java way of creating new class/variable of type "DBConnect" named dbConnect
                firstName = dbConnect.stringFinder(firstNamesql);
                lastName = dbConnect.stringFinder(lastNamesql);
                userEmail = dbConnect.stringFinder(emailsql);
                phone = dbConnect.stringFinder(phonesql);
                streetAddress = dbConnect.stringFinder(streetAddresssql);
                city = dbConnect.stringFinder(citysql);
                state = dbConnect.stringFinder(statesql);
                creditCardNum = dbConnect.stringFinder(creditCardNumsql);
                creditCardExp = dbConnect.stringFinder(creditCardExpsql);
            }


        %>
        <div class="w3-row">
            <div class="w3-half">
                <div class="w3-card-4 w3-margin">
                    <div class="w3-row w3-theme-d4 w3-padding">
                        <h2>Please Enter and Confirm Your Information Below</h2>
                    </div>

                    <form name="checkout" action="orderConfirmation.jsp" class="w3-container" method="POST" onsubmit="return (verifyFirst() && verifySecond())">

                        <div class="w3-row-padding">
                            <br>
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
                                    <input class="w3-input w3-round w3-light-grey" name="creditCardExp" type="text" id="creditCardExp" value="<%=creditCardExp%>" required>
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
            </div>
            <div class="w3-half">
                <div class="w3-card-4 w3-margin">
                    <div class="products-container">
                        <div class="product-header">
                            <h5 class="product-title">Product</h5>
                            <h5 class="price">Price</h5>
                            <h5 class="quantity">Quantity</h5>
                            <h5 class="total">Total</h5>
                        </div>
                        <div class="products">
                            <!--This is where we populate the products in the cart -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>