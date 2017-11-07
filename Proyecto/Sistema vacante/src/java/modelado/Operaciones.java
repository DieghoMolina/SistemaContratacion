/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelado;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Marvin Antillon
 */
public class Operaciones {
 
    String driver;
    String url;
    String uss;
    String contra;

    public Operaciones() {
        
    driver="org.postgresql.Driver";
    url="jdbc:postgresql://localhost:5432/proyecto";
    uss="postgres";
    contra="123";
    }
    
    public int loguear(String us, String pass){
    
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        int nivel=0;
        String sql="select nivel from usuario where usuario='"+ us + "'and pass='"+ pass +"'";
        try {
            Class.forName(this.driver);
            con=DriverManager.getConnection(
            this.url,
                    this.uss,
                    this.contra
            );
            pst=con.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
            nivel=rs.getInt(1);
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        
        return nivel;
    }
}
