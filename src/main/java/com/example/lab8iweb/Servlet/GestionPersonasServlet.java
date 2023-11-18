package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Constructore;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoPobladores;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "GestionPersonasServlet", value = "/GestionPersonasServlet")
public class GestionPersonasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if((Usuario) request.getSession().getAttribute("usuario") != null) {
            DaoPobladores pobladorDao = new DaoPobladores();
            request.setAttribute("listaConstructores", pobladorDao.listarConstructores());
            //request.setAttribute("listaGranjeros",pobladorDao.listarConstructores());
            //request.setAttribute("listaSoldados",pobladorDao.listarConstructores());
            //request.setAttribute("listaCiudadanos",pobladorDao.listarConstructores());
            request.setAttribute("listaPobladores", new DaoPobladores().listarPobladoresPorUsuario(((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario()));
            request.getRequestDispatcher("Personas/listaPersonas.jsp").forward(request, response);
        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }

        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
