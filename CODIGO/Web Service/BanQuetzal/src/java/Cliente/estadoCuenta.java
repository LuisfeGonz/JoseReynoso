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
public class estadoCuenta {
    private String debe, haber, saldo, fecha;
    
    public estadoCuenta(String debe, String haber, String saldo, String fecha) {
        this.debe = debe;
        this.haber = haber;
        this.saldo = saldo;
        this.fecha = fecha;
    }

    /**
     * @return the debe
     */
    public String getDebe() {
        return debe;
    }

    /**
     * @param debe the debe to set
     */
    public void setDebe(String debe) {
        this.debe = debe;
    }

    /**
     * @return the haber
     */
    public String getHaber() {
        return haber;
    }

    /**
     * @param haber the haber to set
     */
    public void setHaber(String haber) {
        this.haber = haber;
    }

    /**
     * @return the saldo
     */
    public String getSaldo() {
        return saldo;
    }

    /**
     * @param saldo the saldo to set
     */
    public void setSaldo(String saldo) {
        this.saldo = saldo;
    }

    /**
     * @return the fecha
     */
    public String getFecha() {
        return fecha;
    }

    /**
     * @param fecha the fecha to set
     */
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

}
