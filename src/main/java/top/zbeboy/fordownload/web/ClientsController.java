package top.zbeboy.fordownload.web;

import br.com.caelum.vraptor.Controller;
import org.jooq.Configuration;
import org.jooq.SQLDialect;
import org.jooq.impl.DefaultConfiguration;
import org.jooq.impl.DefaultConnectionProvider;
import top.zbeboy.fordownload.domain.tables.daos.AddressDao;
import top.zbeboy.fordownload.domain.tables.daos.SchemaVersionDao;
import top.zbeboy.fordownload.domain.tables.pojos.Address;
import top.zbeboy.fordownload.util.DBUtils;

import javax.inject.Inject;
import java.io.IOException;
import java.util.Properties;

/**
 * Created by Administrator on 2016/7/6.
 */
@Controller
public class ClientsController {

    private AddressDao addressDao;

    public void form() throws IOException {
        Properties properties = new Properties();
        properties.load(ClientsController.class.getClassLoader().getResourceAsStream("db.properties"));
        System.out.println(properties.getProperty("jdbc.url"));
        addressDao = new AddressDao(DBUtils.getConfiguration());
        Address address = addressDao.findById(1);
        System.out.println(address.getCity());
    }
}
