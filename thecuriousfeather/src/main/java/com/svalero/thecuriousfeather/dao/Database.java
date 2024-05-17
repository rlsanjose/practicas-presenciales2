package com.svalero.thecuriousfeather.dao;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.sqlobject.SqlObjectPlugin;
import java.sql.SQLException;

import static com.svalero.thecuriousfeather.util.Constants.*;

public class Database {

    public static Handle db;
    public static Jdbi jdbi;

    public static void connect() throws ClassNotFoundException, SQLException {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        jdbi = Jdbi.create(URL, USERNAME, PASSWORD);
        jdbi.installPlugin(new SqlObjectPlugin());
        db = jdbi.open();
    }

    public void close() throws SQLException {
        db.close();
    }
}
