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
public class CrudDepto extends Conexion{
    
    
       public List<Depto> mostrarDepto()throws Exception{
    
        List<Depto>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from depto";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Depto d=new Depto();
            d.setIdDepto(rs.getInt("iddepto"));
            d.setNombre(rs.getString("nombre"));
            ls.add(d);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
    public void insertarDepto(Depto d)throws Exception{
    
    this.conectar();
    String sql="insert into depto(nombre) values (?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, d.getNombre());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarDepto(Depto d)throws Exception{
    
    this.conectar();
    String sql="update depto set nombre=? where iddepto=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, d.getNombre());
            ps.setInt(2, d.getIdDepto());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarDepto(Depto d)throws Exception{
    
    this.conectar();
    String sql="delete from depto where iddepto=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, d.getIdDepto());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
}
