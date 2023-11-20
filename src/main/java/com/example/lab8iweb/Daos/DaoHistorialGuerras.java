package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.HistorialGuerras;
import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class DaoHistorialGuerras extends DaoBase {



    public ArrayList<HistorialGuerras> listarHistorialGuerras (int id){

        ArrayList<HistorialGuerras> listaHistorial = new ArrayList<>();

        String sql = "Select * from historialguerras where idUsuario=?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {

            pstmt.setInt(1,id);


            try(ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    HistorialGuerras guerras = new HistorialGuerras();
                    guerras.setIdHistorialGuerras(rs.getInt(1));
                    guerras.setPosicion(rs.getString(2));
                    Usuario user = new Usuario();
                    user.setIdUsuario(rs.getInt(3));
                    guerras.setIdEnemigo(rs.getInt(4));
                    guerras.setHoraInicio(rs.getInt(5));

                    guerras.setIdGanador(rs.getInt(6));


                    guerras.setIdPerdedor(rs.getInt(7));

                    guerras.setResultado(rs.getString(8));

                    DaoUsuario daoUsuario = new DaoUsuario();


                    guerras.setContrincante(daoUsuario.obtenerNombrexId(rs.getInt(4)));

                    listaHistorial.add(guerras);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaHistorial;

    }


    public int calcularFuerzaDefensaTotal(int id){

        int fuerzaTotal = 0;

        String sql = "SELECT SUM(fuerza) AS fuerza_total FROM pobladores WHERE (profesion = 'Soldado' or 'Constructor') and idUsuarios=? and estado='Vivo'";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {

                    fuerzaTotal = rs.getInt(1);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return fuerzaTotal;

    }


    public int calcularFuerzaAtaqueTotal(int id){

        int fuerzaTotal = 0;

        String sql = "SELECT SUM(fuerza) AS fuerza_total FROM pobladores WHERE (profesion = 'Soldado') and idUsuarios=? and estado='Vivo'";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {

                    fuerzaTotal = rs.getInt(1);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return fuerzaTotal;

    }



}
