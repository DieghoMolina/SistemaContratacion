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
public class NivelAcademico {
    
    private int idNivelAca;
    private String nombre;

    public NivelAcademico() {
    }

    public NivelAcademico(int idNivelAca, String nombre) {
        this.idNivelAca = idNivelAca;
        this.nombre = nombre;
    }

    public int getIdNivelAca() {
        return idNivelAca;
    }

    public void setIdNivelAca(int idNivelAca) {
        this.idNivelAca = idNivelAca;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    
}
