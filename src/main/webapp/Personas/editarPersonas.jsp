<%@ page import="com.example.lab8iweb.Beans.Pobladores" %><%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Editar Poblador</title>

</head>
<body>
<div class='container'>

    <div class="row mb-4">
        <div class="col-md-3"></div>
        <div class="col-md-6 mx-auto">
            <h1 class='mb-3'>Cambiale de nombre a tu poblador</h1>
            <hr>
            <form method="POST" action="GestionPersonasServlet">
                <input type="hidden" name="id_pobladores" value="<%//= poblador.getIdPobladores()%>"/>
                <div class="mb-3">
                    <label class="form-label" for="first_name">Nombre</label>
                    <input type="text" class="form-control form-control-sm" id="first_name" name="first_name"
                           value="<%//= //poblador.getNombre() == null ? "" : poblador.getNombre()%>">
                </div>


                <a href="<%= request.getContextPath()%>/GestionPersonasServlet" class="btn btn-danger">Cancelar</a>
                <input type="submit" value="Guardar" class="btn btn-primary"/>
            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>
</body>
</html>
