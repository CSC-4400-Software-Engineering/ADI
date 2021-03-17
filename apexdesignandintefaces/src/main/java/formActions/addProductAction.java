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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import myBeans.DBConnect;

@WebServlet(name = "addProductAction", urlPatterns = {"/addProductAction"})
@MultipartConfig(maxFileSize = 16177216) // Limit the file size for now
public class addProductAction extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
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

        Part part7 = request.getPart("productPicture");
        InputStream productPictureInput = part7.getInputStream();

        /* Insert the parts into the database */
        
        DBConnect dbConnect = new DBConnect();
        String sqlInput = "INSERT INTO product (productID, brand, model, type, price, description, stock, picture) VALUES(0,?,?,?,?,?,?,?)";
        String connectMessage = dbConnect.addProduct(sqlInput, productBrandInput, productModelInput, productTypeInput, productPriceInput, productDescriptionInput, productStockInput, productPictureInput);
        if (connectMessage.equals("Closed")) {
            request.setAttribute("successMessage","Product added to inventory!");
            RequestDispatcher requestDispatch = request.getRequestDispatcher("administrator.jsp");
            requestDispatch.forward(request, response);
            //response.sendRedirect("administrator.jsp");

        }
    }
}
