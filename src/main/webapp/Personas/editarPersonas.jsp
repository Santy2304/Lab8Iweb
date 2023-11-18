<%@ page import="com.example.lab8iweb.Beans.Pobladores" %><%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Pobladores poblador = (Pobladores) request.getAttribute("poblador");%>

<html>
<head>
    <title>Editar Poblador</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

</head>
<body>
<div class='container'>

    <div class="row mb-4">
        <div class="col-md-3"></div>
        <div class="col-md-6 mx-auto mt-5">
            <h1 class='mb-3 mt-5'>Cambiale de nombre a tu poblador</h1>
            <hr>
            <form method="POST" action="GestionPersonasServlet">
                <input type="hidden" name="id_pobladores" value="<%= poblador.getIdPobladores()%>"/>
                <div class="mb-3 mt-3">
                    <label class="form-label" for="nombre">Nombre</label>
                    <input type="text" class="form-control form-control-sm" id="nombre" name="nombre"
                           value="<%= poblador.getNombre() == null ? "" : poblador.getNombre()%>">
                </div>


                <a href="<%= request.getContextPath()%>/GestionPersonasServlet" class="btn btn-danger mt-4">Cancelar</a>
                <input type="submit" value="Guardar" class="btn btn-primary mt-4"/>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
</body>
</html>
