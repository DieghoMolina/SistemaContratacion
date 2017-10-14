
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
public class CrudCandidato extends Conexion{
 
    
    //mostrar
    
    public List<Candidato> mostrarCandidato()throws Exception{
    
        List<Candidato>ls = new ArrayList();
        ResultSet rs;
        
        try {
            this.conectar();
            String sql="select * from candidato";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
            Candidato c = new Candidato();
            
            c.setIdCandidato(rs.getInt("idcandidato"));
            c.setNombre(rs.getString("nombre"));
            c.setApellido(rs.getString("apellido"));
            c.setCorreo(rs.getString("email"));
            c.setTelefono(rs.getString("tel"));
            c.setGenero(rs.getString("genero"));
            c.setFechaNac(rs.getString("fechanac"));
            c.setFoto(rs.getString("foto"));
            c.setIdioma(rs.getString("idioma"));
            c.setHabilidad(rs.getString("habilidad"));
            c.setExpLaboral(rs.getInt("explaboral"));
            c.setIdDepto(rs.getInt("iddepto"));
            c.setIdMunicipio(rs.getInt("idmunicipio"));
            c.setIdProfecion(rs.getInt("idprofesion"));
            c.setIdNivelAcad(rs.getInt("idnivelAcad"));
            c.setIdUsuario(rs.getInt("idusuario"));
            ls.add(c);
            }
        } catch (Exception e) {
            throw  e;
        }
        return ls;
    }
    //Insertar
    public void InsertarCandidato(Candidato c) throws Exception
    {
        this.conectar();
            String sql="insert into candidato values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
        try {
            
            ps.setInt(1, c.getIdCandidato());
            ps.setString(2, c.getNombre());
            ps.setString(3, c.getApellido());
            ps.setString(4, c.getCorreo());
            ps.setString(5, c.getTelefono());
            ps.setString(6, c.getGenero());
            ps.setString(7, c.getFechaNac());
            ps.setString(8, c.getFoto());
            ps.setString(9, c.getIdioma());
            ps.setString(10, c.getHabilidad());
            ps.setInt(11, c.getExpLaboral());
            ps.setInt(12, c.getIdDepto());
            ps.setInt(13, c.getIdMunicipio());
            ps.setInt(14, c.getIdProfecion());
            ps.setInt(15, c.getIdNivelAcad());
            ps.setInt(16, c.getIdUsuario());
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    
    //Modificar
    public void ModificarCandidato(Candidato c) throws Exception
    {
        try {
            this.conectar();
            String sql="update  candidato set nombre=?, apellido=?, email=?, tel=?, genero=?, fechanac=?, foto=?, idioma=?, hailidad=?, explaboral=?, iddepto=?, idmunicipio=?, idprofesion=?, idnivelAcad=?, idusuario=? where idcandidato=?)";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
            ps.setString(1, c.getNombre());
            ps.setString(2, c.getApellido());
            ps.setString(3, c.getCorreo());
            ps.setString(4, c.getTelefono());
            ps.setString(5, c.getGenero());
            ps.setString(6, c.getFechaNac());
            ps.setString(7, c.getFoto());
            ps.setString(8, c.getIdioma());
            ps.setString(9, c.getHabilidad());
            ps.setInt(10, c.getExpLaboral());
            ps.setInt(11, c.getIdDepto());
            ps.setInt(12, c.getIdMunicipio());
            ps.setInt(13, c.getIdProfecion());
            ps.setInt(14, c.getIdNivelAcad());
            ps.setInt(15, c.getIdUsuario());
            ps.setInt(16, c.getIdCandidato());
         
            ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    //eliminar
    public void EliminarCandidato(Candidato c) throws Exception
    {
        try {
            this.conectar();
            String sql="delete from  candidato where idcandidato=?";
            PreparedStatement ps=this.getCon().prepareStatement(sql);
           ps.setInt(1, c.getIdCandidato());
           ps.executeUpdate();
        } catch (Exception e) {
        throw e;
        }
    }
    
    
    
}
