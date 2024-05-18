package com.svalero.thecuriousfeather.servlet;

import com.svalero.thecuriousfeather.dao.Database;
import com.svalero.thecuriousfeather.dao.ProductDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/add-product")
public class AddProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        float price = Float.parseFloat(request.getParameter("price"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        String image_url = request.getParameter("image_url");

        try {
            Database.connect();
            int affectedRows = Database.jdbi.withExtension(ProductDao.class,
                    dao -> dao.addProduct(name, price, stock, image_url));
//            if (affectedRows == 1) {
//                response.sendRedirect("form-product.jsp?registered=true");
//            } else if (affectedRows == 0) {
//                response.sendRedirect("form-product.jsp?registered=false");
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        } catch (ClassNotFoundException ex) {
            throw new RuntimeException(ex);
//            response.sendRedirect("form-product.jsp?registered=false");

        }
    }
}
