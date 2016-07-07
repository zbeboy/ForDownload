package top.zbeboy.fordownload.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.apache.commons.lang.math.NumberUtils;
import org.jooq.Configuration;
import org.jooq.DSLContext;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;
import org.jooq.impl.DefaultConfiguration;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * Created by Administrator on 2016/7/6.
 */
public class DBUtils {

    private static HikariDataSource connectionPool;

    static {
        try {
            Properties properties = new Properties();
            properties.load(DBUtils.class.getClassLoader().getResourceAsStream("db.properties"));
            // load the database driver (make sure this is in your classpath!)
            Class.forName(properties.getProperty("jdbc.driver"));

            // setup the connection pool
            HikariConfig config = new HikariConfig();
            config.setMaximumPoolSize(NumberUtils.toInt(properties.getProperty("jdbc.maximumPoolSize","100")));
            config.setDataSourceClassName(properties.getProperty("jdbc.className"));
            config.addDataSourceProperty("serverName", properties.getProperty("jdbc.serverName"));
            config.addDataSourceProperty("port", properties.getProperty("jdbc.port"));
            config.addDataSourceProperty("databaseName", properties.getProperty("jdbc.schema"));
            config.addDataSourceProperty("user", properties.getProperty("jdbc.username"));
            config.addDataSourceProperty("password", properties.getProperty("jdbc.password"));

            connectionPool = new HikariDataSource(config); // setup the connection pool

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static Connection getConnection(){
        Connection connection = null; // fetch a connection
        try {
            connection = connectionPool.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static DSLContext getDSL(){
        DSLContext context = DSL.using(getConnection(), SQLDialect.MYSQL);
        return context;
    }

    public static Configuration getConfiguration(){
        DefaultConfiguration defaultConfiguration = new DefaultConfiguration();
        defaultConfiguration.setConnection(DBUtils.getConnection());
        defaultConfiguration.setSQLDialect(SQLDialect.MYSQL);
        return defaultConfiguration;
    }
}
