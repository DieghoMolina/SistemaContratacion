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
public class CrudNivelAcademico extends Conexion{
    
     public List<NivelAcademico> mostrarNivelAcad()throws Exception{
    
        List<NivelAcademico>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from nivelacad";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            NivelAcademico na = new NivelAcademico();
            na.setIdNivelAca(rs.getInt("idnivelacad"));
            na.setNombre(rs.getString("nombre"));
            ls.add(na);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
    public void insertarNivelAca(NivelAcademico na)throws Exception{
    
    this.conectar();
    String sql="insert into nivelacad values (?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, na.getIdNivelAca());
            ps.setString(2, na.getNombre());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarNivelAca(NivelAcademico na)throws Exception{
    
    this.conectar();
    String sql="update nivelacad set nombre=? where idnivelacad=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, na.getNombre());
            ps.setInt(2, na.getIdNivelAca());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarNivelAca(NivelAcademico na)throws Exception{
    
    this.conectar();
    String sql="delete from nivelacad where idnivelacad=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, na.getIdNivelAca());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
}
