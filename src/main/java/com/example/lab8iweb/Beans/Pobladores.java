package com.example.lab8iweb.Beans;

public class Pobladores{
    //ATRIBUTOS;
    private int idPobladores;
    private Usuario usuario;
    private String nombre;
    private String genero; //Un caracter
    private int tiempoVivo; //Es el tiempo de vida de cada persona que transcurre de manera relativa  a las acciones que se tome

    private String profesion;
    //Usamos Beans como atributos de otros Bean por lo que no usamos los Id directamente;
    //private int IdUsuario;
    //private int IdProfesiones;
    private String estado; //Puede estar vivo o muerto (exiliado)
    private String motivoMuerte; // Puede morir por hambre , depresión entre otras cosas

    private int moral;
    private int alimentacionPorDia;
    private int cantidadProduccionPorDia;
    //GETTERS AND SETTERS


    public int getIdPobladores() {
        return idPobladores;
    }

    public void setIdPobladores(int idPobladores) {
        this.idPobladores = idPobladores;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getTiempoVivo() {
        return tiempoVivo;
    }

    public void setTiempoVivo(int tiempoVivo) {
        this.tiempoVivo = tiempoVivo;
    }

    public String getProfesion() {
        return profesion;
    }

    public void setProfesion(String profesion) {
        this.profesion = profesion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMotivoMuerte() {
        return motivoMuerte;
    }

    public void setMotivoMuerte(String motivoMuerte) {
        this.motivoMuerte = motivoMuerte;
    }

    public int getMoral() {
        return moral;
    }

    public void setMoral(int moral) {
        this.moral = moral;
    }

    public int getAlimentacionPorDia() {
        return alimentacionPorDia;
    }

    public void setAlimentacionPorDia(int alimentacionPorDia) {
        this.alimentacionPorDia = alimentacionPorDia;
    }

    public int getCantidadProduccionPorDia() {
        return cantidadProduccionPorDia;
    }

    public void setCantidadProduccionPorDia(int cantidadProduccionPorDia) {
        this.cantidadProduccionPorDia = cantidadProduccionPorDia;
    }
}
