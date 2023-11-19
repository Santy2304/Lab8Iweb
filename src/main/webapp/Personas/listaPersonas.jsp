
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 17/11/2023
  Time: 00:45
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.lab8iweb.Beans.*" %>
<jsp:useBean id="listaConstructores" type="ArrayList<com.example.lab8iweb.Beans.Pobladores>" scope="request"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en" data-bs-theme="auto">
<head><script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title>Carousel Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }

        .b-example-divider {
            width: 100%;
            height: 3rem;
            background-color: rgba(0, 0, 0, .1);
            border: solid rgba(0, 0, 0, .15);
            border-width: 1px 0;
            box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
        }

        .b-example-vr {
            flex-shrink: 0;
            width: 1.5rem;
            height: 100vh;
        }

        .bi {
            vertical-align: -.125em;
            fill: currentColor;
        }

        .nav-scroller {
            position: relative;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .btn-bd-primary {
            --bd-violet-bg: #712cf9;
            --bd-violet-rgb: 112.520718, 44.062154, 249.437846;

            --bs-btn-font-weight: 600;
            --bs-btn-color: var(--bs-white);
            --bs-btn-bg: var(--bd-violet-bg);
            --bs-btn-border-color: var(--bd-violet-bg);
            --bs-btn-hover-color: var(--bs-white);
            --bs-btn-hover-bg: #6528e0;
            --bs-btn-hover-border-color: #6528e0;
            --bs-btn-focus-shadow-rgb: var(--bd-violet-rgb);
            --bs-btn-active-color: var(--bs-btn-hover-color);
            --bs-btn-active-bg: #5a23c8;
            --bs-btn-active-border-color: #5a23c8;
        }

        .bd-mode-toggle {
            z-index: 1500;
        }

        .bd-mode-toggle .dropdown-menu .active .bi {
            display: block !important;
        }
        footer {
            background-color: #322D31;
            color: white;
            font-family: 'Titillium Web', sans-serif;
            padding: 20px 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            text-align: center; /* Centrar el contenido horizontalmente */
        }


    </style>


    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
</head>
<body>
<header data-bs-theme="dark">

    <%String genero = null;%>
    <jsp:include page="../Includes/navbar.jsp"></jsp:include>

</header>
<%ArrayList<Pobladores> listaPobladores   = (ArrayList<Pobladores>) request.getAttribute("listaPobladores");  %>
<main>
    <div class='container mt-5'>

        <div class="pb-5 pt-4 px-3 titlecolor">
            <div class="col-lg-6">
                <h1 >Tus Pobladores</h1>
            </div>
            <div class="mt-4">
                <a style="display: block; width: 200px; margin: 0 auto; text-align: center; background-color: #007bff; color: #ffffff; padding: 10px; text-decoration: none; border-radius: 5px;" href="<%=request.getContextPath()%>/GestionPersonasServlet?action=crearJugador&idUsuario=<%=((Usuario) session.getAttribute("usuario")).getIdUsuario()%>">Crear a un Poblador</a>
            </div>
        </div>

        <!--Aquí empieza el listado de los personajes-->
        <h2 class="mb-3">Granjeros</h2>
        <div class="tabla mb-5">
            <table class="table table-dark table-transparent table-hover">
                <thead>
                <tr>
                    <th class="text-center">#ID</th>
                    <th class="text-center">Nombre</th>
                    <th class="text-center">Género</th>
                    <th class="text-center">Consumo/día</th>
                    <th class="text-center">Moral</th>
                    <th class="text-center">Fuerza</th>
                    <th class="text-center">Tiempo(H)</th>
                    <th class="text-center">Tipo de Producción</th>
                    <th class="text-center">Cantidad de Producción</th>
                    <th class="text-center">Editar</th>
                    <th class="text-center">Exiliar</th>
                </tr>
                </thead>
                <tbody class="table">
                    <%
                        for (Pobladores c : listaPobladores) {
                           if(c instanceof Granjero && c.getEstado().equals("Vivo")) {
                    %>
                    <%
                        switch(c.getGenero()){
                            case "M":
                                genero = "Masculino";
                                break;
                            case "F":
                                genero = "Femenino";
                                break;
                            case "O":
                                genero = "Otro";
                                break;
                    }

                    %>
                <tr>
                    <td class="text-center"><%= c.getIdPobladores()%></td>
                    <td class="text-center"><%= c.getNombre()%></td>
                    <td class="text-center"><%=  genero %></td>
                    <td class="text-center"><%= c.getAlimentacionPorDia()%></td>
                    <td class="text-center"><%= c.getMoral()%></td>
                    <td class="text-center">----</td>
                    <td class="text-center"><%= c.getTiempoVivo()%></td> <!-- Agregado el cierre de la celda -->
                    <td class="text-center">Alimento</td>
                    <td class="text-center"><%=c.getCantidadProduccionPorDia()%></td>
                    <td class="text-center">
                        <a href="<%=request.getContextPath()%>/GestionPersonasServlet?action=editar&id=<%=c.getIdPobladores()%>"
                           type="button" class="btn btn-primary">
                            <i class="bi bi-pencil-square"></i>
                        </a>
                    </td>
                    <td class="text-center">
                        <a onclick="return confirm('¿Estas seguro de borrar?');"
                           href="<%=request.getContextPath()%>/GestionPersonasServlet?action=exiliar&id=<%=c.getIdPobladores()%>"
                           type="button" class="btn btn-danger">
                            <i class="bi bi-trash"></i>
                        </a>
                    </td>
                </tr>
                <%
                    }
                    } // Cierre del ciclo for
                %>

                </tbody>

            </table>
        </div>


        <h2>Constructores</h2>
        <table  class="table table-dark table-transparent table-hover mt-3 mb-5">
            <thead>

            <th class="text-center">#ID</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Género</th>
            <th class="text-center">Consumo/día</th>
            <th class="text-center">Moral</th>
            <th class="text-center">Fuerza</th>
            <th class="text-center">Tiempo(H)</th>
            <th class="text-center">Tipo de Producción</th>
            <th class="text-center">Cantidad de Producción</th>
            <th class="text-center">Editar</th>
            <th class="text-center">Exiliar</th>

            </thead>
            <tbody class="table">
            <%
                for (Pobladores c : listaPobladores) {
                    if(c instanceof Constructore && c.getEstado().equals("Vivo")){
            %>

            <%
                switch(c.getGenero()){
                    case "M":
                        genero = "Masculino";
                        break;
                    case "F":
                        genero = "Femenino";
                        break;
                    case "O":
                        genero = "Otro";
                        break;
                }

            %>


            <tr>
                <td class="text-center"><%= c.getIdPobladores()%></td>
                <td class="text-center"><%= c.getNombre()%></td>
                <td class="text-center"><%= genero%></td>
                <td class="text-center"><%= c.getAlimentacionPorDia()%></td>
                <td class="text-center"><%= c.getMoral()%></td>
                <td class="text-center"><%= c.getFuerza()%></td>
                <td class="text-center"><%= c.getTiempoVivo()%></td> <!-- Agregado el cierre de la celda -->
                <td class="text-center">Moral</td>
                <td class="text-center"><%=c.getCantidadProduccionPorDia()%></td>
                <td class="text-center">
                    <a href="<%=request.getContextPath()%>/GestionPersonasServlet?action=editar&id=<%=c.getIdPobladores()%>"
                       type="button" class="btn btn-primary">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </td>
                <td class="text-center">
                    <a onclick="return confirm('¿Estas seguro de borrar?');"
                       href="<%=request.getContextPath()%>/GestionPersonasServlet?action=exiliar&id=<%=c.getIdPobladores()%>"
                       type="button" class="btn btn-danger">
                        <i class="bi bi-trash"></i>
                    </a>
                </td>
            </tr>
            <%
                    }
                } // Cierre del ciclo for
            %>
            </tbody>
        </table>

        <h2>Soldados</h2>
        <table  class="table table-dark table-transparent table-hover mt-3 mb-5">
            <thead>

            <th class="text-center">#ID</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Género</th>
            <th class="text-center">Consumo/día</th>
            <th class="text-center">Moral</th>
            <th class="text-center">Fuerza</th>
            <th class="text-center">Tiempo(H)</th>
            <th class="text-center">Tipo de Producción</th>
            <th class="text-center">Cantidad de Producción</th>
            <th class="text-center">Editar</th>
            <th class="text-center">Exiliar</th>


            </thead>
            <tbody class="table">


            <%
                for (Pobladores c : listaPobladores) {
                    if(c instanceof Soldado && c.getEstado().equals("Vivo")){
            %>


            <%
                switch(c.getGenero()){
                    case "M":
                        genero = "Masculino";
                        break;
                    case "F":
                        genero = "Femenino";
                        break;
                    case "O":
                        genero = "Otro";
                        break;
                }

            %>


            <tr>
                <td class="text-center"><%= c.getIdPobladores()%></td>
                <td class="text-center"><%= c.getNombre()%></td>
                <td class="text-center"><%= genero%></td>
                <td class="text-center"><%= c.getAlimentacionPorDia()%></td>
                <td class="text-center"><%= c.getMoral()%></td>
                <td class="text-center"><%= c.getFuerza()%></td>
                <td class="text-center"><%= c.getTiempoVivo()%></td> <!-- Agregado el cierre de la celda -->
                <td class="text-center">Moral</td>
                <td class="text-center"><%= (c.getCantidadProduccionPorDia())%></td>
                <td class="text-center">
                    <a href="<%=request.getContextPath()%>/GestionPersonasServlet?action=editar&id=<%=c.getIdPobladores()%>"
                       type="button" class="btn btn-primary">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </td>
                <td class="text-center">
                    <a onclick="return confirm('¿Estas seguro de borrar?');"
                       href="<%=request.getContextPath()%>/GestionPersonasServlet?action=exiliar&id=<%=c.getIdPobladores()%>"
                       type="button" class="btn btn-danger">
                        <i class="bi bi-trash"></i>
                    </a>
                </td>
            </tr>
            <%
                    }
                } // Cierre del ciclo for
            %>

            </tbody>
        </table>



        <h2>Ciudadanos Comúnes</h2>
        <table  class="table table-dark table-transparent table-hover mt-3 mb-5">
            <thead>

            <th class="text-center">#ID</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Género</th>
            <th class="text-center">Consumo/día</th>
            <th class="text-center">Moral</th>
            <th class="text-center">Fuerza</th>
            <th class="text-center">Tiempo(H)</th>
            <th class="text-center">Tipo de Producción</th>
            <th class="text-center">Cantidad de Producción</th>
            <th class="text-center">Editar</th>
            <th class="text-center">Exiliar</th>

            </thead>
            <tbody class="table">


            <%
                for (Pobladores c : listaPobladores) {
                    if(c.getProfesion().equals("Ninguno") && c.getEstado().equals("Vivo")){
            %>


            <%
                switch(c.getGenero()){
                    case "M":
                        genero = "Masculino";
                        break;
                    case "F":
                        genero = "Femenino";
                        break;
                    case "O":
                        genero = "Otro";
                        break;
                }

            %>


            <tr>
                <td class="text-center"><%= c.getIdPobladores()%></td>
                <td class="text-center"><%= c.getNombre()%></td>
                <td class="text-center"><%= genero%></td>
                <td class="text-center"><%= c.getAlimentacionPorDia()%></td>
                <td class="text-center"><%= c.getMoral()%></td>
                <td class="text-center"><%= c.getFuerza()%></td>
                <td class="text-center"><%= c.getTiempoVivo()%></td> <!-- Agregado el cierre de la celda -->
                <td class="text-center">----</td>
                <td class="text-center">----</td>
                <td class="text-center">
                    <a href="<%=request.getContextPath()%>/GestionPersonasServlet?action=editar&id=<%=c.getIdPobladores()%>"
                       type="button" class="btn btn-primary">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </td>
                <td class="text-center">
                    <a onclick="return confirm('¿Estas seguro de borrar?');"
                       href="<%=request.getContextPath()%>/GestionPersonasServlet?action=exiliar&id=<%=c.getIdPobladores()%>"
                       type="button" class="btn btn-danger">
                        <i class="bi bi-trash"></i>
                    </a>
                </td>
            </tr>
            <%
                    }
                } // Cierre del ciclo for
            %>

            </tbody>
        </table>


        <h2>Muertos</h2>
        <table  class="table table-dark table-transparent table-hover mt-3 mb-5">
            <thead>

            <th class="text-center">#ID</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Género</th>
            <th class="text-center">Profesión</th>

            </thead>
            <tbody class="table">


            <%
                for (Pobladores c : listaPobladores) {
                if ( c.getEstado().equals("Muerto")){
            %>


            <%
                switch(c.getGenero()){
                    case "M":
                        genero = "Masculino";
                        break;
                    case "F":
                        genero = "Femenino";
                        break;
                    case "O":
                        genero = "Otro";
                        break;
                }

            %>
            <tr>
                <td class="text-center"><%= c.getIdPobladores()%></td>
                <td class="text-center"><%= c.getNombre()%></td>
                <td class="text-center"><%= genero%></td>
                <td class="text-center"><%= c.getProfesion()%></td>
            </tr>
            <%
                    }
                } // Cierre del ciclo for
            %>

            </tbody>
        </table>

    </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
<jsp:include page="/Includes/footer.jsp"/>

<script>
    function cerrarSesion() {
        // Redirige a tu enlace deseado
        window.location.href = "<%=request.getContextPath()%>/LoggingServlet?action=logout";
    }
</script>
</html>
