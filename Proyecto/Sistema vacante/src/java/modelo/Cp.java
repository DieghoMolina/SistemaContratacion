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
 * @author diego
 */
public class Cp extends Conexion{
        
      public List mostrarIdUsuario(String usuario)throws Exception{
        List ls = new ArrayList();
        String algo=null;
    
          ResultSet rs;
        try {
            this.conectar();
            String sql="select idusuario from usuario where  usuario =' " + usuario +" ' "; 
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Usuario u=new Usuario();
            u.setIdUsuario(rs.getInt("idusuario"));
            ls.add(u);
            
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
      
      
      
public Usuario leerId()throws Exception{
  Usuario usu=new Usuario();
     Usuario    us = null;
        ResultSet res;
        try {
            this.conectar();
            String sql="select idusuario from usuario where usuario=?";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            pre.setInt(1, usu.getIdUsuario());
            res=pre.executeQuery();
            while(res.next()){
            us= new Usuario();
            us.setIdUsuario(res.getInt("idusuario"));
            }
        } catch (Exception e) {
            throw e;
        }
        return us;
    }

}
