package com.example.lab8iweb.Beans;

public class Profesiones extends Pobladores {
    //ATRIBUTOS:
    private int idProfesiones;
    private String nombreProfesion;
    private int moral;
    private int fuerza;
    private String tipoProduccion;
    private int alimentacionPorDia;
    private int cantidadProduccion;


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

    public int getMoral() {
        return moral;
    }

    public void setMoral(int moral) {
        this.moral = moral;
    }

    public int getFuerza() {
        return fuerza;
    }

    public void setFuerza(int fuerza) {
        this.fuerza = fuerza;
    }

    public String getTipoProduccion() {
        return tipoProduccion;
    }

    public void setTipoProduccion(String tipoProduccion) {
        this.tipoProduccion = tipoProduccion;
    }

    public int getAlimentacionPorDia() {
        return alimentacionPorDia;
    }

    public void setAlimentacionPorDia(int alimentacionPorDia) {
        this.alimentacionPorDia = alimentacionPorDia;
    }

    public int getCantidadProduccion() {
        return cantidadProduccion;
    }

    public void setCantidadProduccion(int cantidadProduccion) {
        this.cantidadProduccion = cantidadProduccion;
    }
}
