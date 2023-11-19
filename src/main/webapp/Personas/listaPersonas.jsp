
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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Responsive HTML Table With Pure CSS - Web Design/UI Design</title>
    <link rel="stylesheet" href="Personas/style.css">

    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title>Carousel Template · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/carousel/">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css" rel="stylesheet">

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
        .text-outline {
            color: #fff; /* Color del texto */
            -webkit-text-stroke: 2px rgba(0, 0, 0, 0.8);
            text-stroke: 2px rgba(0, 0, 0, 0.8);
            /* Ajusta los valores según sea necesario */
        }

    </style>

</head>
<body>
<header data-bs-theme="dark">

    <%String genero = null;%>
    <jsp:include page="../Includes/navbar.jsp"></jsp:include>

</header>
<%ArrayList<Pobladores> listaPobladores   = (ArrayList<Pobladores>) request.getAttribute("listaPobladores");  %>

<div class='container mt-5'>

    <div class="pb-5 pt-4 px-3 titlecolor" style="text-align: center;">
        <div style="color: black; display: inline-block;">
            <h1 style="transform: skew(-10deg); font-weight: bold; color: #2c3e50; background-color: #ecf0f1; padding: 15px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">Tus Pobladores</h1>
        </div>
        <div class="mt-4">
            <a style="display: inline-block; width: 200px; text-align: center; background-color: rgba(26,21,21,0.85); color: #ffffff; padding: 10px; text-decoration: none; border-radius: 5px; vertical-align: middle;" href="<%=request.getContextPath()%>/GestionPersonasServlet?action=crearJugador&idUsuario=<%=((Usuario) session.getAttribute("usuario")).getIdUsuario()%>">Crear a un Poblador</a>
        </div>
    </div>
</div>
    <main class="table">
        <!--Aquí empieza el listado de los personajes-->
            <section class="table__header">
                <h2 style="margin-top: 20px; margin-bottom:20px">Granjeros</h2>
            </section>

            <section class="table__body">
                <table>
                    <thead>
                    <tr>
                        <th class="text-center"> ID </th>
                        <th class="text-center"> Nombre </th>
                        <th class="text-center"> Género </th>
                        <th class="text-center"> Consumo/día </th>
                        <th class="text-center"> Moral </th>
                        <th class="text-center"> Fuerza </th>
                        <th class="text-center"> Tiempo(H) </th>
                        <th class="text-center"> Tipo de Producción </th>
                        <th class="text-center"> Cantidad de Producción </th>
                        <th class="text-center"> Editar </th>
                        <th class="text-center"> Exiliar </th>

                    </tr>
                    </thead>
                    <tbody>
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
            </section>
        </main>

    <main class="table">
        <section class="table__header">
            <h2 style="margin-top: 20px; margin-bottom:20px">Constructores</h2>
        </section>
        <section class="table__body">
        <table>

            <thead>
            <tr>
                <th class="text-center"> ID </th>
                <th class="text-center"> Nombre </th>
                <th class="text-center"> Género </th>
                <th class="text-center"> Consumo/día </th>
                <th class="text-center"> Moral </th>
                <th class="text-center"> Fuerza </th>
                <th class="text-center"> Tiempo(H) </th>
                <th class="text-center"> Tipo de Producción </th>
                <th class="text-center"> Cantidad de Producción </th>
                <th class="text-center"> Editar </th>
                <th class="text-center"> Exiliar </th>

            </tr>
            </thead>
            <tbody>
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
        </section>
    </main>

    <main class="table">
        <section class="table__header">
        <h2 style="margin-top: 20px; margin-bottom:20px">Soldados</h2>
        </section>
        <section class="table__body">
        <table>
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
            <tbody>


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
        </section>
    </main>



<main class="table">
    <section class="table__header">
        <h2 style="margin-top: 20px; margin-bottom:20px">Ciudadanos Comúnes</h2>
    </section>
    <section class="table__body">
        <table>
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
            <tbody>


            <%
                for (Pobladores c : listaPobladores) {
                    if(!(c instanceof Soldado) && !(c instanceof Granjero) && !(c instanceof Constructore)){
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
                <td class="text-center">----</td>
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
    </section>
</main>

<main class="table">
    <section class="table__header">
        <h2 style="margin-top: 20px; margin-bottom:20px">Muertos</h2>
    </section>
    <section class="table__body">
        <table>
            <thead>
            <tr>
            <th class="text-center">#ID</th>
            <th class="text-center">Nombre</th>
            <th class="text-center">Género</th>
            <th class="text-center">Profesión</th>
            <th class="text-center">Motivo de Muerte</th>
            </tr>
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
                <td class="text-center"><%= c.getMotivoMuerte()%></td>
            </tr>
            <%
                    }
                } // Cierre del ciclo for
            %>

            </tbody>
        </table>
    </section>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>

<script>
    function cerrarSesion() {
        // Redirige a tu enlace deseado
        window.location.href = "<%=request.getContextPath()%>/LoggingServlet?action=logout";
    }
</script>

<jsp:include page="/Includes/footer.jsp"/>

</html>