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
public class CrudCurriculum  extends Conexion{
    
    public List<Curriculum> mostrarCurriculum()throws Exception{
    
        List<Curriculum>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from curriculum";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Curriculum cu=new Curriculum();
            cu.setIdCurriculum(rs.getInt("idcurriculum"));
            cu.setCurriculum(rs.getString("curriculum"));
            cu.setFechaModi(rs.getString("fechamodi"));
            cu.setIdCandidato(rs.getInt("idcandidato"));
            ls.add(cu);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
    
    
    //insertar
    
    public void insertarCurriculum(Curriculum cu)throws Exception{
    
    this.conectar();
    String sql="insert into curriculum(curriculum,fechaModi,idCandidato) values (?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, cu.getCurriculum());
            ps.setString(2, cu.getFechaModi());
            ps.setInt(3, cu.getIdCandidato());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarCurriculum(Curriculum cu)throws Exception{
    
    this.conectar();
    String sql="update curriculum set curriculum=?, fechamodi=?, idcandidato=? where idcurriculum=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, cu.getCurriculum());
            ps.setString(2, cu.getFechaModi());
            ps.setInt(3, cu.getIdCandidato());
            ps.setInt(4, cu.getIdCurriculum());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarCurriculum(Curriculum cu)throws Exception{
    
    this.conectar();
    String sql="delete from curriculum where idcurriculum=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, cu.getIdCurriculum());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
}
