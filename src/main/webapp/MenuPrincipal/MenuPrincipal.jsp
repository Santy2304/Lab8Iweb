<%--
  Created by IntelliJ IDEA.
  User: Santiago
  Date: 16/11/2023
  Time: 23:55
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

<!--
<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="check2" viewBox="0 0 16 16">
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
    </symbol>
    <symbol id="circle-half" viewBox="0 0 16 16">
        <path d="M8 15A7 7 0 1 0 8 1v14zm0 1A8 8 0 1 1 8 0a8 8 0 0 1 0 16z"/>
    </symbol>
    <symbol id="moon-stars-fill" viewBox="0 0 16 16">
        <path d="M6 .278a.768.768 0 0 1 .08.858 7.208 7.208 0 0 0-.878 3.46c0 4.021 3.278 7.277 7.318 7.277.527 0 1.04-.055 1.533-.16a.787.787 0 0 1 .81.316.733.733 0 0 1-.031.893A8.349 8.349 0 0 1 8.344 16C3.734 16 0 12.286 0 7.71 0 4.266 2.114 1.312 5.124.06A.752.752 0 0 1 6 .278z"/>
        <path d="M10.794 3.148a.217.217 0 0 1 .412 0l.387 1.162c.173.518.579.924 1.097 1.097l1.162.387a.217.217 0 0 1 0 .412l-1.162.387a1.734 1.734 0 0 0-1.097 1.097l-.387 1.162a.217.217 0 0 1-.412 0l-.387-1.162A1.734 1.734 0 0 0 9.31 6.593l-1.162-.387a.217.217 0 0 1 0-.412l1.162-.387a1.734 1.734 0 0 0 1.097-1.097l.387-1.162zM13.863.099a.145.145 0 0 1 .274 0l.258.774c.115.346.386.617.732.732l.774.258a.145.145 0 0 1 0 .274l-.774.258a1.156 1.156 0 0 0-.732.732l-.258.774a.145.145 0 0 1-.274 0l-.258-.774a1.156 1.156 0 0 0-.732-.732l-.774-.258a.145.145 0 0 1 0-.274l.774-.258c.346-.115.617-.386.732-.732L13.863.1z"/>
    </symbol>
    <symbol id="sun-fill" viewBox="0 0 16 16">
        <path d="M8 12a4 4 0 1 0 0-8 4 4 0 0 0 0 8zM8 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 0zm0 13a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0v-2A.5.5 0 0 1 8 13zm8-5a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2a.5.5 0 0 1 .5.5zM3 8a.5.5 0 0 1-.5.5h-2a.5.5 0 0 1 0-1h2A.5.5 0 0 1 3 8zm10.657-5.657a.5.5 0 0 1 0 .707l-1.414 1.415a.5.5 0 1 1-.707-.708l1.414-1.414a.5.5 0 0 1 .707 0zm-9.193 9.193a.5.5 0 0 1 0 .707L3.05 13.657a.5.5 0 0 1-.707-.707l1.414-1.414a.5.5 0 0 1 .707 0zm9.193 2.121a.5.5 0 0 1-.707 0l-1.414-1.414a.5.5 0 0 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .707zM4.464 4.465a.5.5 0 0 1-.707 0L2.343 3.05a.5.5 0 1 1 .707-.707l1.414 1.414a.5.5 0 0 1 0 .708z"/>
    </symbol>
</svg>
-->



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
                        <a class="nav-link active" aria-current="page" href="#">Menú</a>

                    </li>
                    <li class="nav-item mx-2">
                        <a class="nav-link active" href="#">Pobladores</a>
                    </li>
                    <li class="nav-item mx-2">
                        <!--<a class="nav-link disabled" aria-disabled="true">Disabled</a>-->
                        <a class="nav-link active" href="#">Recursos</a>
                    </li>
                    <li class="nav-item mx-2">
                        <!--<a class="nav-link disabled" aria-disabled="true">Disabled</a>-->
                        <a class="nav-link active" href="#">Guerras</a>
                    </li>

                    <li class="nav-item mx-2">
                        <!--<a class="nav-link disabled" aria-disabled="true">Disabled</a>-->
                        <a class="nav-link active" href="#">Leaderboard</a>
                    </li>

                </ul>

                <button type="button" class="btn btn-danger">Cerrar Sesión</button>

            </div>
        </div>
    </nav>
</header>

<main>

    <div id="myCarousel" class="carousel slide mb-6" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="<%=request.getContextPath()%>/Images/civilizacion.jpg" class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <div class="container">
                    <div class="carousel-caption text-start">
                        <h1 class="display-3 text-white fw-bold">¿Estas listo para esta nueva aventura?</h1>
                        <p>Forja un imperio que desafíe al tiempo y conquiste la historia</p>
                        <!--<p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>-->
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/Images/gurerraNueva.jpg" class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <div class="container">
                    <div class="carousel-caption">
                        <h1 class="display-3 text-white fw-bold">No hay otra opción más que la guerra</h1>
                        <p>En cada desafío y cada conflicto reside la oportunidad de dejar huella en la historia.</p>


                        <!--<p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>-->
                    </div>
                </div>
            </div>




            <div class="carousel-item">
                <img src="<%=request.getContextPath()%>/Images/mundoTrofeo.jpg" class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">
                <div class="container">
                    <div class="carousel-caption text-end">
                        <h1 class="display-3 text-white fw-bold">Demuestrales a los demás que tan bueno eres</h1>
                        <p>Los mejores jugadores apareceran en el leaderboard.</p>
                        <!--<p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>-->
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>


    <!-- Marketing messaging and featurettes
    ================================================== -->
    <!-- Wrap the rest of the page in another container to center all the content. -->

    <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row justify-content-center mt-4 mb-4">
            <div class="col-lg-4 d-flex flex-column align-items-center justify-content-center">
                <img class="bd-placeholder-img rounded-circle mb-3" width="140" height="140" src="<%=request.getContextPath()%>/Images/granjero.jpg" alt="Imagen de granjero">
                <h2 class="fw-normal">Granjero</h2>
                <p class="text-center">Parte fundamental de una civilización, ellos produciran el alimento para toda tu gente.</p>
              <!--  <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>-->
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4 d-flex flex-column align-items-center justify-content-center">
                <img class="bd-placeholder-img rounded-circle mb-3" width="140" height="140" src="<%=request.getContextPath()%>/Images/constructorTalvez.jpg" alt="Imagen de constructor">
                <h2 class="fw-normal">Constructor</h2>
                <p class="text-center">Estos individuos están equipados con conocimientos avanzados en arquitectura, ingeniería y logística.</p>
               <!-- <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>-->
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4 d-flex flex-column align-items-center justify-content-center mt-4">
                <img class="bd-placeholder-img rounded-circle mb-3" width="140" height="140" src="<%=request.getContextPath()%>/Images/soldadoAzul.jpg" alt="Imagen de soldado">
                <h2 class="fw-normal">Soldado</h2>
                <p class="text-center">Entrenados en combate y estrategia, estos guerreros son fundamentales para defender el territorio y conquistar nuevas tierras.</p>
               <!-- <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>-->
            </div><!-- /.col-lg-4 -->
        </div><!-- /.row -->


        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider mt-5">

        <div class="row featurette mt-5">
            <div class="col-md-7">
                <h2 class="featurette-heading fw-normal lh-1">Crea tus pobladores <span class="text-body-secondary"></span></h2>
                <p class="lead mt-4">Los pobladores son la fuerza vital de cualquier civilización en un juego de estrategia. Las 3 profesiones fundamentales te brindan diferentes beneficios que deberas aprovechar al máximo.</p>
            </div>
            <div class="col-md-5">
                <img src="<%=request.getContextPath()%>/Images/creacionPersonas.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" alt="Descripción de la imagen">
            </div>
        </div>

        <hr class="featurette-divider mt-5">

        <div class="row featurette mt-5">
            <div class="col-md-7 order-md-2">
                <h2 class="featurette-heading fw-normal lh-1">Administra tus recursos <span class="text-body-secondary"></span></h2>
                <p class="lead mt-4">Asi como los pobladores producen, también consumen. Tendrás que administrar el alimento sabiamente para no perder a ningún ciudadano. Asimismo, mantén la moral de tu pueblo alta; la depresión como sabes, puede ser fatal.</p>
            </div>
            <div class="col-md-5 order-md-1">
                <img src="<%=request.getContextPath()%>/Images/administracionRecursos.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" alt="Descripción de la imagen">
            </div>
        </div>

        <hr class="featurette-divider mt-5">

        <div class="row featurette mt-5">
            <div class="col-md-7">
                <h2 class="featurette-heading fw-normal lh-1">Preparate para la batalla <span class="text-body-secondary"></span></h2>
                <p class="lead mt-4">¿Eres el mejor? Demuestralo en el campo de batalla. Podrás declarar la guerra a los demás jugadores </p>
            </div>
            <div class="col-md-5">
                <img src="<%=request.getContextPath()%>/Images/batalla.jpg" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" alt="Descripción de la imagen">

            </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

    </div><!-- /.container -->

</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
<jsp:include page="/Includes/footer.jsp"/>
</html>
