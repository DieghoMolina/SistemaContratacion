/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Marvin Antillon
 */
public class Candidato {
 
    private int idCandidato;
    private String nombre;
    private String apellido;
    private String correo;
    private String telefono;
    private String genero;
    private String fechaNac;
    private String foto;
    private int idioma;
    private int habilidad;
    private int expLaboral;
    private int idDepto;
    private int idMunicipio;
    private int idProfecion;
    private int idNivelAcad;
    private int idUsuario;

    public Candidato() {
    }

    public Candidato(int idCandidato, String nombre, String apellido, String correo, String telefono, String genero, String fechaNac, String foto, int idioma, int habilidad, int expLaboral, int idDepto, int idMunicipio, int idProfecion, int idNivelAcad, int idUsuario) {
        this.idCandidato = idCandidato;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.telefono = telefono;
        this.genero = genero;
        this.fechaNac = fechaNac;
        this.foto = foto;
        this.idioma = idioma;
        this.habilidad = habilidad;
        this.expLaboral = expLaboral;
        this.idDepto = idDepto;
        this.idMunicipio = idMunicipio;
        this.idProfecion = idProfecion;
        this.idNivelAcad = idNivelAcad;
        this.idUsuario = idUsuario;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getFechaNac() {
        return fechaNac;
    }

    public void setFechaNac(String fechaNac) {
        this.fechaNac = fechaNac;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getIdioma() {
        return idioma;
    }

    public void setIdioma(int idioma) {
        this.idioma = idioma;
    }

    public int getHabilidad() {
        return habilidad;
    }

    public void setHabilidad(int habilidad) {
        this.habilidad = habilidad;
    }

    public int getExpLaboral() {
        return expLaboral;
    }

    public void setExpLaboral(int expLaboral) {
        this.expLaboral = expLaboral;
    }

    public int getIdDepto() {
        return idDepto;
    }

    public void setIdDepto(int idDepto) {
        this.idDepto = idDepto;
    }

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public int getIdProfecion() {
        return idProfecion;
    }

    public void setIdProfecion(int idProfecion) {
        this.idProfecion = idProfecion;
    }

    public int getIdNivelAcad() {
        return idNivelAcad;
    }

    public void setIdNivelAcad(int idNivelAcad) {
        this.idNivelAcad = idNivelAcad;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    
    
}
