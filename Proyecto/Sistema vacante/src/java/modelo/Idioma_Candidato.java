
package modelo;

/**
 *
 * @author Marvin Antillon
 */
public class Idioma_Candidato {
 
    
    private int idIdiomaCandidato ;
    private int idCandidato;
    private int idIdioma;

    public Idioma_Candidato() {
    }

    public Idioma_Candidato(int idIdiomaCandidato, int idCandidato, int idIdioma) {
        this.idIdiomaCandidato = idIdiomaCandidato;
        this.idCandidato = idCandidato;
        this.idIdioma = idIdioma;
    }

    public int getIdIdiomaCandidato() {
        return idIdiomaCandidato;
    }

    public void setIdIdiomaCandidato(int idIdiomaCandidato) {
        this.idIdiomaCandidato = idIdiomaCandidato;
    }

    public int getIdCandidato() {
        return idCandidato;
    }

    public void setIdCandidato(int idCandidato) {
        this.idCandidato = idCandidato;
    }

    public int getIdIdioma() {
        return idIdioma;
    }

    public void setIdIdioma(int idIdioma) {
        this.idIdioma = idIdioma;
    }
    
    
}
