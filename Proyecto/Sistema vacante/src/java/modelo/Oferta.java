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
public class Oferta {
    
    private int idoferta;
    private String nombre;
    private String descripcion;
    private double salario;
    private int vacante;
    private String edadRequerida;
    private int expRequerida;
    private String generoRequerido;
    private String tipoContratacion;
    private int idEmpresa;

    public Oferta() {
    }

    public Oferta(int idoferta, String nombre, String descripcion, double salario, int vacante, String edadRequerida, int expRequerida, String generoRequerido, String tipoContratacion, int idEmpresa) {
        this.idoferta = idoferta;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.salario = salario;
        this.vacante = vacante;
        this.edadRequerida = edadRequerida;
        this.expRequerida = expRequerida;
        this.generoRequerido = generoRequerido;
        this.tipoContratacion = tipoContratacion;
        this.idEmpresa = idEmpresa;
    }

    public int getIdoferta() {
        return idoferta;
    }

    public void setIdoferta(int idoferta) {
        this.idoferta = idoferta;
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

    public double getSalario() {
        return salario;
    }

    public void setSalario(double salario) {
        this.salario = salario;
    }

    public int getVacante() {
        return vacante;
    }

    public void setVacante(int vacante) {
        this.vacante = vacante;
    }

    public String getEdadRequerida() {
        return edadRequerida;
    }

    public void setEdadRequerida(String edadRequerida) {
        this.edadRequerida = edadRequerida;
    }

    public int getExpRequerida() {
        return expRequerida;
    }

    public void setExpRequerida(int expRequerida) {
        this.expRequerida = expRequerida;
    }

    public String getGeneroRequerido() {
        return generoRequerido;
    }

    public void setGeneroRequerido(String generoRequerido) {
        this.generoRequerido = generoRequerido;
    }

    public String getTipoContratacion() {
        return tipoContratacion;
    }

    public void setTipoContratacion(String tipoContratacion) {
        this.tipoContratacion = tipoContratacion;
    }

    public int getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(int idEmpresa) {
        this.idEmpresa = idEmpresa;
    }
    
    
}
