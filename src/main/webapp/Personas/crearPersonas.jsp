<%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <title class="mt-4">Nuevo Poblador</title>
</head>
<body>
<div class='container'>
    <div class="row justify-content-center">
        <form method="POST" action="EmployeeServlet?action=guardar" class="col-md-6 col-lg-6">
            <h1 class='mb-3 mt-4'>Nuevo Poblador</h1>
            <hr>
            <div class="mb-3">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control form-control-sm" name="nombre" id="nombre">
            </div>
            <div class="mb-3">
                <label for="genero">Género</label>
                <select class="form-control form-control-sm" name="genero" id="genero">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                    <option value="O">Otro</option>
                </select>
            </div>


            <div class="mb-3">
                <label for="profesion">Género</label>
                <select class="form-control form-control-sm" name="profesion" id="profesion">
                    <option value="Granjero">Granjero</option>
                    <option value="Constructor">Constructor</option>
                    <option value="Soldado">Soldado</option>
                    <option value="Ninguno">Ninguno</option>
                </select>
            </div>



            <a href="<%= request.getContextPath()%>/GestionPersonasServlet" class="btn btn-danger">Cancelar</a>
            <input type="submit" value="Guardar" class="btn btn-primary"/>
        </form>
    </div>
</div>

</body>
</html>