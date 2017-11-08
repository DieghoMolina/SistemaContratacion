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
public class CrudEmpresa extends Conexion{
    
    public List<Empresa> mostrarEmpresa()throws Exception{
    
        List<Empresa>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from empresa";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Empresa emp = new Empresa();
            emp.setIdEmpresa(rs.getInt("idempresa"));
            emp.setNombre(rs.getString("nombre"));
            emp.setDescripcion(rs.getString("descripcion"));
            emp.setLogo(rs.getString("logo"));
            emp.setIdDepto(rs.getInt("iddepto"));
            emp.setIdMunicipio(rs.getInt("idmunicipio"));
            emp.setIdTipoEmpresa(rs.getInt("idtipoempresa"));
            emp.setIdUsuario(rs.getInt("idusuario"));
            ls.add(emp);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
    
    
    //insertar
    
    public void insertarEmpresa(Empresa emp)throws Exception{
    
    this.conectar();
    String sql="insert into empresa(nombre,descripcion,logo,idDepto,idMunicipio,idTipoEmpresa,idUsuario) values (?,?,?,?,?,?,?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, emp.getNombre());
            ps.setString(2, emp.getDescripcion());
            ps.setString(3, emp.getLogo());
            ps.setInt(4, emp.getIdDepto());
            ps.setInt(5, emp.getIdMunicipio());
            ps.setInt(6, emp.getIdTipoEmpresa());
            ps.setInt(7, emp.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarEmpresa(Empresa emp)throws Exception{
    
    this.conectar();
    String sql="update empresa set nombre=?, descripcion=?, logo=?, idDepto=?, idMunicipio=?, idTipoempresa=?, idUsuario=? where idEmpresa=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
             
            ps.setString(1, emp.getNombre());
            ps.setString(2, emp.getDescripcion());
            ps.setString(3, emp.getLogo());
            ps.setInt(4, emp.getIdDepto());
            ps.setInt(5, emp.getIdMunicipio());
            ps.setInt(6, emp.getIdTipoEmpresa());
            ps.setInt(7, emp.getIdUsuario());
            ps.setInt(8, emp.getIdEmpresa());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarEmpresa(Empresa emp)throws Exception{
    
    this.conectar();
    String sql="delete from empresa where idempresa=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, emp.getIdEmpresa());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
      
       public List<Empresa> mostrarNombreEmpresa(int v)throws Exception{
    
        List<Empresa>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from empresa where idempresa="+v;
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Empresa emp = new Empresa();
            emp.setNombre(rs.getString("nombre"));
            ls.add(emp);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
    
}
