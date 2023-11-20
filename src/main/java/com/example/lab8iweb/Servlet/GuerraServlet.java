package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.HistorialGuerras;
import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoHistorialGuerras;
import com.example.lab8iweb.Daos.DaoPobladores;
import com.example.lab8iweb.Daos.DaoUsuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "GuerraServlet", value = "/GuerraServlet")
public class GuerraServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");


        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia session
            //AQUI VA TODA LA LOGICA DEL SERVLET;
            int idUser = ((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario();
            ArrayList<HistorialGuerras> historial = new DaoHistorialGuerras().listarHistorialGuerras(idUser);
            request.setAttribute("historial", historial);
            request.setAttribute("fuerzaAtaqueTotal" , new DaoHistorialGuerras().calcularFuerzaAtaqueTotal(idUser));
            request.setAttribute("fuerzaDefensaTotal" , new DaoHistorialGuerras().calcularFuerzaDefensaTotal(idUser)  );
            request.setAttribute("tiempoJugado", new DaoUsuario().obtenerHorasDeJuegoPorIdUsuario(idUser));
            request.setAttribute("estado" , (new DaoUsuario().obtenerUsuarioxId(idUser)).getEstado());
            request.setAttribute("listaContrincantes", new DaoUsuario().obtenerListaUsuarios());
            request.getRequestDispatcher("Guerra/gestionGuerra.jsp").forward(request, response);

        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

