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
public class CrudProfesion extends Conexion{
    
    
     public List<Profesion> mostrarProfesion()throws Exception{
    
        List<Profesion>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from profesion";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Profesion pro=new Profesion();
            pro.setIdProfesion(rs.getInt("idprofesion"));
            pro.setNombre(rs.getString("nombre"));
            ls.add(pro);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
    public void insertarProfesion(Profesion pro)throws Exception{
    
    this.conectar();
    String sql="insert into profesion(nombre) values (?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
           
            ps.setString(1, pro.getNombre());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarProfesion(Profesion pro)throws Exception{
    
    this.conectar();
    String sql="update profesion set nombre=? where idprofesion=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, pro.getNombre());
            ps.setInt(2, pro.getIdProfesion());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarProfesion(Profesion pro)throws Exception{
    
    this.conectar();
    String sql="delete from profesion where idprofesion=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, pro.getIdProfesion());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
      
       public List<Profesion> mostrarNombreProfesion(int n)throws Exception{
    
        List<Profesion>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from profesion where idprofesion="+n;
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Profesion pro=new Profesion();
            pro.setNombre(rs.getString("nombre"));
            ls.add(pro);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
}
