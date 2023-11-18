
package com.example.lab8iweb.Beans;

public class Profesiones extends Pobladores {
    //ATRIBUTOS:
    private int idProfesiones;
    private String nombreProfesion;
    private int fuerza;
    private String tipoDeProduccion;
    private int cantidadDeProduccion;
    private Pobladores pobladores;

    //private int idPobladores;

    //GETTERS AND SETTERS:


    public int getIdProfesiones() {
        return idProfesiones;
    }

    public void setIdProfesiones(int idProfesiones) {
        this.idProfesiones = idProfesiones;
    }

    public String getNombreProfesion() {
        return nombreProfesion;
    }

    public void setNombreProfesion(String nombreProfesion) {
        this.nombreProfesion = nombreProfesion;
    }

    public int getFuerza() {
        return fuerza;
    }

    public void setFuerza(int fuerza) {
        this.fuerza = fuerza;
    }

    public String getTipoDeProduccion() {
        return tipoDeProduccion;
    }

    public void setTipoDeProduccion(String tipoDeProduccion) {
        this.tipoDeProduccion = tipoDeProduccion;
    }

    public int getCantidadDeProduccion() {
        return cantidadDeProduccion;
    }

    public void setCantidadDeProduccion(int cantidadDeProduccion) {
        this.cantidadDeProduccion = cantidadDeProduccion;
    }

    public Pobladores getPobladores() {
        return pobladores;
    }

    public void setPobladores(Pobladores pobladores) {
        this.pobladores = pobladores;
    }
}
