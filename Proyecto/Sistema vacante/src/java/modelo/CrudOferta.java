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
            this.getCon();
            String sql="insert into oferta values(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            ps.setInt(1, o.getIdoferta());
            ps.setString(2, o.getNombre());
            ps.setString(3, o.getDescripcion());
            ps.setDouble(4, o.getSalario());
            ps.setInt(5, o.getVacante());
            ps.setString(6, o.getEdadRequerida());
            ps.setInt(7, o.getExpRequerida());
            ps.setString(8, o.getGeneroRequerido());
            ps.setString(9, o.getTipoContratacion());
            ps.setInt(10, o.getIdEmpresa());
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    
    //Modificar
    public void ModificarOferta(Oferta o) throws Exception
    {
        try {
            this.getCon();
            String sql="update  oferta set nombre=?, descripcion=?, salario=?, vacante=?, edadrequerida=?, exprequerida=?, generorequerido=?, tipocontratacion=?, idempresa=? where idoferta=?)";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            
            ps.setInt(1, o.getIdEmpresa());
            ps.setInt(2, o.getIdoferta());
            ps.setString(3, o.getNombre());
            ps.setString(4, o.getDescripcion());
            ps.setDouble(5, o.getSalario());
            ps.setInt(6, o.getVacante());
            ps.setString(7, o.getEdadRequerida());
            ps.setInt(8, o.getExpRequerida());
            ps.setString(9, o.getGeneroRequerido());
            ps.setString(10, o.getTipoContratacion());            
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    //eliminar
    public void EliminarOferta(Oferta o) throws Exception
    {
        try {
            this.getCon();
            String sql="delete from  oferta where idoferta=?";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
           ps.setInt(1, o.getIdoferta());
           ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    

}
