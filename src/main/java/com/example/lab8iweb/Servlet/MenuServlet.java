package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "MenuServlet", value = "/MenuServlet")
public class MenuServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        if((Usuario) request.getSession().getAttribute("usuario") != null) { //Si se inicia session
            request.getRequestDispatcher("MenuPrincipal/MenuPrincipal.jsp").forward(request, response);
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

