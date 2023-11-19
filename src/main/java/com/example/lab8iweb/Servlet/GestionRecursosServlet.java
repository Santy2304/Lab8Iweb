package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoPobladores;
import com.example.lab8iweb.Daos.DaoUsuario;
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
            Usuario user = (Usuario) request.getSession().getAttribute("usuario");
            DaoPobladores daoPobladores = new DaoPobladores();
            String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");
            switch (action){
                case "lista":
                    //saca del modelo
                    ArrayList<Pobladores> listaDepresivos = daoPobladores.listarMoralesBajas();
                    int totalAlimentos =  new DaoUsuario().obtenerTotalAlimentos(user.getIdUsuario());
                    int totalPorAlimentar = new DaoPobladores().calcularCuantoAlimentar(user.getIdUsuario());
                    int totalPobladores = new DaoPobladores().calcularTotalPobladoresDeUnaCivilizacion(user.getIdUsuario());

                    int produccionxDia = new DaoPobladores().calcularProduccionDiaria(user.getIdUsuario());
                    //boolean yaAlimento =  new DaoUsuario().alimentoALaPoblacion(user.getIdUsuario());
                    int tiempoJugado = new DaoUsuario().obtenerHorasDeJuegoPorIdUsuario(user.getIdUsuario());
                    //request.setAttribute("validacion", yaAlimento);
                    request.setAttribute("tiempoJugado", tiempoJugado);
                    request.setAttribute("totalPobladores", totalPobladores);
                    request.setAttribute("totalAlimentos",totalAlimentos);
                    request.setAttribute("totalPorAlimentar",totalPorAlimentar);
                    request.setAttribute("listaDepresivos",listaDepresivos);
                    request.setAttribute("produccionxDia",produccionxDia);
                    request.getRequestDispatcher("Recursos/gestionRecursos.jsp").forward(request, response);
                    break;
                case "pasar24":
                    new DaoUsuario().pasarHorasHastaAcabarEldia(user.getIdUsuario());
                    response.sendRedirect(request.getContextPath() + "/GestionRecursosServlet");
                    break;
                case "terminarDia":
                    new DaoUsuario().terminarDia(user.getIdUsuario()); //Alimentar Aldeanos
                    response.sendRedirect(request.getContextPath() + "/GestionRecursosServlet");
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

