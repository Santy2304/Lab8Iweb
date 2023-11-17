package com.example.lab8iweb.Beans;

public class Usuario {
    //ATRIBUTOS
    private int idUsuario;
    private String nombre;
    private int edad;
    private String correo;
    private String contrasenaHash;
    private String nombreUsuario;
    private String estado ; //Cuando se crea un usuario por defecto este está en paz
    private Boolean listaNegra ;
    private int alimentoTotal;
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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
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

    public Boolean getListaNegra() {
        return listaNegra;
    }

    public void setListaNegra(Boolean listaNegra) {
        this.listaNegra = listaNegra;
    }

    public int getAlimentoTotal() {
        return alimentoTotal;
    }

    public void setAlimentoTotal(int alimentoTotal) {
        this.alimentoTotal = alimentoTotal;
    }

    public int getTiempoJugado() {
        return TiempoJugado;
    }

    public void setTiempoJugado(int tiempoJugado) {
        TiempoJugado = tiempoJugado;
    }
}
