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
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia sesión

            DaoUsuario usuarioDao = new DaoUsuario();

            // Obtén la lista de usuarios con la cantidad total de pobladores
            ArrayList<EstadisticasLeaderSheep> listaUsuarios = usuarioDao.pobladoresTotalPorUsuario();

            // Establece la lista de usuarios como un atributo de solicitud
            request.setAttribute("listaCantidadPobladoresPorUsuario", listaUsuarios);

            // Envía la solicitud al JSP
            request.getRequestDispatcher("Leaderboard/leaderBoard.jsp").forward(request, response);
        } else {
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

