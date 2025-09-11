package net.numeritos.db.factory;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.FactoryBean;

import com.j256.ormlite.db.DatabaseType;
import com.j256.ormlite.jdbc.DataSourceConnectionSource;
import com.j256.ormlite.jdbc.db.Db2DatabaseType;
import com.j256.ormlite.jdbc.db.DerbyEmbeddedDatabaseType;
import com.j256.ormlite.jdbc.db.H2DatabaseType;
import com.j256.ormlite.jdbc.db.HsqldbDatabaseType;
import com.j256.ormlite.jdbc.db.MariaDbDatabaseType;
import com.j256.ormlite.jdbc.db.MysqlDatabaseType;
import com.j256.ormlite.jdbc.db.OracleDatabaseType;
import com.j256.ormlite.jdbc.db.PostgresDatabaseType;
import com.j256.ormlite.jdbc.db.SqlServerDatabaseType;
import com.j256.ormlite.jdbc.db.SqliteDatabaseType;

public class OrmLiteConnectionSourceFactory implements FactoryBean<DataSourceConnectionSource> {
	private DataSource dataSource;

    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public DataSourceConnectionSource getObject() throws Exception {
        DatabaseType dbType = detectDatabaseType();
        return new DataSourceConnectionSource(dataSource, dbType);
    }

    private DatabaseType detectDatabaseType() throws SQLException {
        try (Connection conn = dataSource.getConnection()) {
            String name = conn.getMetaData().getDatabaseProductName().toLowerCase();
            if (name.contains("h2")) {
                return new H2DatabaseType();
            } else if (name.contains("mysql")) {
                return new MysqlDatabaseType();
            } else if (name.contains("mariadb")) {
                return new MariaDbDatabaseType();                
            } else if (name.contains("postgresql")) {
                return new PostgresDatabaseType();
            } else if (name.contains("oracle")) {
                return new OracleDatabaseType();                
            } else if (name.contains("sqlite")) {
                return new SqliteDatabaseType();  
            } else if (name.contains("derby")) {
                return new DerbyEmbeddedDatabaseType();   
            } else if (name.contains("hsqldb")) {
                return new HsqldbDatabaseType();  
            } else if (name.contains("microsoft")) {
                return new SqlServerDatabaseType();   
            } else if (name.contains("db2")) {
                return new Db2DatabaseType();                
            } else {
                throw new SQLException("Base de datos no soportada: " + name);
            }
        }
    }

    @Override
    public Class<?> getObjectType() {
        return DataSourceConnectionSource.class;
    }

    @Override
    public boolean isSingleton() {
        return true;
    }
}
