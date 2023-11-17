package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoUsuario;
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
                case "form":
                    //puede equivocarse
                    String nombre= request.getParameter("nombre");
                    //Verificamos que el nombre no tenga numeros :
                    String errorNombre= null;
                    for(char caracter: nombre.toCharArray()){
                        try{
                            Integer num = Integer.parseInt(String.valueOf(caracter));
                            errorNombre = "error";
                        }catch(NumberFormatException e){

                        }
                    }



                    //La edad debe ser un numero
                    String edad= request.getParameter("edad");
                    String errorEdad= null;
                    try{
                        Integer num = Integer.parseInt(edad);
                    }catch(NumberFormatException e){
                        errorEdad = "error";
                    }//Si es menor de trece se lo guarda en la lista negra , eso se valida después


                    //Correo
                    String correo= request.getParameter("correo");
                    String errorCorreo = "error";
                    for(char caracter: correo.toCharArray()){
                        if((String.valueOf(caracter)).equals("@")){
                            errorCorreo= null; //En caso sí haya ingresado un correo;
                            break;
                        }
                    }
                    if(new DaoUsuario().estaListaNegra(correo)){
                        errorCorreo= "ListaNegra";
                    }


                    //El nombre del usuario no debe empezar con numeros y no debe repetirse con más nombres de usuario de la base de datos
                    String username= request.getParameter("username");
                    String errorUsername= null;
                    int counter= 1;
                    for(char caracter: username.toCharArray()){
                        if(counter==1){
                            //Validamos que su nombre de usuario no empeize con un numero;
                            try{
                                Integer num = Integer.parseInt(String.valueOf(caracter));
                                errorUsername = "error";
                            }catch(NumberFormatException e){

                            }
                        }
                        counter=  counter+1;

                    }
                    //El nombre de Usuario debe ser unico
                    if(!new DaoUsuario().validarUsernameUnico(username)){
                        errorUsername = "error";
                    }


                    //verificacion de la contraseña
                    //La contraseña debe tener por lo menos una mayúscula, un número y un carácter especial.
                    String contrasena= request.getParameter("contrasena");
                    String errorContrasena = "error";
                    if (new Usuario().validatePassword(contrasena)){
                        errorContrasena= null;
                    }


                    if(errorNombre == null && errorEdad== null && errorCorreo == null && errorUsername == null && errorContrasena == null){
                        //Se procede a registrarlo en la página
                        if(Integer.parseInt(request.getParameter("edad"))<13){//Si tienes menos de 13 años se va a la lista negra
                            request.setAttribute("errorRegistro" , "ListaNegra");
                            //Se guarda su correo en la base de datos con un parametro de ListaNegra
                            new DaoUsuario().ponerListaNegra(correo,Integer.parseInt(request.getParameter("edad")));
                            request.setAttribute("signUpForm" , "SignUpForm");
                            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
                            view.forward(request, response);
                        }else{
                        //Se registra normalmente
                            Usuario usuario = new Usuario();
                            usuario.setNombre(nombre);
                            usuario.setEdad (Integer.parseInt(edad));
                            usuario.setCorreo(correo);
                            usuario.setContrasenaHash(contrasena);
                            usuario.setNombreUsuario(username);
                            new DaoUsuario().registrarNuevoUsuario(usuario);
                            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
                            view.forward(request, response);
                        }

                    }else{
                        //Se lo devuelve al registro mostrandole el error que cometio
                        request.setAttribute("errorNombre" , errorNombre);
                        request.setAttribute("errorEdad" , errorEdad);
                        request.setAttribute("errorCorreo" , errorCorreo);
                        request.setAttribute("errorUsername" , errorUsername);
                        request.setAttribute("errorContrasena" , errorContrasena);
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

