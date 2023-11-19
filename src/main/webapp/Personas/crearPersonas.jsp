<%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Nuevo Poblador</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="Personas/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        .container {
            margin-top: 5rem;
        }

        .titlecolor {
            background-color: rgba(1, 4, 105, 0.71);
            color: red;
            text-shadow: 2px 2px 4px white;
            display: inline-block;
            text-align: center;
        }

        .titlecolor h1 {
            transform: skew(-10deg);
            font-weight: bold;
            margin: 0;
            padding: 20px;
        }

        .form-container {
            margin: 50px;
            max-width: 600px; /* Ajusta el ancho según tus necesidades */
            margin-left: auto;
            margin-right: auto;
            background-color: #f8f9fa;
            border-radius: 20px;
            padding: 50px;
        }

        .form-container label {
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .form-container .btn {
            margin-top: 20px;
        }
        .form-container .wide-input {
            width: 80%; /* Ajusta el ancho según tus necesidades */
        }
    </style>
</head>
<body>

    <div class="pb-2 pt-2 px-3 titlecolor">
            <h1 style="transform: skew(-10deg); font-weight: bold;">Nuevo Poblador</h1>
    </div>

<main>
    <form method="POST" action="GestionPersonasServlet?action=guardarPoblador" class="form-container">

        <section class="table__body">
            <div class="mb-3">
                <label for="nombre">   Nombre        </label>
                <input type="text" class="form-control form-control-sm" name="nombre" id="nombre">
            </div>
            <div class="mb-3">
                <label for="genero">   Género        </label>
                <select class="form-control form-control-sm" name="genero" id="genero">
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                    <option value="O">Otro</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="profesion">   Profesión        </label>
                <select class="form-control form-control-sm" name="profesion" id="profesion">
                    <option value="Granjero">Granjero</option>
                    <option value="Constructor">Constructor</option>
                    <option value="Soldado">Soldado</option>
                    <option value="Ninguno">Ninguno</option>
                </select>
            </div>
            <div class="d-flex justify-content-between"> <!-- Cambio a flexbox para alinear los botones -->
                <a href="<%= request.getContextPath()%>/GestionPersonasServlet" class="btn btn-danger">Cancelar</a>
                <input type="submit" value="Guardar" class="btn btn-primary"/>
            </div>
        </section>
    </form>
</main>
</body>
</html>