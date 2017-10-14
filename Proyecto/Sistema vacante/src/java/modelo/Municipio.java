package modelo;

/**
 *
 * @author Marvin Antillon
 */
public class Municipio {
    private int idMunicipio;
    private String nombre;
    private int idDepto;

    public Municipio() {
    }

    public Municipio(int idMunicipio, String nombre, int idDepto) {
        this.idMunicipio = idMunicipio;
        this.nombre = nombre;
        this.idDepto = idDepto;
    }

    public int getIdMunicipio() {
        return idMunicipio;
    }

    public void setIdMunicipio(int idMunicipio) {
        this.idMunicipio = idMunicipio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdDepto() {
        return idDepto;
    }

    public void setIdDepto(int idDepto) {
        this.idDepto = idDepto;
    }
    
}
