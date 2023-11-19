package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoUsuario extends DaoBase{
    public Usuario validarUsuarioPasswordHashed(String usuario, String contrasena){
        Usuario user = new Usuario();
        //Como el nombre de Usuario es unico en la base de datos no ocurriran conflictos o solo se obtendra una fila
        String sql = "SELECT * FROM Usuario WHERE nombreUsuario = ? AND contrasena_hash = SHA2(?,256)";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, usuario);
            pstmt.setString(2, contrasena);

            try (ResultSet rs = pstmt.executeQuery();) {
                //Guardamos todos sus datos para poder iniciar la sesion , esto ocurre cuando se loguea correctamente
                if (rs.next()) {
                    int idUsuario = rs.getInt(1);
                    String nombre = rs.getString(2);
                    user.setIdUsuario(idUsuario);
                    user.setNombre(nombre);
                    user.setListaNegra(rs.getBoolean(8));
                    return user;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }

    public Boolean validarUsernameUnico(String username){
        Boolean validacion = true;
        String sql = "SELECT * FROM Usuario WHERE nombreUsuario = ? and listaNegra = 0 ";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, username);

            try (ResultSet rs = pstmt.executeQuery();) {
                //Guardamos todos sus datos para poder iniciar la sesion , esto ocurre cuando se loguea correctamente
                //Esta vacío
                if (rs.next()) {
                    validacion= false;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return validacion;
    }


    public Boolean estaListaNegra(String correo){
        Boolean validacion=  false;

        String sql = "SELECT * FROM Usuario WHERE correo = ? and listaNegra = 1 ";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, correo);

            try (ResultSet rs = pstmt.executeQuery();) {
                //Guardamos todos sus datos para poder iniciar la sesion , esto ocurre cuando se loguea correctamente
                //Esta vacío
                if (rs.next()) {
                    validacion= true;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return validacion;
    }


    public void ponerListaNegra(String correo,Integer edad){
        String sql = "INSERT INTO usuario ( nombre, edad, correo, contrasena_hash, nombreUsuario, estado, `listaNegra`, alimentoTotal, tiempoJugado) VALUES ( 'baneado', ? , ? , sha2('ola',256), null, 'baneado', true , '0', '0')";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1,edad);
            pstmt.setString(2, correo);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void registrarNuevoUsuario(Usuario usuario){
        String sql = "INSERT INTO usuario ( nombre, edad, correo, contrasena_hash, nombreUsuario, estado, `listaNegra`, alimentoTotal, tiempoJugado) VALUES ( ?, ? , ? ,sha2(?,256), ?, 'Paz', false , 0, 0)";

        try (Connection conn = super.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setString(1, usuario.getNombre());
            pstmt.setInt(2, usuario.getEdad());
            pstmt.setString(3, usuario.getCorreo());
            pstmt.setString(4, usuario.getContrasenaHash());
            pstmt.setString(5, usuario.getNombreUsuario());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }



    public int obtenerTotalAlimentos(int idUser){
        int totalAlimentos = 0;

        String sql = "SELECT alimentoTotal FROM Usuario WHERE idUsuarios=?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,idUser);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {

                    totalAlimentos = rs.getInt(1);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return totalAlimentos;
    }

    public int obtenerHorasDeJuegoPorIdUsuario(int idUsuario){
        int tiempoJugado = 0;

        String sql = "SELECT tiempoJugado FROM Usuario WHERE idUsuarios=?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,idUsuario);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {

                    tiempoJugado = rs.getInt(1);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return tiempoJugado;
    }

    public void pasarHorasHastaAcabarEldia (int idUsuario){
        int tiempoJugado=  new DaoUsuario().obtenerHorasDeJuegoPorIdUsuario(idUsuario);
        int tiempoFaltante = 24 - (tiempoJugado % 24);

        String sql = "UPDATE pobladores SET tiempoVivo = tiempoVivo + ? WHERE idUsuarios = ? and estado = 'Vivo' ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, tiempoFaltante);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        sql = "UPDATE usuario SET tiempoJugado = tiempoJugado + ? WHERE idUsuarios = ? ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, tiempoFaltante);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    public void terminarDia(int idUser){

    }



}
