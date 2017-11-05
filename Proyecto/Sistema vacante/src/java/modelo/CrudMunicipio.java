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
public class CrudMunicipio extends Conexion{
    
    
       public List<Municipio> mostrarMunicipio()throws Exception{
    
        List<Municipio>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from municipio";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Municipio m=new Municipio();
            m.setIdMunicipio(rs.getInt("idmunicipio"));
            m.setNombre(rs.getString("nombre"));
            m.setIdDepto(rs.getInt("iddepto"));
            ls.add(m);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
    public void insertarMunicipio(Municipio m)throws Exception{
    
    this.conectar();
    String sql="insert into municipio values (?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, m.getIdMunicipio());
            ps.setString(2, m.getNombre());
             ps.setInt(3, m.getIdDepto());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarMunicipio(Municipio m)throws Exception{
    
    this.conectar();
    String sql="update municipio set nombre=?, iddepto=? where idmunicipio=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, m.getNombre());
            ps.setInt(2, m.getIdDepto());
            ps.setInt(3, m.getIdMunicipio());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarMunicipio(Municipio m)throws Exception{
    
    this.conectar();
    String sql="delete from municipio where idmunicipio=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, m.getIdMunicipio());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
}
