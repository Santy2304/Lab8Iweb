package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoUsuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoggingServlet", value = "/LoggingServlet")
public class LoggingServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action") == null ? "loginform" : request.getParameter("action");
        HttpSession session = request.getSession();
        switch (action) {
            case "loginform": //Caso por default cuando no mandan el parametro action
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                if (usuario != null && usuario.getIdUsuario() > 0) {
                    response.sendRedirect(request.getContextPath() + "/MenuServlet");
                } else {
                    RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
                    view.forward(request, response);
                }
                break;
            case "logout":
                session.invalidate();
                response.sendRedirect(request.getContextPath());
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        if ( usuario == null || contrasena == null) {
            //no se puede dar porque el logging asegura que se deban llenar todos los campos
            request.setAttribute("error", "El usuario o password no pueden ser vacíos");
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }else{
            //Proceso de validacion de contraseña con usuario;
            Usuario user = new DaoUsuario().validarUsuarioPasswordHashed(usuario, contrasena);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", user);
                session.setMaxInactiveInterval(5 * 60);

                response.sendRedirect(request.getContextPath() + "/MenuServlet");
            } else {
                request.setAttribute("error", "El usuario o password no existen");
                RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
                view.forward(request, response);
            }
        }

    }
}

