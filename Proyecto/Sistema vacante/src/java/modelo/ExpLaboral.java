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
public class ExpLaboral {
    
    
    private int idExpLaboral;
    private String nombre;
    private String cargo;
    private String fechaInicio;
    private String fechaFin;
    private int idCandidato;

    public ExpLaboral() {
    }

    public ExpLaboral(int idExpLaboral, String nombre, String cargo, String fechaInicio, String fechaFin, int idCandidato) {
        this.idExpLaboral = idExpLaboral;
        this.nombre = nombre;
        this.cargo = cargo;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.idCandidato = idCandidato;
    }

    public int getIdExpLaboral() {
        return idExpLaboral;
    }

    public void setIdExpLaboral(int idExpLaboral) {
        this.idExpLaboral = idExpLaboral;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(String fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(String fechaFin) {
        this.fechaFin = fechaFin;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }
    
    
}
