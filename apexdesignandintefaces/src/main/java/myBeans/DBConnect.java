/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

/**
 *
 * @author nmahadev
 */
public class DBConnect {

    // driver and connection string variables
    private final String driver = "com.mysql.jdbc.Driver";
    private final String url = "jdbc:mysql://localhost:3306/apexdesignandinterfaces";
    private final String user = "mahadev";
    private final String pwd = "mahadev";

    // JDBC variables and methods
    private Connection conn = null;
    private Statement stm = null;
    private PreparedStatement pstm = null;
    private ResultSet rst = null;
    private ResultSet rst2 = null;
    private ResultSetMetaData rsmd = null;
    private ResultSetMetaData rsmd2 = null;

    // The two private methods below are used to open and close DB
    private String open() {
        String message = "Opened";
        try {
            Class.forName(driver); // load driver
            conn = DriverManager.getConnection(url, user, pwd);
            stm = conn.createStatement();
        } catch (Exception e) {
            message = e.getMessage();
        }
        return message;
    }

    private String close() {
        String message = "Closed";
        try {
            stm.close();
            conn.close();
        } catch (Exception e) {
            message = e.getMessage();
        }
        return message;
    }

    // Business logic: Method to insert data
    public String insertData(String sql) {
        String message = open();
        if (message.equals("Opened")) {
            try {
                stm.executeUpdate(sql);
                message = close();
            } catch (Exception e) {
                message = e.getMessage();
            }
        }
        return message;
    }

    // Business logic: Method to display query as html table. 
    // Function call goes between <table> and </table> tags
    public String htmlTable(String sql) {
        //String result = "<table>\n"; // I commented this line out since it was cumbersome.
        String result = "";
        String message = open();
        if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                // create column headings
                result += "<tr>\n";
                for (int i = 0; i < count; i++) {
                    result += "<th>" + rsmd.getColumnName(i + 1) + "</th>\n";
                }
                result += "</tr>\n";
                // create data rows
                while (rst.next()) {
                    result += "<tr>\n";
                    for (int i = 0; i < count; i++) {
                        result += "<td>" + rst.getString(i + 1) + "</td>\n";
                    }
                    result += "</tr>\n";
                }
                message = close();
                //result += "</table>\n"; // I commented this line out since it was cumbersome.
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }

    // Business logic: Method to verify password. Avoids SQL injection
    // Returns the column values requested in a array of Strings.
    public String[] isPwdValid(String sql, String user, String pwd) {
        String message = open();
        if (message.equals("Opened")) {
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, user);
                pstm.setString(2, pwd);
                rst = pstm.executeQuery();
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                String[] result = new String[count];
                int records = 0;
                while (rst.next()) {
                    records++;
                    for (int i = 0; i < count; i++) {
                        result[i] = rst.getString(i + 1);
                    }
                }
                close();
                if (records == 0) {
                    result[0] = "Error: Invalid Credentials";
                }
                return result;
            } catch (Exception e) {
                String[] result = new String[1];
                result[0] = "Error: " + e.getMessage();
                return result;
            }
        } else {
            String[] result = new String[1];
            result[0] = "Error: " + message;
            return result;
        }
    }
    // Business logic: Method to create html code for dropdown.  Lists options
    // Goes between <select> and </select> tags.
    public String dropdown(String sql) {
        String result = "<option disabled selected>Select one ...</option>\n";
        String message = open();
        if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                while (rst.next()) {
                    result += "<option value='" + rst.getInt(1) + "'>";
                    for (int i = 2; i <= count; i++) {
                        result += rst.getString(i) + " ";
                    }
                    result += "</option>\n";
                }
                message = close();
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }

    /*
  Function which fetches a row from a query as a comma separated string.
  It's really only used to get one cell of information at a time.
     */
    public String fetchInfo(String sql) {
        String result = "";
        String message = open();
        if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                while (rst.next()) {
                    for (int i = 0; i < count; i++) {
                        result += rst.getString(i + 1);
                        if (i != count - 1) {
                            result += ",";
                        }
                    }
                }
                message = close();
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }

    public String stringFinder(String sql) {
        String result = "";
        String message = open();
        if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                rst.next();
                result += rst.getString(1);
                message = close();
                return result;
            } catch (Exception e) {
                return "Error: " + e.getMessage();
            }
        } else {
            return "Error: " + message;
        }
    }

    /* 
    Specialized function to help add products to the database. 
    Normally this doesn't need to exist, but it's needed in order to store images as blobs.
     */
    public String addProduct(String sql, String brand, String model, String type, String price, String description, String stock, String sale, InputStream picture) {
        String message = open();
        if (message.equals("Opened")) {
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, brand);
                pstm.setString(2, model);
                pstm.setString(3, type);
                pstm.setString(4, price);
                pstm.setString(5, description);
                pstm.setString(6, stock);
                pstm.setString(7, sale);
                pstm.setBlob(8, picture);
                pstm.executeUpdate();
                message = close();

            } catch (Exception e) {
                message = e.getMessage();
            }

        }
        return message;
    }

    /* Specialized functions to help edit products to the database. */
    public String editProduct(String sql, String brand, String model, String type, String price, String description, String stock, String sale, InputStream picture, String ID) {
        String message = open();
        if (message.equals("Opened")) {
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, brand);
                pstm.setString(2, model);
                pstm.setString(3, type);
                pstm.setString(4, price);
                pstm.setString(5, description);
                pstm.setString(6, stock);
                pstm.setString(7, sale);
                pstm.setBlob(8, picture);
                pstm.setString(9, ID);
                pstm.executeUpdate();
                message = close();

            } catch (Exception e) {
                message = e.getMessage();
            }

        }
        return message;
    }

    public String editProduct(String sql, String brand, String model, String type, String price, String description, String stock, String sale, String ID) {
        String message = open();
        if (message.equals("Opened")) {
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, brand);
                pstm.setString(2, model);
                pstm.setString(3, type);
                pstm.setString(4, price);
                pstm.setString(5, description);
                pstm.setString(6, stock);
                pstm.setString(7, sale);
                pstm.setString(8, ID);
                pstm.executeUpdate();
                message = close();

            } catch (Exception e) {
                message = e.getMessage();
            }

        }
        return message;
    }
    /* 
    Specialized function to retrieve image blobs from the database.
    Returns the image as a base64 string lol
    */
    public String getPicture(String sql, String id) {
        String message = open();
        String pictureEncode = "";
        if (message.equals("Opened")) {
            try {
                pstm = conn.prepareStatement(sql);
                pstm.setString(1, id);
                rst = pstm.executeQuery();
                rst.next();
                Blob pictureBlob = rst.getBlob("picture");
                byte[] pictureBytes = pictureBlob.getBytes(1, (int) pictureBlob.length());
                pictureEncode = Base64.getEncoder().encodeToString(pictureBytes);

                //message = close();
            } catch (Exception e) {
            }

        }
        return pictureEncode;
    }
    
    public String prettyTable(String sql) {
        //String result = "<table>\n"; // I commented this line out since it was cumbersome.
        String result = "";
        String message = open();
        if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                // create column headings
                result += "<tr>\n";
                for (int i = 0; i < count; i++) {
                    result += "<th>" + rsmd.getColumnName(i + 1) + "</th>\n";
                }
                result += "</tr>\n";
                // create data rows
                while (rst.next()) {
                    result += "<tr>\n";
                    for (int i = 0; i < count; i++) {
                        result += "<td>" + rst.getString(i + 1) + "</td>\n";
                    }
                    result += "</tr>\n";
                }
                message = close();
                //result += "</table>\n"; // I commented this line out since it was cumbersome.
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }
    
    /*public String productScript(String sql) { //pass in brand, model, price and productID. MUST BE BETWEEN SCRIPT TAGS
        String result = "let products = ["; //opens products block of code
        String message = open();
        if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                while (rst.next()) {
                    result += "{name: '" + rst.getString(1) + " " + rst.getString(2) + "',\n";//this prints {name: "Brand Model",\n
                    result += "tag: '" + rst.getString(1) + rst.getString(2) + "',\n"; //this prints tag: "BrandModel",\n (no spaces)
                    result += "price: " + rst.getInt(3) + ",\n"; //prints price: Price,\n
                    result += "productID: " + rst.getInt(4) + ",\n"; //prints productID: ID,\n
                    result += "inCart: 0}";
                    if (!rst.isLast()){
                        result+=", ";
                    }
                }
                result+= "];"; //closes products block of code
                message = close();
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }*/
    
     public String displayProducts(String sql) {//productID, brand, model, price, stock, sale from product
        String result = "<div class='container'>";
        String message = open();
        if (message.equals("Opened")) {
            try {
                
                /* Begin HTML creation */
                
                rst2 = stm.executeQuery(sql);
                rsmd2 = rst2.getMetaData();
                int i = 1;
                String pictureString;
                String sql2;
                int PID;
                String productID;
                while (rst2.next()) {
                    PID = rst2.getInt(1);
                    productID = String.valueOf(PID);
                    sql2 = "SELECT picture FROM product where productID like ?";
                    pictureString = getPicture(sql2, productID);
                    result += "<form name='viewProduct' action='viewProductAction.jsp' method='GET'>";
                    result += "<div class='w3-padding'>";
                    result += "<div class='w3-card-4'>";
                    result += "<input type='hidden' name='productID' value='" + productID + "'>";
                    result += "<input type='hidden' name='productNameConcat' value='" + rst2.getString(2) + " " + rst2.getString(3) + "'>";
                    result += "<input class='w3-button w3-large w3-block w3-section w3-theme-d4 w3-ripple' type='submit' value='" + rst2.getString(2) + " " + rst2.getString(3) + "'>";
                    result += "<div class='image'>";
                    
                    /* If there is no product image, use the placeholder */
                    
                    if (pictureString.equals("")) {
                        result += "<img src='Images/noImage.png' class='productPic' width='100%' >";
                    }
                    else {
                        result += "<img src='data:image/png;base64," + pictureString + "' class='productPic' width='100%' >";    
                    }
                    
                    if (rst2.getInt(6) == 1) {
                        result += "<h3 class='w3-text-orange' >Sale: $" + rst2.getInt(4) + "</h3>";
                    } 
                    else {
                        result += "<h3>$" + rst2.getInt(4) + "</h3>";
                    }

                    /* Handle product stock */
                    
                    if (rst2.getInt(5) > 0) {
                        result += "<a class='add-cart cart" + i + "' href='#'>Add to Cart</a>";
                        result += "<h3 class='w3-text-green'>In Stock</h3>";
                    } 
                    else {
                        result += "<h3 class='w3-text-red'>Out of Stock</h3>";
                    }
                    i++;
                    result += "</form></div></div></div>";
                }
                result += "</div>"; //closes 'container' block of code
                
                /* Begin JavaScript creation */

                rst2 = stm.executeQuery(sql);
                rsmd2 = rst2.getMetaData();
                result += "<script>let products = ["; //opens products block of code

                while (rst2.next()) {
                    result += "{name: '" + rst2.getString(2) + " " + rst2.getString(3) + "',\n";//this prints {name: "Brand Model",\n
                    result += "tag: '" + rst2.getString(2) + rst2.getString(3) + "',\n"; //this prints tag: "BrandModel",\n (no spaces)
                    result += "price: " + rst2.getInt(4) + ",\n"; //prints price: Price,\n
                    result += "productID: " + rst2.getInt(1) + ",\n"; //prints productID: ID,\n
                    result += "inCart: 0}";
                    if (!rst2.isLast()) {
                        result += ", ";
                    }
                }
                result += "];</script>"; //closes products block of code
                
                /* Begin CSS creation */
                
                result +="<style>";
                rst2 = stm.executeQuery(sql);
                rsmd2 = rst2.getMetaData();
                i = 1;
                while (rst2.next()) {
                    result += ".image:hover .cart" + i;
                    if (!rst2.isLast()) {
                        result += ", ";
                    }
                    i++;
                }
                
                /* Add the rest of the CSS */
                
                if (i > 1) {
                    result += " { opacity: 1; padding: 10px; text-decoration: none; }";
                }
                result += "</style>";
                message = close();
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }
    
   public String orderHistory(String email){ 
        String result = "";
        String message = open();
        if (message.equals("Opened")) {
            try {
                String sql = "SELECT onlineorder.orderID, onlineorder.timeStamp, onlineorderproduct.currentBrand, onlineorderproduct.currentModel, onlineorderproduct.quantity, onlineorderproduct.currentPrice"
                        + " FROM user INNER JOIN onlineorder ON user.userID = onlineorder.userID INNER JOIN onlineorderproduct ON onlineorder.orderID = "
                        + "onlineorderproduct.orderID WHERE user.email = '" + email + "'";
                rst = stm.executeQuery(sql);
                rsmd = rst.getMetaData();
                int count = rsmd.getColumnCount();
                // create column headings
                result += "<tr>\n";
                /*for (int i = 0; i < count; i++) {
                    result += "<th>" + rsmd.getColumnName(i + 1) + "</th>\n";
                }*/
                result += "<th> Order ID </th>";
                result += "<th> Date/Time Placed </th>";
                result += "<th> Product Brand </th>";
                result += "<th> Product Model </th>";
                result += "<th> Quantity </th>";
                result += "<th> Price </th>";
                result += "</tr>\n";
                // create data rows
                while (rst.next()) {
                    result += "<tr>\n";
                    for (int i = 0; i < count; i++) {
                        result += "<td>" + rst.getString(i + 1) + "</td>\n";
                    }
                    result += "</tr>\n";}
                //
                message = close();
                return result;
            } catch (Exception e) {
                return e.getMessage();
            }
        } else {
            return message;
        }
    }
   
   /*public String productStyle (String sql) {
       String result="";
       int i = 1;
       String message = open();
       if (message.equals("Opened")) {
            try {
                rst = stm.executeQuery(sql);
                while (rst.next()) {
                    result += ".image:hover .cart" + i;
                    if (!rst.isLast()){
                        result+=", ";
                    }
                    i++;
                }

                if (i > 1){
                result += " { opacity: 1; padding: 10px; text-decoration: none; }";
                }
                message = close();
                return result;
            } 
            catch (Exception e) {
                return e.getMessage();
            }
        } 
       else {
            return message;
        }
    } */ 
   
}
