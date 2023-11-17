package com.example.lab8iweb.Beans;

public class HistorialGuerras {
    //ATRIBUTOS
    private int IdHistorialGuerras;
    private String Posicion;
    private int IdUsuario;
    private int  IdEnemigo;
    private int HoraInicio;
    private int HoraFin;
    private int IdGanador;
    private int IdPerdedor;

    //GETTERS AND SETTERS
    public int getIdHistorialGuerras() {
        return IdHistorialGuerras;
    }

    public void setIdHistorialGuerras(int idHistorialGuerras) {
        IdHistorialGuerras = idHistorialGuerras;
    }

    public String getPosicion() {
        return Posicion;
    }

    public void setPosicion(String posicion) {
        Posicion = posicion;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        IdUsuario = idUsuario;
    }

    public int getIdEnemigo() {
        return IdEnemigo;
    }

    public void setIdEnemigo(int idEnemigo) {
        IdEnemigo = idEnemigo;
    }

    public int getHoraInicio() {
        return HoraInicio;
    }

    public void setHoraInicio(int horaInicio) {
        HoraInicio = horaInicio;
    }

    public int getHoraFin() {
        return HoraFin;
    }

    public void setHoraFin(int horaFin) {
        HoraFin = horaFin;
    }

    public int getIdGanador() {
        return IdGanador;
    }

    public void setIdGanador(int idGanador) {
        IdGanador = idGanador;
    }

    public int getIdPerdedor() {
        return IdPerdedor;
    }

    public void setIdPerdedor(int idPerdedor) {
        IdPerdedor = idPerdedor;
    }
}
