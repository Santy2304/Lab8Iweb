<%@ page import="com.example.lab8iweb.Beans.Pobladores" %>
<%@ page import="javax.swing.*" %><%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 17/11/2023
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="poblador" type="com.example.lab8iweb.Beans.Pobladores" scope="request" />
<% //Pobladores poblador = (Pobladores) request.getAttribute("poblador");%>


<html>
<head>
    <title>Editar Poblador</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <link href="styleBonito.css">


    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins" , sans-serif;
        }


        body {
            min-height: 100vh;
            background: url(images/html_table.jpg) center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }



        video {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .container {
            position: relative;
            max-width: 850px;
            width: 100%;
            background: #fff;
            padding: 40px 30px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
            perspective: 2700px;
            z-index: 1;
        }


        .container .cover .front,
        .container .cover .back{
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
        }



        .container #flip:checked ~ .cover{
            transform: rotateY(180deg);
        }
        .cover .back{
            transform: rotateY(-180deg);
            backface-visibility: hidden;
        }
        .container .cover{
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 50%;
            z-index: 98;
            transition: all 1s ease;
            transform-origin: right;
            transform-style: preserve-3d;
        }



        .container #flip:checked ~ .cover{
            transform: rotateY(-180deg);
        }
        .cover .back{
            transform: rotateY(180deg);
            backface-visibility: hidden;
        }
        .container .cover{
            position: absolute;
            top: 0;
            left: 50%;
            height: 100%;
            width: 50%;
            z-index: 98;
            transition: all 1s ease;
            transform-origin: left;
            transform-style: preserve-3d;
        }



        .container .cover::after{
            opacity: 0.3;
            transform: rotateY(180deg);
            backface-visibility: hidden;
        }



        .container .cover::before,
        .container .cover::after{
            content: '';
            position: absolute;
            height: 100%;
            width: 100%;
            background: #3498db;
            opacity: 0.5;
            z-index: 12;
        }

        .container .cover img{
            position: absolute;
            height: 100%;
            width: 100%;
            object-fit: cover;
            z-index: 10;
        }
        .container .cover .text{
            position: absolute;
            z-index: 130;
            height: 100%;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .cover .text .text-1,
        .cover .text .text-2{
            font-size: 26px;
            font-weight: 600;
            color: #fff;
            text-align: center;
        }
        .cover .text .text-2{
            font-size: 15px;
            font-weight: 500;
        }
        .container .forms{
            height: 100%;
            width: 100%;
            background: #fff;
        }
        .container .form-content{
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .form-content .login-form,
        .form-content .signup-form{
            width: calc(100% / 2 - 25px);
        }
        .forms .form-content .title{
            position: relative;
            font-size: 24px;
            font-weight: 500;
            color: #1414b8;
        }
        .forms .form-content .title:before{
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            height: 3px;
            width: 25px;
            background: #1414b8;
        }
        .forms .signup-form  .title:before{
            width: 20px;
        }
        .forms .form-content .input-boxes{
            margin-top: 30px;
        }
        .forms .form-content .input-box{
            display: flex;
            align-items: center;
            height: 50px;
            width: 100%;
            margin: 10px 0;
            position: relative;
        }
        .form-content .input-box input{
            height: 100%;
            width: 100%;
            outline: none;
            border: none;
            padding: 0 30px;
            font-size: 16px;
            font-weight: 500;
            border-bottom: 2px solid rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }
        .form-content .input-box input:focus,
        .form-content .input-box input:valid{
            border-color: #3498db;
        }
        .form-content .input-box i{
            position: absolute;
            color: #3498db;
            font-size: 17px;
        }
        .forms .form-content .text{
            font-size: 14px;
            font-weight: 500;
            color: #3498db;
        }
        .forms .form-content .text a{
            text-decoration: none;
        }
        .forms .form-content .text a:hover{
            text-decoration: underline;
        }
        .forms .form-content .button{
            color: #fff;
            margin-top: 40px;
        }
        .forms .form-content .button input{
            color: #fff;
            background: #3498db;
            border-radius: 6px;
            padding: 0;
            cursor: pointer;
            transition: all 0.4s ease;
        }
        .forms .form-content .button input:hover{
            background: #1414b8;
        }
        .forms .form-content label{
            color: #1414b8;
            cursor: pointer;
        }
        .forms .form-content label:hover{
            text-decoration: underline;
        }
        .forms .form-content .login-text,
        .forms .form-content .sign-up-text{
            text-align: center;
            margin-top: 25px;
        }
        .container #flip{
            display: none;
        }
        @media (max-width: 730px) {
            .container .cover{
                display: none;
            }
            .form-content .login-form,
            .form-content .signup-form{
                width: 100%;
            }
            .form-content .signup-form{
                display: none;
            }
            .container #flip:checked ~ .forms .signup-form{
                display: block;
            }
            .container #flip:checked ~ .forms .login-form{
                display: none;
            }
            .error-txt{
                color: #dc3545;
                text-align: left;
                margin-top: 5px;
            }


        }


    </style>


</head>
<body>

<video autoplay muted loop>
    <source src="MiVideo.mp4" type="video/mp4">
    Tu navegador no admite la etiqueta de video.
</video>

<div class='container'>

    <!--
    <div class="cover">
        <div class="front">
            <img src="<%//=request.getContextPath()%>/Images/imagenEditar.jpg" alt="">

        </div>

    </div >-->
    <% String error = (String) request.getAttribute("error"); %>
    <div class="forms">
        <div class="form-content" >
            <div class=" signup-form mx-auto ">
                <h1 class=' title mb-3'>Cambiale de nombre a tu poblador</h1>
                <form method="POST" action="<%=request.getContextPath()%>/GestionPersonasServlet?action=actualizar">
                    <input type="hidden" name="id_pobladores" value="<%= poblador.getIdPobladores()%>"/>
                    <div class="mb-3 mt-3">
                        <label class="form-label" for="nombre">Nombre</label>
                        <input type="text" class="form-control form-control-sm" id="nombre" name="nombre"
                               value="<%= poblador.getNombre() == null ? "" : poblador.getNombre()%>">

                        <%if (error!=null){%>
                            <label style="color: red;" class="mt-3">El nombre debe tener menos de 10 caractéres </label>
                        <%}%>

                    </div>


                    <a href="<%= request.getContextPath()%>/GestionPersonasServlet" class="btn btn-danger mt-3">Cancelar</a>
                    <button type="submit" class="btn btn-primary mt-3">Confirmar</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
