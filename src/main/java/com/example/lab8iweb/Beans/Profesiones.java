package com.example.lab8iweb.Beans;

public class Profesiones extends Pobladores{
    //ATRIBUTOS:
    private int IdProfesiones;
    private String nombreProfesion;
    private int moral ;
    private int fuerza;
    private String TipoProduccion;
    private int CantidadProduccion;

    //GETTERS AND SETTERS:
    public int getIdProfesiones() {
        return IdProfesiones;
    }

    public void setIdProfesiones(int idProfesiones) {
        IdProfesiones = idProfesiones;
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
        return TipoProduccion;
    }

    public void setTipoProduccion(String tipoProduccion) {
        TipoProduccion = tipoProduccion;
    }

    public int getCantidadProduccion() {
        return CantidadProduccion;
    }

    public void setCantidadProduccion(int cantidadProduccion) {
        CantidadProduccion = cantidadProduccion;
    }
}
