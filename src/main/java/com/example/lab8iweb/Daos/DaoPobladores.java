package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.Constructore;
import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class DaoPobladores extends DaoBase {

    public ArrayList<Pobladores> listarConstructores() {
        ArrayList<Pobladores> listaConstructores = new ArrayList<>();

        String sql = "SELECT * FROM pobladores WHERE profesion = 'Constructore'";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Pobladores constructore = new Constructore();
                constructore.setIdPobladores(rs.getInt(1));

                Usuario user = new Usuario();
                user.setIdUsuario(rs.getInt(2));
                constructore.setUsuario(user);

                constructore.setNombre(rs.getString(3));
                constructore.setGenero(rs.getString(4));
                constructore.setTiempoVivo(rs.getInt(5));
                constructore.setMotivoMuerte(rs.getString(6));
                constructore.setEstado(rs.getString(7));
                constructore.setMoral(rs.getInt(8));
                constructore.setFuerza(rs.getInt(9));
                constructore.setTipo_produccion(rs.getString(10));
                constructore.setAlimentacionPorDia(rs.getInt(11));
                constructore.setCantidadProduccionPorDia(rs.getInt(12));
                constructore.setProfesion(rs.getString(13));

                listaConstructores.add(constructore);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaConstructores;
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
            Random rand = new Random();

            pstmt.setInt(1,idUsuario);
            pstmt.setString(2,constructore.getNombre());
            pstmt.setString(3,constructore.getGenero());
            pstmt.setInt(4,rand.nextInt(31) + 10 );
            pstmt.setInt(5,rand.nextInt(19) + 2);
            pstmt.setInt(6,rand.nextInt(21) + 50);
            pstmt.setInt(7,rand.nextInt(11) + 10);
            pstmt.executeUpdate();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }
    }


}