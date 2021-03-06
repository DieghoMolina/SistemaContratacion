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
public class CrudOferta extends Conexion{
        public List<Oferta> mostrarOferta()throws Exception{
    
        List<Oferta>ls = new ArrayList();
        ResultSet rs;
        
        try {
            this.conectar();
            String sql="select * from oferta";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Oferta o = new Oferta();
            
            o.setIdoferta(rs.getInt("idoferta"));
            o.setNombre(rs.getString("nombre"));
            o.setDescripcion(rs.getString("descripcion"));
            o.setSalario(rs.getDouble("salario"));
            o.setVacante(rs.getInt("vacante"));
            o.setEdadRequerida(rs.getString("edadrequerida"));
            o.setExpRequerida(rs.getInt("exprequerida"));
            o.setGeneroRequerido(rs.getString("generorequerido"));
            o.setTipoContratacion(rs.getString("tipocontratacion"));
            o.setIdEmpresa(rs.getInt("idempresa"));
            ls.add(o);
            }
        } catch (Exception e) {
            throw  e;
        }
        return ls;
    }
    //Insertar
    public void InsertarOferta(Oferta o) throws Exception
    {
        try {
            this.conectar();
            String sql="insert into oferta(nombre,descripcion,salario,vacante,edadRequerida,expRequerida,generoRequerido,tipoContratacion,"
                    + "idEmpresa ) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
           
            
            ps.setString(1, o.getNombre());
            ps.setString(2, o.getDescripcion());
            ps.setDouble(3, o.getSalario());
            ps.setInt(4, o.getVacante());
            ps.setString(5, o.getEdadRequerida());
            ps.setInt(6, o.getExpRequerida());
            ps.setString(7, o.getGeneroRequerido());
            ps.setString(8, o.getTipoContratacion());
            ps.setInt(9, o.getIdEmpresa());
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    
    //Modificar
    public void ModificarOferta(Oferta o) throws Exception
    {
        try {
            this.conectar();
            String sql="update  oferta set nombre=?, descripcion=?, salario=?, vacante=?, edadrequerida=?, exprequerida=?, generorequerido=?, tipocontratacion=?, idempresa=? where idoferta=?";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            
            ps.setString(1 , o.getNombre());
            ps.setString(2 , o.getDescripcion());
            ps.setDouble(3 , o.getSalario());
            ps.setInt(4 , o.getVacante());
            ps.setString(5 , o.getEdadRequerida());
            ps.setInt(6 , o.getExpRequerida());
            ps.setString(7 , o.getGeneroRequerido());
            ps.setString(8 , o.getTipoContratacion());            
            ps.setInt(9 , o.getIdEmpresa());
            ps.setInt(10 , o.getIdoferta());
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    //eliminar
    public void EliminarOferta(Oferta o) throws Exception
    {
        try {
            this.conectar();
            String sql="delete from  oferta where idoferta=?";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
           ps.setInt(1, o.getIdoferta());
           ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    

}
