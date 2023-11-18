package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;

public class DaoPobladores extends DaoBase {

    public ArrayList<Pobladores> listarConstructores() {
        ArrayList<Pobladores> listaConstructores = new ArrayList<>();

        String sql = "SELECT * FROM pobladores WHERE profesion = 'Constructor'";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next() ) {
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




    public void crearPoblador(Pobladores poblador, int idUsuario){

        String tipoPoblador = poblador.getProfesion();
        String sql = "INSERT INTO pobladores ( idUsuarios,nombre, genero, tiempoVivo,estado, motivoMuerte, moral, fuerza, tipoDeProduccion, alimentacionXDia,cantidadDeProduccionXDia, profesion) \n" +
                "VALUES (?, ?, ?, 0, 'Vivo', 'Ninguna', \n" +
                "? , \n" +
                "?, \n" +
                "?, \n" +
                "? \n" +
                "?,\n" +
                "?)";
        try(Connection connection=this.getConnection();
            PreparedStatement pstmt= connection.prepareStatement(sql)){
            Random rand = new Random();

            pstmt.setInt(1,idUsuario);
            pstmt.setString(2,poblador.getNombre());
            pstmt.setString(3,poblador.getGenero());

            if (tipoPoblador.equals("Constructor")) {
                pstmt.setInt(4, rand.nextInt(31) + 10);
                pstmt.setInt(5, rand.nextInt(19) + 2);
                pstmt.setString(6,"Moral");

                pstmt.setInt(7, rand.nextInt(21) + 50);
                pstmt.setInt(8, rand.nextInt(11) + 10);
                pstmt.setString(9,tipoPoblador);
            }
            else if (tipoPoblador.equals("Granjero")){
                pstmt.setInt(4, rand.nextInt(21) + 10);
                pstmt.setInt(5, rand.nextInt(31) + 10);
                pstmt.setString(6,"Alimento");

                pstmt.setInt(7, rand.nextInt(21) + 50);
                pstmt.setInt(8, rand.nextInt(11) + 10);
                pstmt.setString(9,tipoPoblador);
            } else if (tipoPoblador.equals("Soldado")) {
                pstmt.setInt(4, rand.nextInt(21) + 10);
                pstmt.setInt(5, rand.nextInt(31) + 10);
                pstmt.setString(6,"Moral");

                pstmt.setInt(7, rand.nextInt(21) + 50);
                pstmt.setInt(8, rand.nextInt(11) + 10);
                pstmt.setString(9,tipoPoblador);
            } else if (tipoPoblador.equals("Ninguno")) {
                pstmt.setInt(4, rand.nextInt(21) + 10);
                pstmt.setInt(5, rand.nextInt(31) + 10);
                pstmt.setString(6," ");

                pstmt.setInt(7, rand.nextInt(21) + 50);
                pstmt.setInt(8, rand.nextInt(11) + 10);
                pstmt.setString(9,tipoPoblador);
            }
            pstmt.executeUpdate();
        }
        catch (SQLException e){
            throw new RuntimeException(e);
        }



    }


    public ArrayList<Pobladores> listarPobladoresPorUsuario(int idUsuario) {
        ArrayList<Pobladores> listarPobladores = new ArrayList<>();

        String sql = "SELECT * FROM pobladores WHERE idUsuarios = ? ";

        try(Connection conn=this.getConnection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idUsuario);
            try(ResultSet rs=pstmt.executeQuery()){
                while (rs.next()){
                    String nombreProfesion= rs.getString(13);
                    //Se guarda como clase constructor:
                    if(nombreProfesion.equals("Constructor")){
                        Constructore constructore = new Constructore();
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
                        listarPobladores.add(constructore);
                    }

                    if(nombreProfesion.equals("Granjero")){
                        Granjero granjero = new Granjero();
                        granjero.setIdPobladores(rs.getInt(1));
                        Usuario user = new Usuario();
                        user.setIdUsuario(rs.getInt(2));
                        granjero.setUsuario(user);
                        granjero.setNombre(rs.getString(3));
                        granjero.setGenero(rs.getString(4));
                        granjero.setTiempoVivo(rs.getInt(5));
                        granjero.setMotivoMuerte(rs.getString(6));
                        granjero.setEstado(rs.getString(7));
                        granjero.setMoral(rs.getInt(8));
                        granjero.setFuerza(rs.getInt(9));
                        granjero.setTipo_produccion(rs.getString(10));
                        granjero.setAlimentacionPorDia(rs.getInt(11));
                        granjero.setCantidadProduccionPorDia(rs.getInt(12));
                        granjero.setProfesion(rs.getString(13));
                        listarPobladores.add(granjero);
                    }

                    if(nombreProfesion.equals("Soldado")){
                        Soldado soldado = new Soldado();
                        soldado.setIdPobladores(rs.getInt(1));
                        Usuario user = new Usuario();
                        user.setIdUsuario(rs.getInt(2));
                        soldado.setUsuario(user);
                        soldado.setNombre(rs.getString(3));
                        soldado.setGenero(rs.getString(4));
                        soldado.setTiempoVivo(rs.getInt(5));
                        soldado.setMotivoMuerte(rs.getString(6));
                        soldado.setEstado(rs.getString(7));
                        soldado.setMoral(rs.getInt(8));
                        soldado.setFuerza(rs.getInt(9));
                        soldado.setTipo_produccion(rs.getString(10));
                        soldado.setAlimentacionPorDia(rs.getInt(11));
                        soldado.setCantidadProduccionPorDia(rs.getInt(12));
                        soldado.setProfesion(rs.getString(13));
                        listarPobladores.add(soldado);
                    }

                    if(nombreProfesion.equals("Ciudadano")){
                        Pobladores pobladores = new Pobladores();
                        pobladores.setIdPobladores(rs.getInt(1));
                        Usuario user = new Usuario();
                        user.setIdUsuario(rs.getInt(2));
                        pobladores.setUsuario(user);
                        pobladores.setNombre(rs.getString(3));
                        pobladores.setGenero(rs.getString(4));
                        pobladores.setTiempoVivo(rs.getInt(5));
                        pobladores.setMotivoMuerte(rs.getString(6));
                        pobladores.setEstado(rs.getString(7));
                        pobladores.setMoral(rs.getInt(8));
                        pobladores.setFuerza(rs.getInt(9));
                        pobladores.setTipo_produccion(rs.getString(10));
                        pobladores.setAlimentacionPorDia(rs.getInt(11));
                        pobladores.setCantidadProduccionPorDia(rs.getInt(12));
                        pobladores.setProfesion(rs.getString(13));
                        listarPobladores.add(pobladores);
                    }
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listarPobladores;
    }


    public void exiliarPorId(int  idPoblador){

        String sql = "UPDATE pobladores SET estado = 'Exiliado' WHERE (`idpobladores` = ? )";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, idPoblador);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        //Obtener idUsuario
        int idUsuario = new DaoPobladores().obtenerIdUsuarioPorIdPoblador(idPoblador);
        int moralPobladorExiliado = new DaoPobladores().obtenerMoralPorId(idPoblador);


        //Cuando exiliamos , se les baja la moral al resto de pobladores
        //FLOOR(RAND() * (20 - 10 + 1)) + 10
        // FLOOR(RAND() * ( (select moral from pobladores where idpobladores = ?) + 1))



        sql = "UPDATE pobladores SET moral = moral - FLOOR(RAND() * ( ? + 1))   WHERE idUsuarios = ? and estado = 'Vivo' ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, moralPobladorExiliado);
            pstmt.setInt(2, idUsuario);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        sql = "UPDATE pobladores SET moral = 0 , estado= 'Muerto' , motivoMuerte = 'Murio por baja moral' WHERE moral <=0 and estado = 'Vivo' ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public int obtenerIdUsuarioPorIdPoblador(int idPoblador){
        int id = 0 ;
        String  sql = "SELECT idUsuarios from pobladores where  idPobladores = ? ";
        try(Connection conn=this.getConnection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idPoblador);
            try(ResultSet rs=pstmt.executeQuery()){
                if (rs.next()){
                    id= rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return id;
    }
    
    public int obtenerMoralPorId(int idPoblador){
       int moral = 0;
        String  sql = "SELECT moral from pobladores where  idPobladores = ? ";
        try(Connection conn=this.getConnection(); PreparedStatement pstmt= conn.prepareStatement(sql)){
            pstmt.setInt(1,idPoblador);
            try(ResultSet rs=pstmt.executeQuery()){
                if (rs.next()){
                    moral = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return moral;  
    }








}