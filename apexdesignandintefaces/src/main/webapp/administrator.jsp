<%@page contentType="text/html" pageEncoding="UTF-8" import="myBeans.DBConnect" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Administrator</title>
        <%@include file="header.jsp" %>
        <%            
            if (logged == null || !logged.equals("0")) {
                response.sendRedirect("index.jsp");
            }
        %>
        <script>
            $("#portals").hide();
            $("#logout").show();
        </script>
        <script src="otherScripts.js"></script>
    </head>
    <body>
        <div class="flexcontent">
            <%
                DBConnect dbConnect = new DBConnect();
                String productDropDown;
            %>
            <div class="w3-row">
                <div class="w3-col m3">
                    <div class="w3-padding">
                        <div class="w3-card-4">
                            <h1 class="w3-container w3-theme-d4">Add Product</h1>
                            <%
                                if (testEnable == true) {
                                    out.println("<form name='addProduct' action='addProductActionTest.jsp' method='POST' class='w3-container w3-padding'>");
                                } 
                                else {
                                    out.println("<form name='addProduct' action='addProductAction' method='POST' enctype='multipart/form-data' class='w3-container w3-padding'>");
                                }
                            %>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Brand</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productBrand" id="productBrandID" size="100" onInput="addProductVerifyBrand()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Model</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productModel" id="productModelID" size="100" onInput="addProductVerifyModel()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Type</label>
                                    <!-- <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productType" id="productTypeID" size="50" onInput="addProductVerifyType()"/> -->
                                    <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="productType">
                                        <option disabled selected>Select one ...</option>
                                        <option>Laptop</option>
                                        <option>Desktop</option>
                                        <option>TV</option>
                                        <option>Video Game/Console</option>
                                        <option>Audio/Video</option>
                                    </select>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Price</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productPrice" id="productPriceID" size="20" onInput="addProductVerifyPrice()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Description</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productDescription" id="productDescriptionID" size="500" onInput="addProductVerifyDescription()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Stock</label>
                                    <input required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" type="text" name="productStock" id="productStockID" size="20" onInput="addProductVerifyStock()"/>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Sale</label>
                                    <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="productSale">
                                        <option disabled selected>Select one ...</option>
                                        <option value="0" >No</option>
                                        <option value="1" >Yes</option>
                                    </select>
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Picture</label>
                                    <br>
                                    <input required class="w3-margin-top w3-margin-bottom" type="file" name="productPicture"/>
                                </div>
                            </div>
                            <br>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <%
                        if (request.getParameter("addProductMessage") != null) {
                            out.println("<div class='w3-padding'>");
                            out.println(request.getParameter("addProductMessage"));
                            out.println("</div>");
                        }
                    %>
                </div>
                <div class="w3-col m3">
                    <div class="w3-padding">
                        <div class="w3-card-4">
                            <h1 class="w3-container w3-theme-d4">Edit Product</h1>
                            <form name="editProduct" action="editProductAction.jsp" method="GET" class="w3-container w3-padding">
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <label>Product</label>
                                        <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="productDropDown">
                                            <%
                                                productDropDown = dbConnect.dropdown("SELECT productID, model FROM product");
                                                out.println(productDropDown);
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                                    </div>
                                </div>
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                        if (request.getParameter("editProductMessage") != null) {
                            out.println("<div class='w3-padding'>");
                            out.println(request.getParameter("editProductMessage"));
                            out.println("</div>");
                        }
                    %>
                </div>
                <div class="w3-col m3">
                    <div class="w3-padding">
                        <div class="w3-card-4">
                            <h1 class="w3-container w3-theme-d4">Remove Product</h1>
                            <%
                                if (testEnable == true) {
                                    out.println("<form name='removeProduct' action='removeProductActionTest.jsp' method='POST' class='w3-container w3-padding'>");
                                } 
                                else {
                                    out.println("<form name='removeProduct' action='removeProductAction.jsp' method='POST' class='w3-container w3-padding'>");
                                }
                            %>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <label>Product</label>
                                    <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="productDropDown" id="productDropDownID" onchange="removeProductDropDownSwitch()">
                                        <%
                                            productDropDown = dbConnect.dropdown("SELECT productID, model FROM product");
                                            out.println(productDropDown);
                                        %>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                                </div>
                            </div>
                            <div class="w3-row-padding">
                                <div class="w3-col s12">
                                    <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit" onclick="return removeProductConfirm()" />
                                </div>
                            </div>
                            </form>
                        </div>
                    </div>
                    <%
                        if (request.getParameter("removeProductMessage") != null) {
                            out.println("<div class='w3-padding'>");
                            out.println(request.getParameter("removeProductMessage"));
                            out.println("</div>");
                        }
                    %>
                </div>
                <div class="w3-col m3">
                    <div class="w3-padding">
                        <div class="w3-card-4">
                            <h1 class="w3-container w3-theme-d4">Edit User</h1>
                            <form name="editUser" action="editUserAction.jsp" method="GET" class="w3-container w3-padding">
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <label>User</label>
                                        <select required class="w3-margin-top w3-margin-bottom w3-input w3-round w3-light-grey" name="userDropDown">
                                            <%
                                                productDropDown = dbConnect.dropdown("SELECT userID, email FROM user");
                                                out.println(productDropDown);
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <br>
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <input class="w3-button w3-block w3-section w3-red w3-ripple w3-padding" type="reset" value="Reset" />
                                    </div>
                                </div>
                                <div class="w3-row-padding">
                                    <div class="w3-col s12">
                                        <input class="w3-button w3-block w3-section w3-green w3-ripple w3-padding" type="submit" value="Submit"/>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <%
                        if (request.getParameter("editUserMessage") != null) {
                            out.println("<div class='w3-padding'>");
                            out.println(request.getParameter("editUserMessage"));
                            out.println("</div>");
                        }
                    %>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>