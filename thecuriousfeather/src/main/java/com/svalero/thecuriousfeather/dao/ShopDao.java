package com.svalero.thecuriousfeather.dao;

import com.svalero.thecuriousfeather.domain.Shop;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import org.jdbi.v3.sqlobject.statement.UseRowMapper;

import java.util.List;

public interface ShopDao {

    @SqlQuery("SELECT * FROM Shops")
    @UseRowMapper(ShopMapper.class)
    List<Shop> getAllShops();

    @SqlQuery("SELECT * FROM Shops  WHERE shop_id = ?")
    @UseRowMapper(ShopMapper.class)
    Shop getShopById(int shop_id);

    @SqlUpdate("INSERT INTO Shops(address, city, opening_hours) VALUES (?, ?, ?)")
    int addShop(String city, String direction, String opening_time);

    @SqlUpdate("DELETE FROM Shops WHERE shop_id = ?")
    void removeShop(int shop_id);

}
