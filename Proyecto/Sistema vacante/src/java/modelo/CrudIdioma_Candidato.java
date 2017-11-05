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
public class CrudIdioma_Candidato extends Conexion{
 
    public List<Idioma_Candidato> mostrarIdiomaCandidato()throws Exception{
    
        List<Idioma_Candidato>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from idioma_candidato";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Idioma_Candidato ic=new Idioma_Candidato();
            ic.setIdIdiomaCandidato(rs.getInt("idIdiomaCandidato"));
            ic.setIdCandidato(rs.getInt("idcandidato"));
            ic.setIdIdioma(rs.getInt("ididioma"));
            ls.add(ic);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
    
    
    //insertar
    
    public void insertarIdiomaCandidato(Idioma_Candidato ic)throws Exception{
    
    this.conectar();
    String sql="insert into idioma_candidato values (?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, ic.getIdIdiomaCandidato());
            ps.setInt(2, ic.getIdCandidato());
            ps.setInt(1, ic.getIdIdioma());
            
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarIdiomaCandidato(Idioma_Candidato ic)throws Exception{
    
    this.conectar();
    String sql="update idioma_candidato set idcandidato=?, ididioma=? where ididiomacandidato=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setInt(1, ic.getIdCandidato());
            ps.setInt(2, ic.getIdIdioma());
            ps.setInt(3, ic.getIdIdiomaCandidato());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarIdiomaCandidato(Idioma_Candidato ic)throws Exception{
    
    this.conectar();
    String sql="delete from idioma_candidato where ididiomacandidato=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, ic.getIdIdiomaCandidato());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
}
