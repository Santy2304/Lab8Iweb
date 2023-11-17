package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SignUpServlet", value = "/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Ola Santiago yo me encargo de esto más tarde
        //toda la logica ya está planteada en el jsp
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        HttpSession session = request.getSession();

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Primero observamos si session esta activa
        String action = request.getParameter("action") == null ? "default" : request.getParameter("action");
        HttpSession  session = request.getSession();
        Usuario user = (Usuario) session.getAttribute("usuario");
        if( user == null) {
            switch (action) {
                case "default":

                    break;
                case "form": //puede equivocarse
                    String nombre= request.getParameter("nombre");
                    //Verificamos que el nombre no tenga numeros :
                    String errorNombre= null;
                    for(char caracter: nombre.toCharArray()){
                        try{
                            Integer num = Integer.parseInt(String.valueOf(caracter));
                        }catch(NumberFormatException e){
                            errorNombre = "error";
                        }
                    }

                    String edad= request.getParameter("edad");
                    String errorEdad= null;

                    String correo= request.getParameter("correo");
                    String errorCorreo = null;

                    String username= request.getParameter("username");
                    String errorUsername= null;

                    String contrasena= request.getParameter("contrasena");
                    String errorContrasena = null;

                    if(errorNombre == null && errorEdad== null && errorCorreo == null && errorUsername == null && errorContrasena == null){
                        //Se procede a registrarlo en la página

                    }else{
                        //Se lo devuelve al registro mostrandole el error que cometio
                        request.setAttribute("errorNombre" , errorNombre);
                        request.setAttribute("signUpForm" , "SignUpForm");
                        RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
                        view.forward(request, response);
                    }

                    break;
                case "logout":

                    session.invalidate();
                    response.sendRedirect(request.getContextPath());
                    break;
            }
        }else{
            response.sendRedirect(request.getContextPath() + "/MenuServlet");
        }





    }
}

