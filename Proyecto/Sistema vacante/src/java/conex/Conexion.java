package conex;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Marvin Antillon
 */
public class Conexion {
    
    
    private Connection con;

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    
    public void conectar()throws Exception{
    
        try {
            Class.forName("org.postgresql.Driver");
            con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/proyecto?user=postgres&password=123");
        } catch (Exception e) {
            throw e;
        }
    }
}
