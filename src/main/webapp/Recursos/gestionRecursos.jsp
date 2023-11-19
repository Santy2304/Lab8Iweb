<%@ page import="com.example.lab8iweb.Beans.Pobladores" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%int tiempoJugado = ((int) request.getAttribute("tiempoJugado"));%>

<html lang="en" data-bs-theme="auto">
<head><script src="../assets/js/color-modes.js"></script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.118.2">
    <title>Pricing example · Bootstrap v5.3</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/pricing/">



    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">


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
    </style>


    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
</head>
<%ArrayList<Pobladores> listaDepresivos   = (ArrayList<Pobladores>) request.getAttribute("listaDepresivos");  %>
<body>
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


<svg xmlns="http://www.w3.org/2000/svg" class="d-none">
    <symbol id="check" viewBox="0 0 16 16">
        <title>Check</title>
        <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
    </symbol>
</svg>

<div class="container py-3">
    <header>

        <jsp:include page="../Includes/navbar.jsp"></jsp:include>
        <% ArrayList<Pobladores> listaPobladores; %>


        <div class="pricing-header p-3 pb-md-4 mx-auto text-center">
            <h1 class="display-4 fw-normal text-body-emphasis mt-5">Recursos</h1>
            <p class="fs-5 text-body-secondary mt-3">Aquí podras ver tanto los alimentos como la moral de tu civilización</p>
        </div>
    </header>

    <main>
        <div class="row row-cols-1 row-cols-md-3 mb-3 text-center">
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm border-primary">
                    <div class="card-header py-3 text-bg-primary border-primary">
                        <h4 class="my-0 fw-normal">Almacen de Alimentos</h4>
                    </div>
                    <div class="card-body">
                        <h1 class="card-title pricing-card-title"><%= (int) request.getAttribute("totalAlimentos")%><small class="text-body-secondary fw-light"></small></h1>
                       <ul class="list-unstyled mt-3 mb-4">
                            <li>Usted posee una producción diaria de 500 ---  por día</li>
                        </ul>
                        <!--<button type="button" class="w-100 btn btn-lg btn-outline-primary">Sign up for free</button>-->
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card mb-4 rounded-3 shadow-sm border-primary">
                    <div class="card-header py-3 text-bg-primary border-primary">
                        <h4 class="my-0 fw-normal">Total por Alimentar Hoy</h4>
                    </div>
                    <div class="card-body">

                        <h1 class="card-title pricing-card-title"> <%= (int) request.getAttribute("totalPorAlimentar") %><small class="text-body-secondary fw-light"></small></h1>

                        <ul class="list-unstyled mt-3 mb-4">

                            <li>Usted posee un total de pobladores de <%= (int) request.getAttribute("totalPobladores") %> </li>
                        </ul>

                        <button type="button" class="w-100 btn btn-lg btn-primary">Alimentar Ahora</button>
                    </div>
                </div>
            </div>
                    <div class="col">
                        <div class="card mb-4 rounded-3 shadow-sm border-primary">
                            <div class="card-header py-3 text-bg-primary border-primary">
                                <h4 class="my-0 fw-normal">Horas del día</h4>
                            </div>
                            <div class="card-body">
                                <h1 class="card-title pricing-card-title"><%= tiempoJugado / 24 %><small class="text-body-secondary fw-light"> días </small></h1>
                                <h1 class="card-title pricing-card-title"><%= tiempoJugado % 24 %><small class="text-body-secondary fw-light"> horas</small></h1>
                                <ul class="list-unstyled mt-4 mb-4">
                                    <li>Este botón permitira que transcurran 24 horas</li>
                                </ul>
                                <button type="button" class="w-100 btn btn-lg btn-primary" onclick="redirigirAServletPasarHoras()" >Pasar las horas</button>
                                <ul class="list-unstyled mt-3 mb-4">
                                    <li>Este botón terminará el día y te tocara alimentar a tu gente</li>
                                </ul>
                                <button type="button" class="w-100 btn btn-lg btn-primary" onclick="redirigirAServletTerminarDia()" >Terminar el día</button>
                            </div>
                        </div>
                    </div>
        </div>

        <h2 class="display-6 text-center mt-5 mb-3">Cuidado, hay pobladores en peligro</h2>
        <p class="text-center mb-4">Estos son los 5 pobladores con la moral más baja. Si llega a 0, moriran.</p>
        <div class="table-responsive">
            <table class="table table-dark table-transparent table-hover">
                <thead>

                <th class="text-center">#ID</th>
                <th class="text-center">Nombre</th>
                <th class="text-center">Género</th>
                <th class="text-center">Profesión</th>
                <th class="text-center">Consumo/día</th>
                <th class="text-center">Moral</th>
                <th class="text-center">Tiempo(H)</th>

                </thead>
                <tbody class="table">

                <%for (Pobladores p : listaDepresivos){%>

                <%String genero = null;
                    switch(p.getGenero()){
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

                    <td CLASS="text-center"><%=p.getIdPobladores()%></td>
                    <td CLASS="text-center"><%=p.getNombre()%></td>
                    <td CLASS="text-center"><%=genero%></td>
                    <td CLASS="text-center"><%=p.getProfesion()%></td>
                    <td CLASS="text-center"><%=p.getAlimentacionPorDia()%></td>
                    <td CLASS="text-center"><%=p.getMoral()%></td>
                    <td CLASS="text-center"><%=p.getTiempoVivo()%></td>
                </tr>

                <%}%>
                </tbody>
            </table>
        </div>
    </main>


</div>
<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</body>
<script>
    seTerminoDia
    <%if(tiempoJugado % 24 !=0  ){%>
    function redirigirAServletPasarHoras() {

        window.location.href = "<%= request.getContextPath()%>/GestionRecursosServlet?action=pasar24";
    }
    <%}else{%>
    function redirigirAServletTerminarDia(){
        window.location.href = "<%= request.getContextPath()%>/GestionRecursosServlet?action=terminarDia";
    }
    <%}%>
</script>
</html>
