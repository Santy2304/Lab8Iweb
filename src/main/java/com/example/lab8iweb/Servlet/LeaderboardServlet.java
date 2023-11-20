package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.DTOs.EstadisticasLeaderSheep;
import com.example.lab8iweb.Daos.DaoUsuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "LeaderboardServlet", value = "/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orden = request.getParameter("orden") == null ? "lista" : request.getParameter("orden");
        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia sesión

            DaoUsuario usuarioDao = new DaoUsuario();

            switch (orden){
                case "lista":
                    ArrayList<EstadisticasLeaderSheep> listaUsuarios = usuarioDao.estadisticas();
                    request.setAttribute("estadisticas", listaUsuarios);
                    request.getRequestDispatcher("Leaderboard/leaderBoard.jsp").forward(request, response);

                    break;
                case "id":
                    ArrayList<EstadisticasLeaderSheep> ordenadoporId = usuarioDao.ordenarStrings("idUsuarios");
                    request.setAttribute("idOrden", ordenadoporId);
                    request.getRequestDispatcher("Leaderboard/xId.jsp").forward(request, response);
                    break;
                 case "name":
                    ArrayList<EstadisticasLeaderSheep> nameOrden = usuarioDao.ordenarStrings("nombreUsuario");
                    request.setAttribute("nameOrden", nameOrden);
                    request.getRequestDispatcher("Leaderboard/xNombre.jsp").forward(request, response);
                    break;

                case "diasJugador":
                    ArrayList<EstadisticasLeaderSheep> DiasJugadorOrden = usuarioDao.ordenarInts("DiasJugados");
                    request.setAttribute("diasJugadorOrden", DiasJugadorOrden);
                    request.getRequestDispatcher("Leaderboard/xDiasJugador.jsp").forward(request, response);
                    break;

                case "poblacion":
                    ArrayList<EstadisticasLeaderSheep> pobla = usuarioDao.estadisticas();
                    request.setAttribute("estadisticas", pobla);
                    request.getRequestDispatcher("Leaderboard/leaderBoard.jsp").forward(request, response);

                    break;
                case "moral":
                    ArrayList<EstadisticasLeaderSheep> moralOrden = usuarioDao.ordenarInts("suma_morales");
                    request.setAttribute("moralOrden", moralOrden);
                    request.getRequestDispatcher("Leaderboard/xMoral.jsp").forward(request, response);
                    break;

                case "fuerza":
                    ArrayList<EstadisticasLeaderSheep> fuerzaOrden = usuarioDao.ordenarInts("suma_fuerzas");
                    request.setAttribute("FuerzaOrden", fuerzaOrden);
                    request.getRequestDispatcher("Leaderboard/xFuerza.jsp").forward(request, response);
                    break;
                /*case "wars":
                    ArrayList<EstadisticasLeaderSheep> fuerzaOrden = usuarioDao.ordenarInts("suma_fuerzas");
                    request.setAttribute("FuerzaOrden", fuerzaOrden);
                    request.getRequestDispatcher("Leaderboard/xFuerza.jsp").forward(request, response);
                    break;
                case "victorias":
                    ArrayList<EstadisticasLeaderSheep> fuerzaOrden = usuarioDao.ordenarInts("suma_fuerzas");
                    request.setAttribute("FuerzaOrden", fuerzaOrden);
                    request.getRequestDispatcher("Leaderboard/xFuerza.jsp").forward(request, response);
                    break;*/
                case "maxDias":
                    ArrayList<EstadisticasLeaderSheep> maxDiasOrden = usuarioDao.ordenarInts("max_tiempoVivo");
                    request.setAttribute("maxDiasOrden", maxDiasOrden);
                    request.getRequestDispatcher("Leaderboard/xMaxDiasCiudadanos.jsp").forward(request, response);
                    break;
                case "cantAlimento":
                    ArrayList<EstadisticasLeaderSheep> alimentoOrden = usuarioDao.ordenarInts("suma_alimento");
                    request.setAttribute("cantalimentoOrden", alimentoOrden);
                    request.getRequestDispatcher("Leaderboard/xProduccionAlimento.jsp").forward(request, response);
                    break;
            }

        } else {
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

