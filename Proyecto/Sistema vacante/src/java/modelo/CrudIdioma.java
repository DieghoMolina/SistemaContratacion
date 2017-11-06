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
public class CrudIdioma extends Conexion{
      
    public List<Idioma> mostrarIdioma()throws Exception{
    
        List<Idioma>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from idioma";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Idioma idi=new Idioma();
            idi.setIdIdioma(rs.getInt("ididioma"));
            idi.setNombre(rs.getString("nombre"));
            ls.add(idi);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
    public void insertarIdioma(Idioma idi)throws Exception{
    
    this.conectar();
    String sql="insert into idioma(nombre) values (?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, idi.getNombre());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarIdioma(Idioma idi)throws Exception{
    
    this.conectar();
    String sql="update idioma set nombre=? where ididioma=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, idi.getNombre());
            ps.setInt(2, idi.getIdIdioma());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarIdioma(Idioma idi)throws Exception{
    
    this.conectar();
    String sql="delete from idioma where ididioma=? ;";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, idi.getIdIdioma());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
       public List<Idioma> mostrarNombreIdioma(int n)throws Exception{
    
        List<Idioma>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from idioma where ididioma="+n;
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Idioma idi=new Idioma();
            idi.setNombre(rs.getString("nombre"));
            ls.add(idi);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
      
}
