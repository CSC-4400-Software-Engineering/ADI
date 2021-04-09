/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package formActions;

/**
 *
 * @author WilliamRobinson
 */
import java.io.IOException;
import java.io.InputStream;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import myBeans.DBConnect;

@WebServlet(name = "editProductIntermediateAction", urlPatterns = {"/editProductIntermediateAction"})
@MultipartConfig()
public class editProductIntermediateAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String sqlInput;
        String connectMessage;

        /* Get the data from the form in parts */
        
        Part part1 = request.getPart("productBrand");
        Scanner scanner1 = new Scanner(part1.getInputStream());
        String productBrandInput = scanner1.nextLine();

        Part part2 = request.getPart("productModel");
        Scanner scanner2 = new Scanner(part2.getInputStream());
        String productModelInput = scanner2.nextLine();

        Part part3 = request.getPart("productType");
        Scanner scanner3 = new Scanner(part3.getInputStream());
        String productTypeInput = scanner3.nextLine();

        Part part4 = request.getPart("productPrice");
        Scanner scanner4 = new Scanner(part4.getInputStream());
        String productPriceInput = scanner4.nextLine();

        Part part5 = request.getPart("productDescription");
        Scanner scanner5 = new Scanner(part5.getInputStream());
        String productDescriptionInput = scanner5.nextLine();

        Part part6 = request.getPart("productStock");
        Scanner scanner6 = new Scanner(part6.getInputStream());
        String productStockInput = scanner6.nextLine();

        Part part8 = request.getPart("productID");
        Scanner scanner8 = new Scanner(part8.getInputStream());
        String productIDInput = scanner8.nextLine();
        
        /* Strip any potential whitespace from the ID just to be safe */
        
        productIDInput = productIDInput.trim();

        /* Update the record in the database with the new parts. */

        DBConnect dbConnect = new DBConnect();

        if (request.getPart("productPicture").getSize() > 0) {
            Part part7 = request.getPart("productPicture");
            InputStream productPictureInput = part7.getInputStream();
            sqlInput = "UPDATE product SET brand = ?, model = ?, type = ?, price = ?, description = ?, stock = ?, picture = ? WHERE productID LIKE ?";
            connectMessage = dbConnect.editProduct(sqlInput, productBrandInput, productModelInput, productTypeInput, productPriceInput, productDescriptionInput, productStockInput, productPictureInput, productIDInput);
        } 
        else {
            sqlInput = "UPDATE product SET brand = ?, model = ?, type = ?, price = ?, description = ?, stock = ? WHERE productID LIKE ?";
            connectMessage = dbConnect.editProduct(sqlInput, productBrandInput, productModelInput, productTypeInput, productPriceInput, productDescriptionInput, productStockInput, productIDInput);
        }
        if (connectMessage.equals("Closed")) {
            response.sendRedirect("administrator.jsp?editProductMessage=Product in inventory edited!");

        }
    }
}
