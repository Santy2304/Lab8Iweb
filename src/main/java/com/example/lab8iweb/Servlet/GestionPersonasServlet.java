package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Constructore;
import com.example.lab8iweb.Beans.Pobladores;
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
            String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
            int idUsuario = ((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario();
            switch (action) {
                case "lista":
                    request.setAttribute("listaConstructores", pobladorDao.listarConstructores());
                    request.setAttribute("listaPobladores", new DaoPobladores().listarPobladoresPorUsuario(((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario()));
                    request.getRequestDispatcher("Personas/listaPersonas.jsp").forward(request, response);
                    break;
                case "exiliar":
                    int idPoblador = Integer.parseInt(request.getParameter("id"));
                    new DaoPobladores().exiliarPorId(idPoblador);
                    request.setAttribute("listaConstructores", pobladorDao.listarConstructores());
                    request.setAttribute("listaPobladores", new DaoPobladores().listarPobladoresPorUsuario(((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario()));
                    request.getRequestDispatcher("Personas/listaPersonas.jsp").forward(request, response);
                    break;
                case "crearJugador":
                    request.getRequestDispatcher(request.getContextPath()+"/Personas/crearPersonas.jsp").forward(request, response);
                    //Recibimos parametros par
                    break;
                case "editar":
                    request.getRequestDispatcher(request.getContextPath()+ "Personas/editarPersonas.jsp").forward(request, response);
                    //Se edita solo el nombre
                    break;
            }
        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }

        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
