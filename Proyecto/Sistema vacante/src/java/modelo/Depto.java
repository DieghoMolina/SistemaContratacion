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
public class Depto {
    
    
    private int idDepto;
    private String nombre;

    public Depto() {
    }

    public Depto(int idDepto, String nombre) {
        this.idDepto = idDepto;
        this.nombre = nombre;
    }

    public int getIdDepto() {
        return idDepto;
    }

    public void setIdDepto(int idDepto) {
        this.idDepto = idDepto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    
}
