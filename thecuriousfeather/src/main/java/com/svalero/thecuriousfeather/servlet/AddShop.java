package com.svalero.thecuriousfeather.servlet;

import com.svalero.thecuriousfeather.dao.Database;
import com.svalero.thecuriousfeather.dao.ShopDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.io.IOException;


@WebServlet("/add-shop")
public class AddShop extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String city = request.getParameter("city");
        String address = request.getParameter("address");
        String opening_hours = request.getParameter("opening_hours");

        try {
            Database.connect();
            int rowsAffected = 0;
            rowsAffected = Database.jdbi.withExtension(ShopDao.class,
                    dao -> dao.addShop(address, city, opening_hours));
            response.sendRedirect("shops.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
