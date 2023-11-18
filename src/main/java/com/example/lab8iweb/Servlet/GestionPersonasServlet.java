package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoPobladores;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "GestionPersonasServlet", value = "/GestionPersonasServlet")
public class GestionPersonasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia session
            //AQUI VA TODA LA LOGICA DEL SERVLET;

            int idUser= ((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario();
            ArrayList<Pobladores> listaPobladores = new DaoPobladores().getListaPobladores(idUser);

            request.getRequestDispatcher("Personas/listaPersonas.jsp").forward(request,response);

        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

