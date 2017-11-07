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
    
    public String[] loguear(String us, String pass){
    
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String[] dato =new String[4];
        String sql="select * from usuario where usuario='"+ us + "'and pass='"+ pass +"'";
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
            dato[0]=String.valueOf(rs.getInt(1));
            dato[1]=rs.getString(2);
            dato[2]=rs.getString(3);
            dato[3]=String.valueOf(rs.getInt(4));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        
        return dato;
    }
    
     public String[] loguearEmpresa(String us, String pass){
    
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        String[] dato =new String[4];
         String sql="select * from usuario where usuario='"+ us + "'and pass='"+ pass +"'";
      /*   String sql="select u.idusuario, u.usuario, u.pass, u.nivel, e.idempresa from usuario as u\n" +
"inner join empresa as e on u.idusuario = e.idusuario  where usuario='"+ us + "'and pass='"+ pass +"'"; */
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
            dato[0]=String.valueOf(rs.getInt(1));
            dato[1]=rs.getString(2);
            dato[2]=rs.getString(3);
            dato[3]=String.valueOf(rs.getInt(4));
            //dato[4]=String.valueOf(rs.getInt(5));
            }
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
        }
        
        return dato;
    }
    
}
