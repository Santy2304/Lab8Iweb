package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LeaderboardServlet", value = "/LeaderboardServlet")
public class LeaderboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia session
            request.getRequestDispatcher("Leaderboard/leaderBoard.jsp").forward(request, response);
            //AQUI VA TODA LA LOGICA DEL SERVLET;

        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

