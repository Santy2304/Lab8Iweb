<%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.lab8iweb.Beans.*" %>
<%@ page import="com.example.lab8iweb.DTOs.EstadisticasLeaderSheep" %>
<jsp:useBean id="estadisticas" type="ArrayList<com.example.lab8iweb.DTOs.EstadisticasLeaderSheep>" scope="request"/>

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
    <jsp:include page="../Includes/navbar.jsp"></jsp:include>
</header>

<main>
    <div class='container mt-5'>

        <div class="pb-5 pt-4 px-3 titlecolor">
            <div class="col-lg-6">
                <h1 >Los Mejores Jugadores</h1>
            </div>

        </div>

        <h2 class="mb-3">Este es el top 10 del mundo</h2>
        <div class="tabla mb-5">
            <table class="table table-dark table-transparent table-hover">
                <thead>
                <th class="text-center">#ID</th>
                <th class="text-center">Usuario</th>
                <th class="text-center">Días Jugados</th>
                <th class="text-center">Población</th>
                <th class="text-center">Moral</th>
                <th class="text-center">Fuerza</th>
                <th class="text-center">Guerras Ganadas</th>
                <th class="text-center">% Victorias</th>
                <th class="text-center">Máximo número de días de un ciudadano</th>
                <th class="text-center">Producción de alimento</th>
                </thead>
                <tbody class="table">
                <%
                    if (estadisticas != null && !estadisticas.isEmpty()) {

                        for (EstadisticasLeaderSheep u : estadisticas) {
                %>
                <tr>
                    <td class="text-center"><%= u.getIdUsuario()%></td>
                    <td class="text-center"><%= u.getNameUsuario()%></td>
                    <td class="text-center"><%= u.getDiasJugados()%></td>

                    <td class="text-center"><%= u.getCantidadTotalPobladores()%></td>
                    <td class="text-center"><%= u.getCantidadTotalMoral()%></td>
                    <td class="text-center"><%= u.getCantidadTotalFuerza()%></td>

                    <td class="text-center">10</td>
                    <td class="text-center">11</td>

                    <td class="text-center"><%= u.getMaxDiasPoblador()%></td>
                    <td class="text-center"><%= u.getCantidadTotalProduccionAlimento()%></td>


                </tr>

                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="3" class="text-center">No hay datos disponibles</td>
                </tr>
                <%
                    }
                %>
                </tbody>

            </table>
        </div>

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
