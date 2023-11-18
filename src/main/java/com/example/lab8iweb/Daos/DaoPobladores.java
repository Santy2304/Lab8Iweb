package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.Constructore;
import com.example.lab8iweb.Beans.Pobladores;

import java.sql.*;
import java.util.ArrayList;

public class DaoPobladores extends DaoBase {

    public ArrayList<Constructore> listarConstructores() {
        ArrayList<Pobladores> listaPobladores = new ArrayList<>();

        String sql = "select p.nombre, p.genero, prof.nombreProfesion, p.alimentacionXDia, p.moral,p.tiempo, p.fuerza, p.cantidadDeProduccion from pobladores p\n" +
                "JOIN profesiones prof ON p.idProfesiones = prof.idProfesiones";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()
            ) {
                Pobladores poblador = new Pobladores();
                fetchPobladorData(poblador, rs);

                listaPobladores.add(poblador);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaPobladores;
    }
    public void crearConstructore(Constructore constructore, int idUsuario){

        String sql = "INSERT INTO pobladores ( idUsuarios,nombre, genero, tiempoVivo,estado, motivoMuerte, moral, fuerza, tipoDeProduccion, alimentacionXDia,cantidadDeProduccionXDia, profesion) \n" +
                "VALUES (?, ?, ?, 0, 'Vivo', 'Ninguna', \n" +
                "? , \n" +
                "?, \n" +
                "'Moral', \n" +
                "? \n" +
                "?,\n" +
                "'Constructore')";
        try(Connection connection=this.getConnection();
            PreparedStatement pstmt= connection.prepareStatement(sql)){

            pstmt.setInt(1,idUsuario);
            pstmt.setString(2,constructore.getNombre());
            pstmt.setString(3,constructore.getGenero());
            pstmt.setString(4, );


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
        .setAlimentacionPorDia(rs.getInt(5));
        profesion.setMoral(rs.getInt(6));
        profesion.setFuerza(rs.getInt(8));
        profesion.setCantidadProduccion(rs.getInt(9));

        poblador.setProfesion(profesion);

        poblador.setTiempo(rs.getInt(7));

    }

}