package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoPobladores;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GestionRecursosServlet", value = "/GestionRecursosServlet")
public class GestionRecursosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia session

            DaoPobladores daoPobladores = new DaoPobladores();
            String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
            switch (action){
                case "lista":
                    //saca del modelo
                    ArrayList<Pobladores> listaDepresivos = daoPobladores.listarMoralesBajas();
                    request.setAttribute("listaDepresivos",listaDepresivos);

                    request.getRequestDispatcher("Recursos/gestionRecursos.jsp").forward(request, response);
                    break;
                case "pasar24":

                    break;
                case "terminarDia":

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

