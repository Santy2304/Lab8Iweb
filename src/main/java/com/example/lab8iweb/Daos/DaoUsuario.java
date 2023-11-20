package com.example.lab8iweb.Daos;

import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.DTOs.EstadisticasLeaderSheep;

import java.sql.*;
import java.util.ArrayList;
import java.util.Random;
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
        String sql = "INSERT INTO usuario ( nombre, edad, correo, contrasena_hash, nombreUsuario, estado, `listaNegra`, alimentoTotal, tiempoJugado, yaAlimento ) VALUES ( ?, ? , ? ,sha2(?,256), ?, 'Paz', false , 0, 0 , true )";

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

        sql = "UPDATE usuario SET tiempoJugado = tiempoJugado + ?  , yaAlimento = false  WHERE idUsuarios = ? ";
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
        //Falta distribucion de alimentos ;
        ArrayList<Pobladores> listaPobladoresTotal = new DaoPobladores().listarPobladoresPorUsuario(idUser);
        ArrayList<Pobladores> listaPobladores = new ArrayList<Pobladores>();
        //Seleccionamos solo a los pobladores que esten vivos
        for(Pobladores po : listaPobladoresTotal){
            if(po.getEstado().equals("Vivo")){
                listaPobladores.add(po);
            }
        }

        int idx = 0;
        int cantidadComidaTotal = new DaoUsuario().obtenerTotalAlimentos(idUser);
        int cantidadNecesariaDeAlimentacion = 0 ;
        bucleSupreme:
        while(true){
            //Elegimos aleatoriamente a que poblador vamos a alimentar
            if(listaPobladores.size()!=0){
            idx = new Random().nextInt(listaPobladores.size());
            cantidadNecesariaDeAlimentacion = listaPobladores.get(idx).getAlimentacionPorDia();
            if(((cantidadComidaTotal - cantidadNecesariaDeAlimentacion) > 0) ){
                //Se le alimenta a ese poblador restando esa cantidad del monto total que tenía el usuario
                cantidadComidaTotal = cantidadComidaTotal-cantidadNecesariaDeAlimentacion;
                //Se quita la poblador de la lista de alimentos
                listaPobladores.remove(idx);
            }else{
                //Ya no se alimenta a más pobladores
                break bucleSupreme;
            }
            }else{
                break bucleSupreme;
            }

        }
        //Debemos setear el valor de la comida ahora  :
        String query =  "UPDATE USUARIO SET ALIMENTOTOTAL = ? WHERE IDUSUARIOS= ? ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);) {
            pstmt.setInt(1, cantidadComidaTotal );
            pstmt.setInt(2, idUser);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        //Ahora que ya se repartio toda la comida pueden suceder dos cosas o se alimento a todos o faltan algunas personas
        //Eso lo podemos saber apartir del tamaño de la lista
        //Si alimento a todos no pasa nada con las morales del resto
        if(listaPobladores.size() !=0  ){
            //Con esto le bajamos la moral a todos los pobladores vivos que no hayan comido
            for(Pobladores pobla : listaPobladores){

                String sql3 = "UPDATE Pobladores SET moral = moral- AlimentacionXDia WHERE idPobladores = ? and estado = 'Vivo' ";
                try (Connection conn = this.getConnection();
                     PreparedStatement pstmt = conn.prepareStatement(sql3);) {
                    pstmt.setInt(1, pobla.getIdPobladores());
                    pstmt.executeUpdate();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
            }
            //Puede darse el caso de  que hayamos matado a alguien al bajarle tanto la moral q se volvio negativo o lo hicimos lleagr a cero
            String sql7 = "UPDATE pobladores SET moral = 0 , estado= 'Muerto' , motivoMuerte = 'Murio por HAMBREEE' WHERE moral <=0 and estado = 'Vivo' and idUsuarios = ? ";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql7);) {
                pstmt.setInt(1,idUser);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

        //Evaluamos crecimiento de la población :
        ArrayList<Pobladores> listaPobladoresVivos = new ArrayList<Pobladores>(); //Pobladores vivos después de haber alimentado
        for(Pobladores po : listaPobladoresTotal){
            if(!po.getEstado().equals("Vivo")){
                listaPobladoresVivos.add(po);
            }
        }
        //Se debe tener en cuenta que la población debe ser mayor a cuatro veces la cantidad de los días pasados,
        //de no ser así las personas entran en un estado de desesperación por la falta de gente,
        // perdiendo en el proceso el 50% de la moral redondeando p(ara arriba
        if(  ! ( listaPobladoresVivos.size() > 4*((new DaoUsuario().obtenerHorasDeJuegoPorIdUsuario(idUser))/24))){
            String sql10 = "UPDATE Pobladores SET moral = moral - CEIL( moral/2) WHERE idPobladores = ? and estado= 'Vivo'";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql10);) {
                pstmt.setInt(1, idUser);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            //Verificamos muertos
            String sql7 = "UPDATE pobladores SET moral = 0 , estado= 'Muerto' , motivoMuerte = 'Murio por HAMBREEE' WHERE moral <=0 and estado = 'Vivo' and idUsuarios = ?  ";
            try (Connection conn = this.getConnection();
                 PreparedStatement pstmt = conn.prepareStatement(sql7);) {
                pstmt.setInt(1,idUser);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


        ///
        String sql2 = "UPDATE usuario SET yaAlimento = true WHERE idUsuarios = ? ";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql2);) {
            pstmt.setInt(1, idUser);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public boolean alimentoALaPoblacion(int idUser){
        boolean validacion = false;

        String sql = "SELECT yaAlimento FROM Usuario WHERE idUsuarios=?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,idUser);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    validacion = rs.getBoolean(1);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return validacion;
    }

    //metodos para el liderboard

    public void diasJugadosTotal(int idUser) {
        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        int totalPobladores = 0;
        String sql = "SELECT ROUND(tiempoJugado/24) AS DiasJugados, idUsuarios\n" +
                "FROM usuario";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt(1));

            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<EstadisticasLeaderSheep> estadisticas(){
        ArrayList<EstadisticasLeaderSheep> listaUsuarios = new ArrayList<>();
        String sql = "SELECT\n" +
                "\tu.idUsuarios,\n" +
                "    u.nombreUsuario,\n" +
                "    ROUND(u.tiempoJugado / 24) AS DiasJugados,\n" +
                "    COALESCE(COUNT(p.idPobladores), 0) AS cantidad_pobladores,\n" +
                "    COALESCE(SUM(p.moral), 0) AS suma_morales,\n" +
                "    COALESCE(SUM(p.fuerza), 0) AS suma_fuerzas,\n" +
                "    COALESCE(MAX(p.tiempoVivo), 0) AS max_tiempoVivo,\n" +
                "    COALESCE(SUM(CASE WHEN p.tipoDeProduccion = 'Alimento' THEN p.cantidadDeProduccionXDia ELSE 0 END), 0) AS suma_alimento\n" +
                "FROM usuario u\n" +
                "LEFT JOIN pobladores p ON u.idUsuarios = p.idUsuarios AND p.estado = 'Vivo'\n" +
                "GROUP BY u.idUsuarios, u.nombreUsuario\n" +
                "ORDER BY cantidad_pobladores DESC\n" +
                "LIMIT 10;";

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                EstadisticasLeaderSheep estadisticas = new EstadisticasLeaderSheep();
                estadisticas.setIdUsuario(rs.getInt(1));
                estadisticas.setNameUsuario(rs.getString(2));
                estadisticas.setDiasJugados(rs.getInt(3));
                estadisticas.setCantidadTotalPobladores(rs.getInt(4));
                estadisticas.setCantidadTotalMoral(rs.getInt(5));
                estadisticas.setCantidadTotalFuerza(rs.getInt(6));
                //estadisticas.setCantidadGuerrasGanadas(rs.getInt(6));
                estadisticas.setMaxDiasPoblador(rs.getInt(7));
                estadisticas.setCantidadTotalProduccionAlimento(rs.getInt(8));
                listaUsuarios.add(estadisticas);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
    }

        return listaUsuarios;
    }




    public String obtenerNombrexId(int id){
        String nombre= null;
        String sql = "SELECT nombreUsuario FROM Usuario WHERE idUsuarios=?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1,id);

            try(ResultSet rs = pstmt.executeQuery()){
                while (rs.next()) {
                    nombre = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return nombre;
    }

    public ArrayList<EstadisticasLeaderSheep> ordenarInts(String orden) {
        ArrayList<EstadisticasLeaderSheep> listaUsuarios = new ArrayList<>();
        String sql = "SELECT\n" +
                "\tu.idUsuarios,\n" +
                "    u.nombreUsuario,\n" +
                "    ROUND(u.tiempoJugado / 24) AS DiasJugados,\n" +
                "    COALESCE(COUNT(p.idPobladores), 0) AS cantidad_pobladores,\n" +
                "    COALESCE(SUM(p.moral), 0) AS suma_morales,\n" +
                "    COALESCE(SUM(p.fuerza), 0) AS suma_fuerzas,\n" +
                "    COALESCE(MAX(p.tiempoVivo), 0) AS max_tiempoVivo,\n" +
                "    COALESCE(SUM(CASE WHEN p.tipoDeProduccion = 'Alimento' THEN p.cantidadDeProduccionXDia ELSE 0 END), 0) AS suma_alimento\n" +
                "FROM usuario u\n" +
                "LEFT JOIN pobladores p ON u.idUsuarios = p.idUsuarios AND p.estado = 'Vivo'\n" +
                "GROUP BY u.idUsuarios, u.nombreUsuario\n" +
                "ORDER BY "+ orden +" DESC\n" +
                "LIMIT 10";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                EstadisticasLeaderSheep estadisticas = new EstadisticasLeaderSheep();
                estadisticas.setIdUsuario(rs.getInt(1));
                estadisticas.setNameUsuario(rs.getString(2));
                estadisticas.setDiasJugados(rs.getInt(3));
                estadisticas.setCantidadTotalPobladores(rs.getInt(4));
                estadisticas.setCantidadTotalMoral(rs.getInt(5));
                estadisticas.setCantidadTotalFuerza(rs.getInt(6));
                estadisticas.setMaxDiasPoblador(rs.getInt(7));
                estadisticas.setCantidadTotalProduccionAlimento(rs.getInt(8));
                listaUsuarios.add(estadisticas);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaUsuarios;

    }
    public ArrayList<EstadisticasLeaderSheep> ordenarStrings(String orden){
        ArrayList<EstadisticasLeaderSheep> listaUsuarios = new ArrayList<>();
        String sql = "FROM (\n" +
                "    SELECT\n" +
                "\tu.idUsuarios,\n" +
                "    u.nombreUsuario,\n" +
                "    ROUND(u.tiempoJugado / 24) AS DiasJugados,\n" +
                "    COALESCE(COUNT(p.idPobladores), 0) AS cantidad_pobladores,\n" +
                "    COALESCE(SUM(p.moral), 0) AS suma_morales,\n" +
                "    COALESCE(SUM(p.fuerza), 0) AS suma_fuerzas,\n" +
                "    COALESCE(MAX(p.tiempoVivo), 0) AS max_tiempoVivo,\n" +
                "    COALESCE(SUM(CASE WHEN p.tipoDeProduccion = 'Alimento' THEN p.cantidadDeProduccionXDia ELSE 0 END), 0) AS suma_alimento\n" +
                "FROM usuario u\n" +
                "LEFT JOIN pobladores p ON u.idUsuarios = p.idUsuarios AND p.estado = 'Vivo'\n" +
                "GROUP BY u.idUsuarios, u.nombreUsuario\n" +
                "ORDER BY cantidad_pobladores DESC\n" +
                "LIMIT 10\n" +
                ") AS subconsulta\n" +
                "\n" +
                "ORDER BY "+orden+" ASC";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                EstadisticasLeaderSheep estadisticas = new EstadisticasLeaderSheep();
                estadisticas.setIdUsuario(rs.getInt(1));
                estadisticas.setNameUsuario(rs.getString(2));
                estadisticas.setDiasJugados(rs.getInt(3));
                estadisticas.setCantidadTotalPobladores(rs.getInt(4));
                estadisticas.setCantidadTotalMoral(rs.getInt(5));
                estadisticas.setCantidadTotalFuerza(rs.getInt(6));
                //estadisticas.setCantidadGuerrasGanadas(rs.getInt(6));
                estadisticas.setMaxDiasPoblador(rs.getInt(7));
                estadisticas.setCantidadTotalProduccionAlimento(rs.getInt(8));
                listaUsuarios.add(estadisticas);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return listaUsuarios;
    }

}
