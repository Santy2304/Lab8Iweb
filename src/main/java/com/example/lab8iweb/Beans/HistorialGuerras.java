package com.example.lab8iweb.Beans;

public class HistorialGuerras {
    //ATRIBUTOS
    private int idHistorialGuerras;
    private String posicion;
    //private int idUsuario; Ahora usamos beans como atributos de otro beans
    private Usuario usuario;
    private int  idEnemigo;
    private int horaInicio;
    private int horaFin;
    private int idGanador;
    private int idPerdedor;

    //GETTERS AND SETTERS


    public int getIdHistorialGuerras() {
        return idHistorialGuerras;
    }

    public void setIdHistorialGuerras(int idHistorialGuerras) {
        this.idHistorialGuerras = idHistorialGuerras;
    }

    public String getPosicion() {
        return posicion;
    }

    public void setPosicion(String posicion) {
        this.posicion = posicion;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public int getIdEnemigo() {
        return idEnemigo;
    }

    public void setIdEnemigo(int idEnemigo) {
        this.idEnemigo = idEnemigo;
    }

    public int getHoraInicio() {
        return horaInicio;
    }

    public void setHoraInicio(int horaInicio) {
        this.horaInicio = horaInicio;
    }

    public int getHoraFin() {
        return horaFin;
    }

    public void setHoraFin(int horaFin) {
        this.horaFin = horaFin;
    }

    public int getIdGanador() {
        return idGanador;
    }

    public void setIdGanador(int idGanador) {
        this.idGanador = idGanador;
    }

    public int getIdPerdedor() {
        return idPerdedor;
    }

    public void setIdPerdedor(int idPerdedor) {
        this.idPerdedor = idPerdedor;
    }
}
