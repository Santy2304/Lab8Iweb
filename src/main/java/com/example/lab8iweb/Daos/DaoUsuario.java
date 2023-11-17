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

        try (Connection conn = this.getConnection();
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
                    return user;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return null;
    }


}
