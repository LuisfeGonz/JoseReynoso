/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cliente;

/**
 *
 * @author JLRT
 */
public class tipoCuenta {
    private int id;
    private float interes;
    private String nombre;
    private String descripcion;

    public tipoCuenta(int id, String nombre, float interes) {
        this.id=id;
        this.nombre=nombre;
        this.interes=interes;
    }

    /**
     * @return the id
     */
    public int getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the descripcion
     */
    public String getDescripcion() {
        return descripcion;
    }

    /**
     * @param descripcion the descripcion to set
     */
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    /**
     * @return the interes
     */
    public float getInteres() {
        return interes;
    }

    /**
     * @param interes the interes to set
     */
    public void setInteres(float interes) {
        this.interes = interes;
    }
}
