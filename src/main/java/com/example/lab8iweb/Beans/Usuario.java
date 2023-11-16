package com.example.lab8iweb.Beans;

public class Usuario {
    //ATRIBUTOS
    private Integer idUsuarios;
    private String nombre;
    private Integer edad;
    private String correo;
    private String contrasenaHash;
    private String nombreUsuario;
    private String estado;
    private String ListaNegra;

    //GETTERS AND SETTERS
    public Integer getIdUsuarios() {
        return idUsuarios;
    }
    public void setIdUsuarios(Integer idUsuarios) {
        this.idUsuarios = idUsuarios;
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
}
