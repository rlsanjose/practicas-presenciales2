package com.svalero.thecuriousfeather.dao;

import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;
import com.svalero.thecuriousfeather.domain.Product;

import java.util.List;

public interface ProductDao {

    @SqlQuery("SELECT * FROM Products")
    @UseRowMapper(ProductMapper.class)
    List<Product> getAllProducts();

    @SqlQuery("SELECT * FROM Products WHERE product_id = ?")
    @UseRowMapper(ProductMapper.class)
    Product getProductById(int product_id);

    @SqlUpdate("INSERT INTO Products(name, price, stock, image_url) " +
            "VALUES (?, ?, ?, ?)")
    int addProduct(String name, float price, int stock, String image_url);

    @SqlUpdate("DELETE FROM Products WHERE product_id = ?")
    void removeProduct(int product_id);
}
