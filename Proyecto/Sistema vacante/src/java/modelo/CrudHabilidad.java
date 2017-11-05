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
public class CrudHabilidad extends Conexion{
      public List<Habilidad> mostrarHabilidad()throws Exception{
    
        List<Habilidad> ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from habilidad";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Habilidad h=new Habilidad();
            h.setIdHabilidad(rs.getInt("idhabilidad"));
            h.setNombre(rs.getString("nombre"));
            ls.add(h);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
    public void insertarHabilidad(Habilidad h)throws Exception{
    
    this.conectar();
    String sql="insert into habilidad(nombre) values (?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, h.getNombre());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarHabilidad(Habilidad h)throws Exception{
    
    this.conectar();
    String sql="update habilidad set nombre=? where idhabilidad=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, h.getNombre());
            ps.setInt(2, h.getIdHabilidad());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarHabilidad(Habilidad h)throws Exception{
    
    this.conectar();
    String sql="delete from habilidad where idhabilidad=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, h.getIdHabilidad());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
      public List mostrarNombre(int ss)throws Exception
      {
          List resultado=null;
           ResultSet rs;
        try {
            this.conectar();
            String sql="select nombre from habilidad where idhabilidad="+ss;
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Habilidad h=new Habilidad();
            h.setNombre(rs.getString("nombre"));
            resultado.add(h);
            }
        } catch (Exception e) {
            throw e;
        }
        return resultado;
      }
}
