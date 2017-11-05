
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
public class CrudTipoEmpresa extends Conexion{
    
     public List<TipoEmpresa> mostrarTipoEmpresa()throws Exception{
    
        List<TipoEmpresa>ls = new ArrayList();
        ResultSet rs;
        try {
            this.conectar();
            String sql="select * from tipoempresa";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            TipoEmpresa tp=new TipoEmpresa();
            tp.setIdTipoEmpresa(rs.getInt("idtipoempresa"));
            tp.setNombre(rs.getString("nombre"));
            ls.add(tp);
            }
        } catch (Exception e) {
            throw e;
        }
        return ls;
    }
       
        //insertar
    
     public void insertarTipoEmpresa(TipoEmpresa tp)throws Exception{
    
    this.conectar();
    String sql="insert into tipoempresa(nombre) values (?)";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            
            ps.setString(1, tp.getNombre());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
    
    
    //modificar
    
     public void modificarTipoEmpresa(TipoEmpresa tp)throws Exception{
    
    this.conectar();
    String sql="update tipoempresa set nombre=? where idtipoempresa=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try { 
            ps.setString(1, tp.getNombre());
            ps.setInt(2, tp.getIdTipoEmpresa());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
     
     //eliminar
     
      public void eliminarTipoEmpresa(TipoEmpresa tp)throws Exception{
    
    this.conectar();
    String sql="delete from tipoempresa where idtipoempresa=?";
    PreparedStatement ps=this.getCon().prepareStatement(sql);
    
        try {
            ps.setInt(1, tp.getIdTipoEmpresa());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        }
    }
}
