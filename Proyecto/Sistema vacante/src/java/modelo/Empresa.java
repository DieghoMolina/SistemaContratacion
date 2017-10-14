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
public class Empresa {
    private int idEmpresa;
    private String nombre;
    private String descripcion;
    private String logo;
    private int idDepto;
    private int idMunicipio;
    private int idTipoEmpresa;
    private int idUsuario;

    public Empresa() {
    }

    public Empresa(int idEmpresa, String nombre, String descripcion, String logo, int idDepto, int idMunicipio, int idTipoEmpresa, int idUsuario) {
        this.idEmpresa = idEmpresa;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.logo = logo;
        this.idDepto = idDepto;
        this.idMunicipio = idMunicipio;
        this.idTipoEmpresa = idTipoEmpresa;
        this.idUsuario = idUsuario;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
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

    public int getIdTipoEmpresa() {
        return idTipoEmpresa;
    }

    public void setIdTipoEmpresa(int idTipoEmpresa) {
        this.idTipoEmpresa = idTipoEmpresa;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
}
