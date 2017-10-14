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
public class Curso {
 
    private int idCurso;
    private String nombre;
    private int year;
    private int idcandidato;

    public Curso() {
    }

    public Curso(int idCurso, String nombre, int year, int idcandidato) {
        this.idCurso = idCurso;
        this.nombre = nombre;
        this.year = year;
        this.idcandidato = idcandidato;
    }

    public int getIdCurso() {
        return idCurso;
    }

    public void setIdCurso(int idCurso) {
        this.idCurso = idCurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getIdcandidato() {
        return idcandidato;
    }

    public void setIdcandidato(int idcandidato) {
        this.idcandidato = idcandidato;
    }

    
    
}
