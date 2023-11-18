<%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>

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
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-primary" >
        <div class="container-fluid">
            <!--
            <a class="navbar-brand" href="#">Santy2304</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button> -->

            <button type="button" class="btn btn-warning position-relative">
                Profile

            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav me-auto mb-2 mb-md-0">
                    <li class="nav-item mx-2">
                        <!--<a class="nav-link active" aria-current="page" href="#">Menú</a>-->
                        <a class="nav-link active" aria-current="page" href="<%=request.getContextPath()%>/MenuServlet">Menú</a>

                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link active" href="<%=request.getContextPath()%>/GestionPersonasServlet">Pobladores</a>
                    </li>
                    <li class="nav-item mx-2">
                        <!--<a class="nav-link disabled" aria-disabled="true">Disabled</a>-->
                        <a class="nav-link active" href="<%=request.getContextPath()%>/GestionRecursosServlet">Recursos</a>
                    </li>
                    <li class="nav-item mx-2">
                        <!--<a class="nav-link disabled" aria-disabled="true">Disabled</a>-->
                        <a class="nav-link active" href="<%=request.getContextPath()%>/GuerraServlet">Guerras</a>
                    </li>
                    <li class="nav-item mx-2">
                        <!--<a class="nav-link disabled" aria-disabled="true">Disabled</a>-->
                        <a class="nav-link active" href="<%=request.getContextPath()%>/LeaderboardServlet">Leaderboard</a>
                    </li>
                </ul>

                <button type="button" class="btn btn-danger" onclick="cerrarSesion()" >Cerrar Sesión</button>

            </div>
        </div>
    </nav>
</header>

<main>
    <div class='container mt-5'>

        <div class="pb-5 pt-4 px-3 titlecolor">
            <div class="col-lg-6">
                <h1 >Tus Pobladores</h1>
            </div>
            <div>
                <a style="display: block; width: 200px; margin: 0 auto; text-align: center; background-color: #007bff; color: #ffffff; padding: 10px; text-decoration: none; border-radius: 5px;" href="<%=request.getContextPath()%>/JugadorServlet?a=crearPersona">Nueva Persona</a>
            </div>
        </div>

        <h2 class="mb-3">Granjeros</h2>
        <div class="tabla mb-5">
            <table class="table table-dark table-transparent table-hover">
                <thead>
                <th align="center">#ID</th>
                <th align="center">Nombre</th>
                <th align="center">Género</th>
                <th align="center">Consumo por día</th>
                <th align="center">Moral</th>
                <th align="center">Fuerza</th>
                <th align="center">Tiempo en Colonia</th>
                <th align="center">Produción de Alimento</th>
                <th align="center">Produción de Moral</th>
                <th align="center">Editar</th>
                <th align="center">Exiliar</th>
                </thead>
                <tbody class="table">
                <tr>
                    <td align="center">1</td>
                    <td align="center">Josh</td>
                    <td align="center">M</td>
                    <td align="center">30</td>
                    <td align="center">20</td>
                    <td align="center">10</td>
                    <td align="center">100</td>
                    <td align="center">78</td>
                    <td align="center">56</td>
                    <td align="center">
                        <a href="<%=request.getContextPath()%>/EmployeeServlet?action=editar&id"
                           type="button" class="btn btn-primary">
                            <i class="bi bi-pencil-square"></i>
                        </a>
                    </td>
                    <td align="center">
                        <a onclick="return confirm('¿Estas seguro de borrar?');"
                           href="<%=request.getContextPath()%>/EmployeeServlet?action=editar&id"
                           type="button" class="btn btn-danger">
                            <i class="bi bi-trash"></i>
                        </a>
                    </td>

                </tr>

                </tbody>

            </table>
        </div>


        <h2>Constructores</h2>
        <table  class="table table-dark table-transparent table-hover mt-3">
            <thead>

            <th>#ID</th>
            <th>Nombre</th>
            <th>Género</th>
            <th>Consumo por día</th>
            <th>Moral</th>
            <th>Fuerza</th>
            <th>Tiempo en Colonia</th>
            <th>Produción de Alimento</th>
            <th>Produción de Moral</th>

            <th>Editar</th>
            <th>Exiliar</th>

            </thead>
            <tbody class="table">
            <tr >
                <td align="center">1
                </td>
                <td align="center">Josh
                </td>
                <td align="center">M
                </td>
                <td align="center">30
                </td>
                <td align="center">20
                </td>
                <td align="center">10
                </td>
                <td align="center">100
                </td>
                <td align="center">78
                </td>
                <td align="center">89</td>
                <td align="center">
                    <a href="<%=request.getContextPath()%>/EmployeeServlet?action=editar&id"
                       type="button" class="btn btn-primary">
                        <i class="bi bi-pencil-square"></i>
                    </a>
                </td>
                <td align="center">
                    <a onclick="return confirm('¿Estas seguro de borrar?');"
                       href="<%=request.getContextPath()%>/EmployeeServlet?action=editar&id"
                       type="button" class="btn btn-danger">
                        <i class="bi bi-trash"></i>
                    </a>
                </td>

            </tr>

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
