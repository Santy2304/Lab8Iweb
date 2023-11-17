package com.example.lab8iweb.Beans;

public class Pobladores {
    //ATRIBUTOS;
    private int idPobladores;
    private String nombre;
    private String genero; //Un caracter
    private int tiempo; //Es el tiempo de vida de cada persona que transcurre de manera relativa  a las acciones que se tome

    //Usamos Beans como atributos de otros Bean por lo que no usamos los Id directamente;
    //private int IdUsuario;
    private Usuario usuario; //Usuario al que le pertenece el poblador
    //private int IdProfesiones;
    private Profesiones profesion;
    private String estado; //Puede estar vivo o muerto (exiliado)
    private String motivoMuerte; // Puede morir por hambre , depresión entre otras cosas

    //GETTERS AND SETTERS

    public int getIdPobladores() {
        return idPobladores;
    }

    public void setIdPobladores(int idPobladores) {
        this.idPobladores = idPobladores;
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

    public int getTiempo() {
        return tiempo;
    }

    public void setTiempo(int tiempo) {
        this.tiempo = tiempo;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Profesiones getProfesion() {
        return profesion;
    }

    public void setProfesion(Profesiones profesion) {
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
}
