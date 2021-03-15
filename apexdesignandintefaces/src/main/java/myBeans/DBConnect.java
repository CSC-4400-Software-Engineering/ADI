/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myBeans;

import java.sql.*;

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
  private ResultSetMetaData rsmd = null;

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

}
