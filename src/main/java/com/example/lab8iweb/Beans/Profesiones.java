package com.example.lab8iweb.Beans;

public class Profesiones extends Pobladores {
    //ATRIBUTOS:
    private int idProfesiones;
    private String nombreProfesion;

    private String tipoProduccion;

    private int produccionFuerza;

    private int produccionAlimento;

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


    @Override
    public String getTipoProduccion() {
        return tipoProduccion;
    }

    @Override
    public void setTipoProduccion(String tipoProduccion) {
        this.tipoProduccion = tipoProduccion;
    }

    public int getProduccionFuerza() {
        return produccionFuerza;
    }

    public void setProduccionFuerza(int produccionFuerza) {
        this.produccionFuerza = produccionFuerza;
    }

    public int getProduccionAlimento() {
        return produccionAlimento;
    }

    public void setProduccionAlimento(int produccionAlimento) {
        this.produccionAlimento = produccionAlimento;
    }
}
