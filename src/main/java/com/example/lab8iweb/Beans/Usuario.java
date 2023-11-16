package com.example.lab8iweb.Beans;

public class Usuario {
    //ATRIBUTOS
    private int idUsuario;
    private String nombre;
    private Integer edad;
    private String correo;
    private String contrasenaHash;
    private String nombreUsuario;
    private String estado ; //Cuando se crea un usuario por defecto este está en paz
    private String ListaNegra ;
    private Float AlimentoTotal;
    private int TiempoJugado;
    //GETTERS AND SETTERS

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasenaHash() {
        return contrasenaHash;
    }

    public void setContrasenaHash(String contrasenaHash) {
        this.contrasenaHash = contrasenaHash;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getListaNegra() {
        return ListaNegra;
    }

    public void setListaNegra(String listaNegra) {
        ListaNegra = listaNegra;
    }

    public Float getAlimentoTotal() {
        return AlimentoTotal;
    }

    public void setAlimentoTotal(Float alimentoTotal) {
        AlimentoTotal = alimentoTotal;
    }

    public int getTiempoJugado() {
        return TiempoJugado;
    }

    public void setTiempoJugado(int tiempoJugado) {
        TiempoJugado = tiempoJugado;
    }
}
