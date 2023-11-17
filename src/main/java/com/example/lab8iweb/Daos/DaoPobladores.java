package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Profesiones;

import java.sql.*;
import java.util.ArrayList;

public class DaoPobladores extends DaoBase {

    public ArrayList<Pobladores> listarPobladores() {
        ArrayList<Pobladores> listaPobladores = new ArrayList<>();

        String sql = "select p.idpobladores, p.nombre,p.genero, prof.nombreProfesion, prof.alimentacionXDia, prof.moral, p.tiempo, prof.fuerza, prof.cantidadDeProduccion from pobladores p\n" +
                "inner join profesiones prof ON (prof.idProfesiones = p.idProfesiones)";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Pobladores poblador = new Pobladores();
                fetchPobladorData(poblador, rs);

                listaPobladores.add(poblador);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaPobladores;
    }
    public void crearPoblador(Pobladores poblador){
        String sql = "INSERT INTO jugador (nombre,edad,posicion,club,sn_idSeleccion) VALUES (?,?,?,?,?)";
        try(Connection connection=this.getConnection();
            PreparedStatement pstmt= connection.prepareStatement(sql)){

            //pstmt.setInt(1,jugador.getIdJugador());

            pstmt.executeUpdate();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


    private void fetchPobladorData(Pobladores poblador, ResultSet rs) throws SQLException {


        poblador.setIdPobladores(rs.getInt(1));
        poblador.setNombre(rs.getString(2));
        poblador.setGenero(rs.getString(3));

        Profesiones profesion = new Profesiones();
        profesion.setNombreProfesion(rs.getString(4));
        profesion.setAlimentacionPorDia(rs.getInt(5));
        profesion.setMoral(rs.getInt(6));
        profesion.setFuerza(rs.getInt(8));
        profesion.setCantidadProduccion(rs.getInt(9));

        poblador.setProfesion(profesion);

        poblador.setTiempo(rs.getInt(7));

    }

}
