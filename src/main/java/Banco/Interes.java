/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Banco;

/**
 *
 * @author Reaper Borja
 */
public enum Interes {
    min("0.5%",0.5),
    med("1%",1),
    max("1.5%",1.5),
    mill("5%", 5);
    
    private final String p;
    private final double pC;
    
    Interes(String p, double pC){
    this.p = p;
    this.pC = pC;
    }
    
    public String getP(){
        return p;
    }
    
    public double getPC(){
        return pC;
    }
}
