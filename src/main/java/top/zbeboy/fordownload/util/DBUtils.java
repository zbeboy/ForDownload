package top.zbeboy.fordownload.util;

import com.jolbox.bonecp.BoneCP;
import com.jolbox.bonecp.BoneCPConfig;
import org.apache.commons.lang.math.NumberUtils;
import org.jooq.*;
import org.jooq.conf.Settings;
import org.jooq.impl.DSL;
import org.jooq.impl.DefaultConfiguration;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.Properties;

/**
 * Created by Administrator on 2016/7/6.
 */
public class DBUtils {

    private static BoneCP connectionPool;

    static {
        try {
            Properties properties = new Properties();
            properties.load(DBUtils.class.getClassLoader().getResourceAsStream("db.properties"));
            // load the database driver (make sure this is in your classpath!)
            Class.forName(properties.getProperty("jdbc.driver"));

            // setup the connection pool
            BoneCPConfig config = new BoneCPConfig();
            config.setJdbcUrl(properties.getProperty("jdbc.url")); // jdbc url specific to your database, eg jdbc:mysql://127.0.0.1/yourdb
            config.setUsername(properties.getProperty("jdbc.username"));
            config.setPassword(properties.getProperty("jdbc.password"));
            config.setMinConnectionsPerPartition(NumberUtils.toInt(properties.getProperty("jdbc.minConnectionsPerPartition","5")));
            config.setMaxConnectionsPerPartition(NumberUtils.toInt(properties.getProperty("jdbc.maxConnectionsPerPartition","10")));
            config.setPartitionCount(NumberUtils.toInt(properties.getProperty("jdbc.partitionCount","1")));
            connectionPool = new BoneCP(config); // setup the connection pool

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
