package com.example.lab8iweb.DTOs;

public class EstadisticasLeaderSheep {
    private int idUsuario;
    private String nameUsuario;
    private int DiasJugados;
    private int cantidadTotalPobladores;
    private int cantidadTotalMoral;
    private int cantidadTotalFuerza;
    //private int cantidadGuerrasGanadas;
    //private int porcentajeVictorias;
    private int maxDiasPoblador;
    private int cantidadTotalProduccionAlimento;



    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNameUsuario() {
        return nameUsuario;
    }

    public void setNameUsuario(String nameUsuario) {
        this.nameUsuario = nameUsuario;
    }

    public int getCantidadTotalPobladores() {
        return cantidadTotalPobladores;
    }

    public void setCantidadTotalPobladores(int cantidadTotalPobladores) {
        this.cantidadTotalPobladores = cantidadTotalPobladores;
    }

    public int getCantidadTotalFuerza() {
        return cantidadTotalFuerza;
    }

    public void setCantidadTotalFuerza(int cantidadTotalFuerza) {
        this.cantidadTotalFuerza = cantidadTotalFuerza;
    }

    public int getDiasJugados() {
        return DiasJugados;
    }

    public void setDiasJugados(int diasJugados) {
        DiasJugados = diasJugados;
    }

    public int getCantidadTotalMoral() {
        return cantidadTotalMoral;
    }

    public void setCantidadTotalMoral(int cantidadTotalMoral) {
        this.cantidadTotalMoral = cantidadTotalMoral;
    }

    /*public int getCantidadGuerrasGanadas() {
        return cantidadGuerrasGanadas;
    }

    public void setCantidadGuerrasGanadas(int cantidadGuerrasGanadas) {
        this.cantidadGuerrasGanadas = cantidadGuerrasGanadas;
    }

    public int getPorcentajeVictorias() {
        return porcentajeVictorias;
    }

    public void setPorcentajeVictorias(int porcentajeVictorias) {
        this.porcentajeVictorias = porcentajeVictorias;
    }*/

    public int getMaxDiasPoblador() {
        return maxDiasPoblador;
    }

    public void setMaxDiasPoblador(int maxDiasPoblador) {
        this.maxDiasPoblador = maxDiasPoblador;
    }

    public int getCantidadTotalProduccionAlimento() {
        return cantidadTotalProduccionAlimento;
    }

    public void setCantidadTotalProduccionAlimento(int cantidadTotalProduccionAlimento) {
        this.cantidadTotalProduccionAlimento = cantidadTotalProduccionAlimento;
    }
}
