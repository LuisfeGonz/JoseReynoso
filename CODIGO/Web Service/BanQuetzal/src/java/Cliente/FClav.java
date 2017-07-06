/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Cliente;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Random;

/**
 *
 * @author JLRT
 */
public class FClav {
    public FClav() {
    }

    public String claveAleatoria() {
        int num1 = 0;
        String clave = "";
        long m = new java.util.GregorianCalendar().getTimeInMillis();
        Random rand = new Random(m);

        while (num1 < 8) {
            char c = (char) rand.nextInt(225);
            if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z')) {
                clave += c;
                num1++;

            }
        }
        return clave;
    }
    
    public long numCuenta(){
        Calendar cal = new GregorianCalendar();
        String a = Integer.toString(cal.get(Calendar.MILLISECOND));
        String b =Integer.toString(cal.get(Calendar.SECOND));
        String c =Integer.toString(cal.get(Calendar.MINUTE));
        String d =Integer.toString(cal.get(Calendar.HOUR));
        String e =Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
        String g =Integer.toString(cal.get(Calendar.YEAR));
        String f =Integer.toString(cal.get(Calendar.MONTH));
        String numero = a+b+c+d+e+f+g;
        return Long.parseLong(numero);
    }
    
    public String fechaActual(){
        Calendar cal = new GregorianCalendar();
        String yy = Integer.toString(cal.get(Calendar.YEAR));
        String mm = Integer.toString(cal.get(Calendar.MONTH)+1);
        String dd = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
        
        return yy+"/"+mm+"/"+dd;
    }
    
    public String fechaHoraActual(){
        Calendar cal = new GregorianCalendar();
        String yy = Integer.toString(cal.get(Calendar.YEAR));
        String mm = Integer.toString(cal.get(Calendar.MONTH)+1);
        String dd = Integer.toString(cal.get(Calendar.DAY_OF_MONTH));
        String ss =Integer.toString(cal.get(Calendar.SECOND));
        String MM =Integer.toString(cal.get(Calendar.MINUTE));
        String HH =Integer.toString(cal.get(Calendar.HOUR));
        
        return yy+"/"+mm+"/"+dd+" "+HH+":"+MM+":"+ss;
    }
    
    public String formatoFecha(){
        
        return "";
    }
}
