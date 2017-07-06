/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsBQ;

import Cliente.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author JLRT
 */
@WebService(serviceName = "wsBQ")
public class wsBQ {

    FClav clave = new FClav();

    String ruta = "jdbc:mariadb://localhost:3306/banquetzal";
    String user = "root";
    String pass = "ch34f2010";
    String query = "";

    Connection con;
    ResultSet rs;
    Statement st;

    public wsBQ() {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            con = DriverManager.getConnection(ruta, user, pass);
            st = con.createStatement();
            System.out.println("Conectado");
        } catch (Exception ex) {
        }
    }
    
    //**CAJERO
    @WebMethod(operationName = "saldoCuenta")
    public double saldoCuenta(@WebParam(name="cuenta") long cuenta){
        if(con!= null){
            try {
                this.query="select saldo from cuenta where noCuenta="+cuenta;
                rs = st.executeQuery(query);
                double saldo = 0;
                while(rs.next()){
                    saldo = rs.getDouble(1);
                }
                return saldo;
            } catch (Exception e) {
                return 0;
            }
        }else{
            return 0;
        }
    }
    
    @WebMethod(operationName = "depositarCambioCheque")
    public boolean depositarCambiarCheque(@WebParam(name="saldo") double saldo, @WebParam(name="agencia") int agencia,@WebParam(name="operador") long CUIOp,@WebParam(name="idCheque") int correlativo, @WebParam(name="Cuenta") long cuenta, @WebParam(name="monto") double monto, @WebParam(name="emisor") String emisor){
        if(con!=null){
            try {
                this.query="insert into reg_operacion (fecha, monto, emisor, CUIEmpleado, idAgencia, idOperacion, noCuenta, correlativo)"
                        + "value('"+this.clave.fechaHoraActual()+"', "+monto+", '"+emisor+"', "+CUIOp+", "+agencia+", 12, "+cuenta+", "+correlativo+");";
                st.executeQuery(query);
                this.query="insert into movimiento_cuenta (haber, saldo, fecha, noCuenta) values "
                        + "("+monto+","+saldo+" ,'"+this.clave.fechaHoraActual()+"', "+cuenta+");";
                st.executeQuery(query);
                this.query = "update cuenta set saldo="+saldo+" where noCuenta="+cuenta;
                st.executeQuery(query);
                this.query = "update cheque set idEstadoCheque=2 where noCuenta="+cuenta+" and correlativo="+correlativo;
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    
    @WebMethod(operationName = "depositarCheque")
    public boolean depositarCheque(@WebParam(name="noCuenta") long cuenta, @WebParam(name="monto") double monto, @WebParam(name="saldo") double saldo,
        @WebParam(name="CUIOperador")long CUIOp, @WebParam(name="agencia") int agencia){
        if(con!=null){
            try {
                this.query="update cuenta set saldo="+saldo+" where noCuenta ="+cuenta;
                st.executeQuery(query);
                this.query=" insert into movimiento_cuenta (debe, saldo, fecha, noCuenta) values ("+monto+", "+saldo+", '"+this.clave.fechaHoraActual()+"', "+cuenta+");";
                st.executeQuery(query);
                this.query="insert into reg_operacion (fecha, monto, CUIEmpleado, idAgencia, idOperacion, noCuenta)"
                        + "value('"+this.clave.fechaHoraActual()+"', "+monto+", "+CUIOp+", "+agencia+", 12, "+cuenta+");";
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    
    @WebMethod(operationName = "depositarEfectivo")
    public boolean depositarEfectivo(@WebParam(name="noCuenta") long cuenta, @WebParam(name="monto") double monto, @WebParam(name="saldo") double saldo,
        @WebParam(name="CUIOperador")long CUIOp, @WebParam(name="agencia") int agencia){
        if(con!=null){
            try {
                this.query="update cuenta set saldo="+saldo+" where noCuenta ="+cuenta;
                st.executeQuery(query);
                this.query=" insert into movimiento_cuenta (debe, saldo, fecha, noCuenta) values ("+monto+", "+saldo+", '"+this.clave.fechaHoraActual()+"', "+cuenta+");";
                st.executeQuery(query);
                this.query="insert into reg_operacion (fecha, monto, CUIEmpleado, idAgencia, idOperacion, noCuenta)"
                        + "value('"+this.clave.fechaHoraActual()+"', "+monto+", "+CUIOp+", "+agencia+", 1, "+cuenta+");";
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    
    @WebMethod(operationName = "cobrarMulta")
    public boolean cobrarMulta(@WebParam(name="cuenta") long cuenta, @WebParam(name="saldo") double saldo, @WebParam(name="correlativo") int correlativo, @WebParam(name="monto") double monto, 
            @WebParam(name="cuiOperador") long CUIOp, @WebParam(name="idAgencia") int agencia){
        if(con!=null){
            try {
                this.query="update cuenta set saldo="+saldo+" where noCuenta="+cuenta;
                st.executeQuery(query);
                this.query="insert into movimiento_cuenta (debe, haber, saldo, fecha, noCuenta) values "
                        + "(null ,"+50+", "+saldo+",'"+this.clave.fechaHoraActual()+"', "+cuenta+");";
                st.executeQuery(query);
                this.query = "update cheque set idEstadoCheque=3 where noCuenta="+cuenta+" and correlativo="+correlativo;
                st.executeQuery(query);
                this.query="insert into reg_operacion (fecha, monto, CUIEmpleado, idAgencia, idOperacion, noCuenta, correlativo)"
                        + "value('"+this.clave.fechaHoraActual()+"', "+monto+", "+CUIOp+", "+agencia+", 11, "+cuenta+", "+correlativo+");";
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    @WebMethod(operationName = "cambiarCheque")
    public boolean cambiarCheque(@WebParam(name="saldo") double saldo, @WebParam(name="agencia") int agencia,@WebParam(name="operador") long CUIOp,@WebParam(name="idCheque") int correlativo, @WebParam(name="Cuenta") long cuenta, @WebParam(name="monto") double monto, @WebParam(name="emisor") String emisor){
        if(con!=null){
            try {
                this.query="insert into reg_operacion (fecha, monto, emisor, CUIEmpleado, idAgencia, idOperacion, noCuenta, correlativo)"
                        + "value('"+this.clave.fechaHoraActual()+"', "+monto+", '"+emisor+"', "+CUIOp+", "+agencia+", 10, "+cuenta+", "+correlativo+");";
                st.executeQuery(query);
                this.query="insert into movimiento_cuenta (haber, saldo, fecha, noCuenta) values "
                        + "("+monto+","+saldo+" ,'"+this.clave.fechaHoraActual()+"', "+cuenta+");";
                st.executeQuery(query);
                this.query = "update cuenta set saldo="+saldo+" where noCuenta="+cuenta;
                st.executeQuery(query);
                this.query = "update cheque set idEstadoCheque=2 where noCuenta="+cuenta+" and correlativo="+correlativo;
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    
    /*@WebMethod(operationName = "registrarOperacion")
    public boolean registrarOperacion(){
        
    }*/
    
    //**GERENTE GENERAL
    @WebMethod(operationName = "perteneceAgencia")
    public int verificarPertenencia(@WebParam(name="Superior") long CUIS){
        if(con!=null){
            try {
                int agenciaSuperior = 0;
                this.query="select idAgencia from empleado where CUIEmpleado="+CUIS;
                rs = st.executeQuery(query);
                while(rs.next()){
                    agenciaSuperior = rs.getInt(1);
                }
                return agenciaSuperior;
            } catch (Exception e) {
                return 0;
            }
        }else{
            return 0;
        }
    }
    
    @WebMethod(operationName = "crearAgencia")
    public boolean crearAgencia(@WebParam(name="idAgencia") int id, @WebParam(name="nombreAgencia") String nombre, @WebParam(name="direccion") String dir){
        if(con!=null){
            try {
                this.query="insert into agencia values("+id+", '"+nombre+"', '"+dir+"');";
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    
    @WebMethod(operationName = "crearGerente")
    public String crearGerente(@WebParam(name="CUIEmpleado") long cui, @WebParam(name = "nombre") String nombre, @WebParam(name="direccion") String dir,
            @WebParam(name="usuario") String usuario, @WebParam(name="rolEmpleado") int rol, @WebParam(name="idAgencia") int agencia){        
        if(con!= null){
            try {
                String clave = this.clave.claveAleatoria();
                this.query= "insert into empleado values("+cui+", '"+nombre+"', '"+dir+"', '"+usuario+"','"+clave+"', null, "+rol+", "+agencia+");";
                st.executeQuery(query);
                return clave;
            } catch (Exception e) {
                return null;
            }
        }else{
            return null;
        }        
    }
    
    @WebMethod(operationName = "crearEmpleado")
    public String crearEmpleado(@WebParam(name="CUIEmpleado") long cui, @WebParam(name = "nombre") String nombre, @WebParam(name="direccion") String dir,
            @WebParam(name="usuario") String usuario, @WebParam(name="superior") long CUISuperior, 
            @WebParam(name="rolEmpleado") int rol, @WebParam(name="idAgencia") int agencia){        
        if(con!= null){
            try {
                String clave = this.clave.claveAleatoria();
                this.query= "insert into empleado values("+cui+", '"+nombre+"', '"+dir+"', '"+usuario+"','"+clave+"', "+CUISuperior+", "+rol+", "+agencia+");";
                st.executeQuery(query);
                return clave;
            } catch (Exception e) {
                return null;
            }
        }else{
            return null;
        }        
    }
    
    //**ESTADO DE CUENTA
    @WebMethod(operationName = "getEstadoCuenta")
    public ArrayList<estadoCuenta> getEstadoCuenta(@WebParam(name="fechaInicial") String fi, @WebParam(name="fechaFinal") String ff, @WebParam(name="cuenta") long cuenta){
        ArrayList<estadoCuenta> lEstadoCta = new ArrayList<>();
        lEstadoCta.clear();
        if(con!=null){
            try {
                this.query="select debe, haber, saldo, fecha from movimiento_cuenta where fecha between '"+fi+"' and '"+ff+"' and noCuenta = "+cuenta;
                rs = st.executeQuery(query);
                while(rs.next()){
                    if(rs.getString(1) != null){
                        estadoCuenta ec =new estadoCuenta(rs.getString(1), "  ", rs.getString(3), rs.getString(4));
                        lEstadoCta.add(ec);
                    }else if(rs.getString(2) != null){
                        estadoCuenta ec =new estadoCuenta("  ", rs.getString(2), rs.getString(3), rs.getString(4));
                        lEstadoCta.add(ec);
                    }             
                }
                return lEstadoCta;
            } catch (Exception e) {
                return lEstadoCta;
            }
        }else{
            return lEstadoCta;
        }
    }
    
    //***CLAVE
    @WebMethod(operationName = "cambiarClave")
    public boolean cambiarClave(@WebParam(name = "tipoUsuario") String tipoUsuario, @WebParam(name = "usuario") String usuario, @WebParam(name = "clave") String clave, @WebParam(name = "claveAntigua") String clave2) {
        if (con != null) {
            try {
                this.query = "update " + tipoUsuario + " set clave='" + clave + "', usuario='" + usuario + "' where clave='" + clave2 + "'";
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            return false;
        }
    }

    @WebMethod(operationName="recuperarClave")
    public String recuperarClave(@WebParam(name="tipo") String donde, @WebParam(name="com") String com,@WebParam(name="Usuario") String usuario, @WebParam(name="CUI") long CUI){
        if(con!=null){
            try {
                this.query="select clave from "+donde+" where usuario='"+usuario+"' and CUI"+com+"="+CUI+";";
                rs = st.executeQuery(query);
                String claveR = "";
                while(rs.next()){
                    claveR = rs.getString(1);
                }
                return claveR;
            } catch (Exception e) {
                return null;
            }
        }else{
            return null;
        }
    }
    //**PRESTAMOS
    @WebMethod(operationName = "Prestamo")
    public boolean Prestamo(@WebParam(name = "monto") double monto, @WebParam(name = "pago") int pago, @WebParam(name = "estaod") int estado, @WebParam(name = "cuenta") long cuenta) {
        if (con != null) {
            try {
                this.query = "insert into prestamo(monto, idPagoPrestamo, idEstadoPrestamo, noCuenta) values(" + monto + ", " + pago + ", " + estado + ", " + cuenta + ");";
                st.executeQuery(query);
                return true;
            } catch (Exception e) {
                return false;
            }
        } else {
            return false;
        }
    }

    //**CREAR CLIENTES Y LOS ENCARGADOS DE LOS CLIENTES EMPRESARIALES
    @WebMethod(operationName = "crearClienteParticular")
    public String crearClienteP(@WebParam(name = "DPI") long DPI, @WebParam(name = "nombre") String nombre,
            @WebParam(name = "fechaNac") String fechaNac, @WebParam(name = "direccion") String direccion,
            @WebParam(name = "usuario") String usuario, @WebParam(name = "idTipoCliente") int idTipo) {
        if (con != null) {
            String clave = this.clave.claveAleatoria();
            this.query = "insert into cliente(CUICliente, nombre, fechaNac, direccion, usuario, clave, idTipoCliente) "
                    + "values(" + DPI + " , '" + nombre + "', '" + fechaNac + "', '" + direccion + "', '" + usuario + "', '" + clave + "'," + idTipo + ");";
            try {
                st.executeQuery(query);
                return clave;
            } catch (Exception ex) {
                return "No se realizo el registro";
            }
        } else {
            return "No se realizo el registro";
        }
    }

    @WebMethod(operationName = "crearEncargado")
    public boolean crearEncargado(@WebParam(name = "identificador") int id, @WebParam(name = "nombre") String nombre,
            @WebParam(name = "idEmpresa") long idEmpresa) {
        if (con != null) {
            this.query = "insert into encargado values (" + id + ",'" + nombre + "'," + idEmpresa + ");";
            try {
                st.executeQuery(query);
                return true;
            } catch (Exception ex) {
                return false;
            }
        } else {
            return false;
        }
    }

    @WebMethod(operationName = "crearClienteEmpresa")
    public String crearClienteE(@WebParam(name = "DPI") long DPI, @WebParam(name = "nombre") String nombre,
            @WebParam(name = "direccion") String direccion,
            @WebParam(name = "usuario") String usuario, @WebParam(name = "idTipoCliente") int idTipo,
            @WebParam(name = "IDE1") int idE1,
            @WebParam(name = "nombreE1") String nE1,
            @WebParam(name = "IDE2") int idE2,
            @WebParam(name = "nombreE2") String nE2,
            @WebParam(name = "IDE3") int idE3,
            @WebParam(name = "nombreE3") String nE3) {
        if (con != null) {
            String clave = this.clave.claveAleatoria();
            this.query = "insert into cliente(CUICliente, nombre, direccion, usuario, clave, idTipoCliente) "
                    + "values(" + DPI + " , '" + nombre + "', '" + direccion + "', '" + usuario + "', '" + clave + "'," + idTipo + ");";
            try {
                st.executeQuery(query);
                crearEncargado(idE1, nE1, DPI);
                crearEncargado(idE2, nE2, DPI);
                crearEncargado(idE3, nE3, DPI);
                return clave;
            } catch (Exception ex) {
                return "No se registro por:    " + ex;
            }
        } else {
            return "No se registro";
        }
    }

    //*** DEVOLVER NOMBRE Y REGISTRO SEGUN USUARIO Y CLAVE
    @WebMethod(operationName = "nombreUsuario")
    public String[] nombreUsuario(@WebParam(name = "usuario") String usuario, @WebParam(name = "clave") String clave) {
        if (con != null) {
            try {
                this.query = "select CUICliente, nombre from cliente where usuario='" + usuario + "' and clave ='" + clave + "'";
                rs = st.executeQuery(query);
                String[] datos = new String[2];
                while (rs.next()) {
                    datos[0] = Long.toString(rs.getLong(1));
                    datos[1] = rs.getString(2);
                }
                if (datos[0] != null) {
                    return datos;
                } else {
                    try {
                        this.query = "select CUIEmpleado, nombreEmpleado from empleado where usuario='" + usuario + "' and clave ='" + clave + "'";
                        rs = st.executeQuery(query);
                        String[] datos1 = new String[2];
                        while (rs.next()) {
                            datos1[0] = Long.toString(rs.getLong(1));
                            datos1[1] = rs.getString(2);
                        }
                        return datos1;
                    } catch (Exception e) {
                        System.out.println(e);
                        return null;
                    }
                }
            } catch (Exception e) {
                System.out.println(e);
                return null;
            }
        } else {
            return null;
        }
    }

    //***CREAR CUENTAS***
    @WebMethod(operationName = "crearCuenta")
    public String crearCuenta(@WebParam(name = "montoInicial") double montoInicial, @WebParam(name = "tipo") int idTipo,
            @WebParam(name = "Cliente") long DPI) {
        if (con != null) {
            try {
                long noCta = clave.numCuenta();
                this.query = "insert into cuenta values(" + noCta + ",'" + clave.fechaHoraActual() + "'," + montoInicial + "," + 1 + "," + idTipo + "," + DPI + ");";
                st.executeQuery(query);
                return Long.toString(noCta);
            } catch (Exception e) {
                return "no se registro";
            }
        } else {
            return "No se registro";
        }
    }
    
    @WebMethod(operationName = "solicitarChequera")
    public boolean solicitarChequera(@WebParam(name="cuenta") long cuenta, @WebParam(name="CUI") long CUI, @WebParam(name="talonario") int talonario){
        if(con!=null){
            try {
                int tipoCta = 0;
               this.query="select idTipoCta from cuenta where noCuenta="+cuenta+" and CUICliente="+CUI;
               rs = st.executeQuery(query);
               while(rs.next()){
                   tipoCta = rs.getInt(1);
               }
               if(tipoCta == 1){
                   this.query="insert into cheque(noTalonario, noCuenta, idEstadoCheque) values("+talonario+","+cuenta+", 1);";
                   for(int i=1; i<26; i++){
                       st.executeQuery(query);
                   }
                   return true;
               }else{
                   return false;
               }
            } catch (Exception e) {
                return false;
            }
        }else{
            return false;
        }
    }
    @WebMethod(operationName = "activarDesactivar")
    public boolean activarDescativar(@WebParam(name="noCta") long cta, @WebParam(name="DPI") long dpi, @WebParam(name="estaod") int estado){
        if(con!=null){
            try {
            this.query="update cuenta set idEstadoCta="+estado+" where noCuenta = "+cta+" and CUICliente ="+dpi;
            st.executeQuery(query);
            return true;
        } catch (Exception e) {
            return false;
        }
        }else{
            return false;
        }
    }
    //****LOGIN, OBTENER DE LOS TIPOS Y ROLES DE LOS USUARIOS****
    @WebMethod(operationName = "loginCliente")
    public boolean buscarCliente(@WebParam(name = "usuario") String usuario, @WebParam(name = "password") String pass, @WebParam(name = "idTipo") int idTipo) {
        if (con != null) {
            String clave = "";
            try {
                this.query = "select clave from cliente where usuario = '" + usuario + "' and idTipoCliente =" + idTipo;
                rs = st.executeQuery(query);
                while (rs.next()) {
                    clave = rs.getString(1);
                }
                if (clave.equals(pass)) {
                    return true;
                } else {
                    return false;
                }

            } catch (Exception ex) {
                System.out.println("Error:  " + ex);
                return false;
            }
        } else {
            return false;
        }
    }

    @WebMethod(operationName = "loginEmpleado")
    public boolean buscarEmpleado(@WebParam(name = "usuario") String usuario, @WebParam(name = "password") String pass, @WebParam(name = "idTipo") int idTipo) {
        if (con != null) {
            String clave = "";
            try {
                this.query = "select clave from empleado where usuario ='" + usuario + "' and idRol = " + idTipo + ";";
                rs = st.executeQuery(query);
                while (rs.next()) {
                    clave = rs.getString(1);
                }
                if (clave.equals(pass)) {
                    return true;
                } else {
                    return false;
                }

            } catch (Exception ex) {
                System.out.println("Error:  " + ex);
                return false;
            }
        } else {
            return false;
        }
    }

    @WebMethod(operationName="getIDAgencia")
    public int getIDAgencia(@WebParam(name="CUIEmpleado") long cui){
        if(con!=null){
            try {
                this.query="select idAgencia from empleado where CUIEmpleado="+cui;
                rs = st.executeQuery(query);
                int idAgencia =0;
                while(rs.next()){
                    idAgencia = rs.getInt(1);
                }
                return idAgencia;
            } catch (Exception e) {
                return 0;
            }
        }else{
            return 0;
        }
    }   
    
    @WebMethod(operationName = "getTipoCuenta")
    public ArrayList<tipoCuenta> getTipoCuenta() {
        ArrayList<tipoCuenta> listaTipoCta = new ArrayList<tipoCuenta>();
        listaTipoCta.clear();
        if (con != null) {
            try {
                this.query = "select * from tipo_cuenta";
                rs = st.executeQuery(query);
                while (rs.next()) {
                    tipoCuenta tcta = new tipoCuenta(rs.getInt(1), rs.getString(2), rs.getFloat(3));
                    listaTipoCta.add(tcta);
                }
                return listaTipoCta;
            } catch (Exception e) {
                return listaTipoCta;
            }
        } else {
            return listaTipoCta;
        }
    }

    @WebMethod(operationName = "getEstadoCtaAR")
    public ArrayList<estadosCuenta> getEstadosCuenta(){
        ArrayList<estadosCuenta> lest = new ArrayList<estadosCuenta>();
        if(con != null){
            try {
                lest.clear();
                this.query = "select * from estado_cuenta";
                rs = st.executeQuery(query);
                while(rs.next()){
                    estadosCuenta ec = new estadosCuenta(rs.getInt(1), rs.getString(2));
                    lest.add(ec);
                }
                return lest;
            } catch (Exception e) {
                return null;
            }
        }else{
            return null;
        }
        
    }
    
    @WebMethod(operationName = "getTipoEmpleado")
    public ArrayList<tipoEmpleado> getTipoEmpleado() {
        ArrayList<tipoEmpleado> lEmpleado = new ArrayList<tipoEmpleado>();
        lEmpleado.clear();
        if (con != null) {
            try {
                this.query = "select * from rol_empleado";
                rs = st.executeQuery(query);
                while (rs.next()) {
                    tipoEmpleado templ = new tipoEmpleado(rs.getInt(1), rs.getString(2), rs.getString(3));
                    lEmpleado.add(templ);
                }
                return lEmpleado;
            } catch (Exception e) {
                return lEmpleado;
            }
        } else {
            return lEmpleado;
        }
    }

    @WebMethod(operationName = "getTipoCliente")
    public ArrayList<tipoCliente> getTipoCliente() {
        ArrayList<tipoCliente> lCliente = new ArrayList<tipoCliente>();
        lCliente.clear();
        if (con != null) {
            try {
                this.query = "select * from tipo_cliente";
                rs = st.executeQuery(query);
                while (rs.next()) {
                    tipoCliente tcli = new tipoCliente(rs.getInt(1), rs.getString(2), rs.getString(3));
                    lCliente.add(tcli);
                }
                return lCliente;
            } catch (Exception e) {
                return lCliente;
            }
        } else {
            return lCliente;
        }
    }

    @WebMethod(operationName = "getTipoPago")
    public ArrayList<tipoPago> getTipoPago() {
        ArrayList<tipoPago> lPago = new ArrayList<tipoPago>();
        lPago.clear();
        if (con != null) {
            try {
                this.query = "select * from tipo_cliente";
                rs = st.executeQuery(query);
                while (rs.next()) {
                    tipoPago tPago = new tipoPago(rs.getInt(1), rs.getString(2));
                    lPago.add(tPago);
                }
                return lPago;
            } catch (Exception e) {
                return null;
            }
        } else {
            return null;
        }
    }
    
    @WebMethod(operationName = "getAgencia")
    public ArrayList<Agencia> getAgencia(){
        if(con!=null){
            try {
                ArrayList<Agencia> lAgencia = new ArrayList<Agencia>();
                this.query="select idAgencia, nombreAgencia from agencia";
                rs = st.executeQuery(query);
                while(rs.next()){
                    Agencia agencia = new Agencia(rs.getInt(1), rs.getString(2));
                    lAgencia.add(agencia);
                }
                return lAgencia;
            } catch (Exception e) {
                return null;
            }
        }else{
            return null;
        }
    }
    
    @WebMethod(operationName = "getEstadoCheque")
    public int estadoCheque(@WebParam(name="cuenta") long cuenta, @WebParam(name="correlativo") int correlativo){
        if(con!=null){
            try {
                this.query="select idEstadoCheque from cheque where noCuenta="+cuenta+" and correlativo="+correlativo;
                rs = st.executeQuery(query);
                int estado=0;
                while(rs.next()){
                    estado = rs.getInt(1);
                }
                return estado;
            } catch (Exception e) {
                return 0;
            }
        }else{
            return 0;
        }
    }
}
