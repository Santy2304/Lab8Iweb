<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
        <!--
        <a class="navbar-brand" href="#">Santy2304</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button> -->
        <!--
        <button type="button" class="btn btn-warning position-relative">

            <%//=((Usuario)request.getSession().getAttribute("Usuario")).getIdUsuario()%>

        </button>
        -->
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
                    <a class="nav-link active" href="<%= request.getContextPath()%>/LeaderboardServlet?orden=lista">Leaderboard</a>
                </li>
            </ul>

            <button type="button" class="btn btn-danger" onclick="cerrarSesion()">Cerrar Sesión</button>

            <script>
                function cerrarSesion() {
                    // Redirige a tu enlace deseado
                    window.location.href = "<%=request.getContextPath()%>/LoggingServlet?action=logout";
                }
            </script>
        </div>
    </div>
</nav>