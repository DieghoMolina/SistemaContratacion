/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import conex.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author diego
 */
public class CrudRegistroUsuario extends Conexion{
    
    public Usuario mostrarId()throws Exception{
    
       Usuario us=null;
        ResultSet res;
        
        try {
            this.conectar();
            String sql="select idusuario from usuario where usuario='marvin'";
            PreparedStatement pre=this.getCon().prepareStatement(sql);
            res=pre.executeQuery();
            while(res.next()){
            us=new Usuario();
            us.setIdUsuario(res.getInt("idusuario"));

            }
        } catch (Exception e) {
            throw e;
        }
        return us;
    }
   
    public void insertarUsuario(Usuario us)throws Exception{
    
    this.conectar();
    String sql="insert into usuario(usuario,pass,nivel) values (?,?,2)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setString(1, us.getUsuario());
            ps.setString(2, us.getPass());
            ps.setInt(3, us.getNivel());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
        
    }
     public void InsertarCandidato(Candidato c, Usuario us) throws Exception
    {
        this.conectar();
            String sql="insert into candidato(nombre, apellido, email, tel, genero, fechanac,idUsuario) values(?,?,?,?,?,?,'+ps.setInt(7, us.getIdUsuario()); +')";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
        try {
            
           
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApellido());
            ps.setString(3, c.getCorreo());
            ps.setString(4, c.getTelefono());
            ps.setString(5, c.getGenero());
            ps.setString(6, c.getFechaNac());
            
            
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    
    
}
