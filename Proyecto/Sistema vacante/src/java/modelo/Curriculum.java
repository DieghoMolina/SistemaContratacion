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
public class Curriculum {
 
    private int idCurriculum;
    private String curriculum;
    private String fechaModi;
    private int idCandidato;

    public Curriculum() {
    }

    public Curriculum(int idCurriculum, String curriculum, String fechaModi, int idCandidato) {
        this.idCurriculum = idCurriculum;
        this.curriculum = curriculum;
        this.fechaModi = fechaModi;
        this.idCandidato = idCandidato;
    }

    public int getIdCurriculum() {
        return idCurriculum;
    }

    public void setIdCurriculum(int idCurriculum) {
        this.idCurriculum = idCurriculum;
    }

    public String getCurriculum() {
        return curriculum;
    }

    public void setCurriculum(String curriculum) {
        this.curriculum = curriculum;
    }

    public String getFechaModi() {
        return fechaModi;
    }

    public void setFechaModi(String fechaModi) {
        this.fechaModi = fechaModi;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }
    
    
}
