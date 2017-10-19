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
public class CrudExpLaboral extends Conexion{
    
    
    public List<ExpLaboral> mostrarExpLaboral()throws Exception{
    
        List<ExpLaboral>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from explaboral";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            ExpLaboral exp=new ExpLaboral();
            exp.setIdExpLaboral(rs.getInt("idexplaboral"));
            exp.setNombre(rs.getString("nombreempresa"));
            exp.setCargo(rs.getString("cargo"));
            exp.setFechaInicio(rs.getString("fechainicio"));
            exp.setFechaFin(rs.getString("fechafin"));
            exp.setIdCandidato(rs.getInt("idcandidato"));
            ls.add(exp);
            }
        } catch (Exception e) {
            throw e;
        }
        
        return ls;
    }
    
    
    //insertar
    
    public void insertarExpLaboral(ExpLaboral exp)throws Exception{
    
    this.conectar();
    String sql="insert into explaboral values (?,?,?,?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, exp.getIdExpLaboral());
            ps.setString(2, exp.getNombre());
            ps.setString(3, exp.getCargo());
            ps.setString(4, exp.getFechaInicio());
            ps.setString(5, exp.getFechaFin());
            ps.setInt(6, exp.getIdCandidato());
            mostrarExpLaboral();
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarExplaboral(ExpLaboral exp)throws Exception{
    
    this.conectar();
    String sql="update explaboral set nombreempresa=?, cargo=?, fechainicio=?, fechafin=?, idcandidato=? where idexplaboral=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {           
          ps.setString(1, exp.getNombre());
            ps.setString(2, exp.getCargo());
            ps.setString(3, exp.getFechaInicio());
            ps.setString(4, exp.getFechaFin());
            ps.setInt(5, exp.getIdCandidato());
            ps.setInt(6, exp.getIdExpLaboral());
            ps.executeUpdate();
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarExpLaboral(ExpLaboral exp)throws Exception{
    
    this.conectar();
    String sql="delete from explaboral where idexplaboral=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, exp.getIdExpLaboral());
            ps.executeUpdate();
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
}
