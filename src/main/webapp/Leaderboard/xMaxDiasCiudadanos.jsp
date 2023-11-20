<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 19/11/2023
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.example.lab8iweb.Beans.*" %>
<%@ page import="com.example.lab8iweb.DTOs.EstadisticasLeaderSheep" %>
<jsp:useBean id="maxDiasOrden" type="ArrayList<com.example.lab8iweb.DTOs.EstadisticasLeaderSheep>" scope="request"/>

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
            text-align: center;
            width: 100%;
        }
        .text-outline {
            color: #fff;
            -webkit-text-stroke: 2px rgba(0, 0, 0, 0.8);
            text-stroke: 2px rgba(0, 0, 0, 0.8);
        }
        a {
            color: #000; /* Cambiar a tu color deseado, por ejemplo, negro (#000) */
            text-decoration: none; /* Quitar el subrayado predeterminado */
        }

        a:hover {
            color: #7e28b7; /* Cambiar a tu color deseado cuando se pasa el ratón sobre el enlace, por ejemplo, rojo (#FF0000) */
        }

    </style>
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
</head>
<body>
<header data-bs-theme="dark">
    <jsp:include page="../Includes/navbar.jsp"></jsp:include>
</header>
<div class='container mt-5'>
    <div class="pb-5 pt-4 px-3 titlecolor" style="text-align: center;">
        <div style="color: black; display: inline-block;">
            <h1 style="transform: skew(-10deg); font-weight: bold; color: #2c3e50; background-color: #ecf0f1; padding: 15px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">Los Mejores Jugadores</h1>
        </div>
    </div>
</div>
<main class="table">
    <section class="table__header">
        <h2 style="margin-top: 20px; margin-bottom:20px">Este es el top 10 del mundo</h2>
    </section>
    <section class="table__body">
        <table>
            <thead>
            <tr>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=id">#ID</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=name">Usuario</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=diasJugador">Días Jugados</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=poblacion">Población</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=moral">Moral</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=fuerza">Fuerza</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=wars">Guerras Ganadas</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=victorias">% Victorias</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=maxDias">Máximo número de días de un ciudadano</a></th>
                <th class="text-center"><a href="<%= request.getContextPath() %>/LeaderboardServlet?orden=cantAlimento">Producción de alimento</a></th>
            </tr>
            </thead>
            <tbody>
            <%
                if (maxDiasOrden != null && !maxDiasOrden.isEmpty()) {

                    for (EstadisticasLeaderSheep u : maxDiasOrden) {
            %>
            <tr>
                <td class="text-center"><%= u.getIdUsuario()%></td>
                <td class="text-center"><%= u.getNameUsuario()%></td>
                <td class="text-center"><%= u.getDiasJugados()%></td>

                <td class="text-center"><%= u.getCantidadTotalPobladores()%></td>
                <td class="text-center"><%= u.getCantidadTotalMoral()%></td>
                <td class="text-center"><%= u.getCantidadTotalFuerza()%></td>

                <td class="text-center">10</td>
                <td class="text-center">%11</td>

                <td class="text-center"><%= u.getMaxDiasPoblador()%></td>
                <td class="text-center"><%= u.getCantidadTotalProduccionAlimento()%></td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </section>
</main>
<br>
<br>
<br>
<jsp:include page="/Includes/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script>
    function cerrarSesion() {
        // Redirige a tu enlace deseado
        window.location.href = "<%=request.getContextPath()%>/LoggingServlet?action=logout";
    }
</script>
</body>
</html>

