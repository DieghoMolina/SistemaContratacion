/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import conex.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marvin Antillon
 */
public class CrudUsuario extends Conexion{
    
    public List<Usuario> mostrarUsuario()throws Exception{
    
        List<Usuario>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from usuario";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Usuario us= new Usuario();
            us.setIdUsuario(rs.getInt("idusuario"));
            us.setUsuario(rs.getString("usuario"));
            us.setPass(rs.getString("pass"));
            us.setNivel(rs.getInt("nivel"));
            ls.add(us);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
    
    
    //insertar
    
    public void insertarUsuario(Usuario us)throws Exception{
    
    this.conectar();
    String sql="insert into usuario(usuario,pass,nivel) values (?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getPass());
            ps.setInt(3, us.getNivel());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarUsuario(Usuario us)throws Exception{
    
    this.conectar();
    String sql="update usuario set usuario=?, pass=?, nivel=? where idusuario=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getPass());
            ps.setInt(3, us.getNivel());
            ps.setInt(4, us.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarUsuario(Usuario us)throws Exception{
    
    this.conectar();
    String sql="delete from usuario where idusuario=?";
    PreparedStatement ps= this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, us.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
}
