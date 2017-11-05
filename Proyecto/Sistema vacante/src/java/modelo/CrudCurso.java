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
public class CrudCurso extends Conexion{
    
       public List<Curso> mostrarCurso()throws Exception{
    
        List<Curso>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from curso";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Curso cur = new Curso();
            cur.setIdCurso(rs.getInt("idcurso"));
            cur.setNombre(rs.getString("nombre"));
            cur.setYear(rs.getInt("year"));
            cur.setIdcandidato(rs.getInt("idcandidato"));
            ls.add(cur);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
    
    
    //insertar
    
    public void insertarCurso(Curso cur)throws Exception{
    
    this.conectar();
    String sql="insert into curso(nombre,year,idCandidato) values (?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
           
            ps.setString(1, cur.getNombre());
            ps.setInt(2, cur.getYear());
            ps.setInt(3, cur.getIdcandidato());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarCurso(Curso cur)throws Exception{
    
    this.conectar();
    String sql="update curso set nombre=?, year=?, idcandidato=? where idcurso=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, cur.getNombre());
            ps.setInt(2, cur.getYear());
            ps.setInt(3, cur.getIdcandidato());
            ps.setInt(4, cur.getIdCurso());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarCurso(Curso cur)throws Exception{
    
    this.conectar();
    String sql="delete from curso where idcurso=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, cur.getIdCurso());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
}
