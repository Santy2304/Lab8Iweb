package com.example.lab8iweb.Servlet;

import com.example.lab8iweb.Beans.Constructore;
import com.example.lab8iweb.Beans.Pobladores;
import com.example.lab8iweb.Beans.Usuario;
import com.example.lab8iweb.Daos.DaoPobladores;
import com.example.lab8iweb.Daos.DaoUsuario;
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
                    response.sendRedirect(request.getContextPath() + "/GestionPersonasServlet");
                    break;
                case "crearJugador":
                    request.getRequestDispatcher("Personas/crearPersonas.jsp").forward(request, response);
                    //Recibimos parametros par
                    break;
                case "editar":

                    String idEditar = request.getParameter("id");
                    int id = Integer.parseInt(idEditar);
                    Pobladores poblador = pobladorDao.buscarPoblador(id);
                    request.setAttribute("poblador",poblador);

                    request.getRequestDispatcher("Personas/editarPersonas.jsp").forward(request, response);
                    //Se edita solo el nombre
                    break;

                default:
                    response.sendRedirect("GestionPersonasServlet");


            }
        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }

        }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "lista" : request.getParameter("action");

        DaoPobladores daoPobladores = new DaoPobladores();

        if((Usuario) request.getSession().getAttribute("usuario") != null) {
            int idUsuario = ((Usuario) request.getSession().getAttribute("usuario")).getIdUsuario();
            switch (action) {
                case "guardarPoblador":
                    Pobladores p = new Pobladores();
                    p.setNombre(request.getParameter("nombre"));
                    p.setGenero(request.getParameter("genero"));
                    p.setProfesion(request.getParameter("profesion"));


                    if ((p.getNombre()).length()<10){

                        if(p.getProfesion().equals("Ninguno")){
                            if(new DaoUsuario().alimentoALaPoblacion(idUsuario) && (((new DaoUsuario().obtenerHorasDeJuegoPorIdUsuario(idUsuario))%24)+2)<24) {
                                DaoPobladores pobladorD = new DaoPobladores();
                                pobladorD.crearPoblador(p, idUsuario);
                                response.sendRedirect(request.getContextPath() + "/GestionPersonasServlet?action=lista");
                            }else{
                                //No se debe crear el usuario porque sino nos sobrepasamos de la cantidad de hora para el día
                                response.sendRedirect(request.getContextPath() + "/GestionPersonasServlet?action=lista");
                            }

                        }else{
                            if(new DaoUsuario().alimentoALaPoblacion(idUsuario) && (((new DaoUsuario().obtenerHorasDeJuegoPorIdUsuario(idUsuario))%24)+8)<24) {
                                DaoPobladores pobladorD = new DaoPobladores();
                                pobladorD.crearPoblador(p, idUsuario);
                                response.sendRedirect(request.getContextPath() + "/GestionPersonasServlet?action=lista");
                            }else{
                                //No se debe crear el usuario porque sino nos sobrepasamos de la cantidad de horas para el día
                                response.sendRedirect(request.getContextPath() + "/GestionPersonasServlet?action=lista");
                            }

                        }


                        }else{

                        request.setAttribute("error","El nombre debe ser menor a 10 caractéres");
                        request.getRequestDispatcher("Personas/crearPersonas.jsp").forward(request,response);
                    }



                    break;

                case "actualizar":

                    Pobladores poblador = new Pobladores();
                    String nombre = request.getParameter("nombre");
                    String id = request.getParameter("id_pobladores");

                    poblador.setIdPobladores(Integer.parseInt(id));
                    poblador.setNombre(nombre);
                    DaoPobladores daoPobladores1 = new DaoPobladores();

                    if (nombre.length()<10){
                        daoPobladores.actualizarPoblador(poblador);
                        response.sendRedirect(request.getContextPath()+"/GestionPersonasServlet");
                    }else{

                        Pobladores poblador1 = daoPobladores1.buscarPoblador(Integer.parseInt(id));
                        request.setAttribute("poblador",poblador1);
                        request.setAttribute("error","El nombre debe ser menor a 10 caractéres");
                        request.getRequestDispatcher("Personas/editarPersonas.jsp").forward(request,response);

                    }


            }
        }else{
            RequestDispatcher view = request.getRequestDispatcher("Loging/Loging.jsp");
            view.forward(request, response);
        }

    }
}
