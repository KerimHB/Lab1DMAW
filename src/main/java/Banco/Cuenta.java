package Banco;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Reaper Borja
 */
public class Cuenta {

    private String nomb;
    private String cuenta;
    private double saldo;
    private Interes tipoInteres;
    private double tiem;

    public Cuenta(String nombre, String cu, double s, Interes tInteres, double t) {
        nomb = nombre;
        cuenta = cu;
        tipoInteres = tInteres;
        tiem = t;
        saldo = calcInteresS(s);
    }


    public void transaccion(String transaccionselecionada, double cant) {
        if (transaccionselecionada.equals("1")) {
            retiros(cant);
        }

        if (transaccionselecionada.equals("2")) {
            depositos(cant);
        }
    }


    public String obtenerNombre() {
        return nomb;
    }

    public void asignarNombre(String n) {
        nomb = n;
    }


    public String obtenerCuenta() {
        return cuenta;
    }

    public void asignarCuenta(String cu) {
        cuenta = cu;
    }

    public void EstadodeCuenta(String cu) {
        cuenta = cu;
    }


    public double obtenerSaldo() {
        return saldo;
    }

    public void asignarSaldo(double s) {
        saldo = s;
    }

    public double calcInteresS(double s) {
        return saldo + (s * this.tipoInteres.getPC() * this.tiem);
    }


    public Interes obtenerTipoDeInteres() {
        return tipoInteres;
    }

    public void asignarInteres(Interes tInteres) {
        tipoInteres = tInteres;
    }

    public Interes obtenerInteres() {
        return tipoInteres;
    }

    public void depositos(double cant) {
        saldo += cant;
    }

    public void retiros(double cant) {
        if (saldo >= cant) {
            saldo -= cant;
        }
    }

}
