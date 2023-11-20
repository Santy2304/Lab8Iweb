<%@ page import="com.example.lab8iweb.Beans.HistorialGuerras" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.lab8iweb.Daos.DaoUsuario" %>
<%@ page import="com.example.lab8iweb.Beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%ArrayList<HistorialGuerras> historial = (ArrayList<HistorialGuerras>) request.getAttribute("historial");%>

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
            color: #fff; /* Color del texto */
            -webkit-text-stroke: 2px rgba(0, 0, 0, 0.8);
            text-stroke: 2px rgba(0, 0, 0, 0.8);
            /* Ajusta los valores según sea necesario */
        }

    </style>


    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
</head>

<body>

    <header data-bs-theme="dark">
        <jsp:include page="../Includes/navbar.jsp"></jsp:include>
    </header>

    <div class='container mt-5'>

        <div class="pb-5 pt-4 px-3 titlecolor" style="text-align: center;">
            <div style="color: black; display: inline-block;">
                <h1 style="transform: skew(-10deg); font-weight: bold; color: #2c3e50; background-color: #ecf0f1; padding: 15px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">Guerra</h1>
            </div>
            <div class="mt-4">
                <p style="display: inline-block; width: 200px; text-align: center; background-color: rgba(26,21,21,0.85); color: #ffffff; padding: 10px; text-decoration: none; border-radius: 5px; vertical-align: middle;">Aquí podrás declarar la guerra a otro jugador, además de ver tu historial</p>
            </div>
        </div>
    </div>

<%
    int fuerzaAtaqueTotal = (int ) request.getAttribute("fuerzaAtaqueTotal");
    int fuerzaDefensaTotal = (int ) request.getAttribute("fuerzaDefensaTotal");
%>
    <main class="container mt-5">
        <div class="row row-cols-1 row-cols-md-3 mb-3 text-center mt-2">
            <div class="col mx-auto">
                <div class="card mb-4 rounded-3 shadow-sm border-primary">
                    <div class="card-header py-3 text-bg-primary border-primary">
                        <h4 class="my-0 fw-normal">Tus Fuerzas de ataque es</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title"><%= fuerzaAtaqueTotal %><small class="text-body-secondary fw-light"></small></h1>
                        <!-- <ul class="list-unstyled mt-3 mb-4">
                            <li>Total de Alimento: </li>
                            <li>Total de Moral: </li>
                            <li>Total de Soldados: </li>
                        </ul>
                        -->
                       <!-- <button type="button" class="w-100 btn btn-lg btn-primary">Contact us</button>-->
                    </div>
                </div>
            </div>
            <div class="col mx-auto">
                <div class="card mb-4 rounded-3 shadow-sm border-primary">
                    <div class="card-header py-3 text-bg-primary border-primary">
                        <h4 class="my-0 fw-normal">Estado de tu civilización</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title"><%= ((String) request.getAttribute("estado")) %><small class="text-body-secondary fw-light"></small></h1>
                        <ul class="list-unstyled mt-3 mb-4">
                            <li>Han pasado : <%= ( (int)request.getAttribute("tiempoJugado") )/24 %> días</li>
                        </ul>
                        <!-- <button type="button" class="w-100 btn btn-lg btn-primary">Contact us</button>-->
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div class='container mt-5'>

        <div class="pb-5 pt-4 px-3 titlecolor" style="text-align: center;">
            <div style="color: black; display: inline-block;">
                <h1 style="transform: skew(-10deg); font-weight: bold; color: #e50a1b; background-color: #ecf0f1; padding: 15px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">Jugadores a declarar guerra</h1>
            </div>
        </div>
    </div>
    <main class="table">
        <section class="table__header">
            <h2 style="margin-top: 20px; margin-bottom:20px"> </h2>
        </section>
        <section class="table__body">
            <table>
                <thead>
                <tr>
                <th class="text-center">#</th>
                <th class="text-center">Oponente</th>
                <th class="text-center">Fuerza </th>
                <th class="text-center"></th>
                </tr>
                </thead>
                <tbody>
                <%int counter= 1;%>
                <%ArrayList<Usuario> listaUsuario = (ArrayList<Usuario>) request.getAttribute("listaContrincantes"); %>
                <%for(Usuario u: listaUsuario){%>

                <tr>
                    <td class="text-center"><%= counter%></td>
                    <td class="text-center"><%= u.getNombreUsuario()%></td>
                    <td class="text-center">200</td>
                    <td class="text-center"><button type="button" class="btn btn-danger btn-sm" style="font-size: 12px; padding: 4px 8px;background-color: red; color: white;">Atacar</button></td>
                </tr>
                <%counter= counter+1;%>
                <%}%>
                </tbody>
            </table>
        </section>
    </main>
    <br>
    <br>

    <div class='container mt-5'>
        <div class="pb-5 pt-4 px-3 titlecolor" style="text-align: center;">
            <div style="color: black; display: inline-block;">
                <h1 style="transform: skew(-10deg); font-weight: bold; color: #e50a1b; background-color: #ecf0f1; padding: 15px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">Historial de Guerras</h1>
            </div>
    </div>
    </div>
        <main class="table">
            <section class="table__header">
                <h2 style="margin-top: 20px; margin-bottom:20px"> </h2>
            </section>
            <section class="table__body">
                <table>
                    <thead>
                    <tr>
                <th class="text-center">#</th>
                <th class="text-center">Oponente</th>
                <th class="text-center">Resultado</th>
                <th class="text-center">Fecha</th>
                    </tr>
                    </thead>
                <tbody class="table">

                <%
                    for (HistorialGuerras g : historial ){ %>

                <tr>
                    <td class="text-center"><%=g.getIdHistorialGuerras()%></td>
                    <td class="text-center"><%= g.getContrincante()%></td>
                    <td class="text-center"><%=g.getResultado()%></td>
                    <td class="text-center"><%=g.getHoraInicio()%></td>

                </tr>

                <%}%>
                </tbody>
                </table>
            </section>
        </main>
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