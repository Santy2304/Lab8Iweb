<%@ page import="com.example.lab8iweb.Beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: Hineill
  Date: 15/11/2023
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>


<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->
    <link rel="stylesheet" href="style.css">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <% String signUpForm = (String) request.getAttribute("signUpForm"); %>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Poppins" , sans-serif;
        }
        body{
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #094293;
            overflow: hidden;
            margin: 0;
            padding: 0;
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

        <%if(signUpForm != null){%>

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

        <%}else{%>

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


        <%}%>
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
<div class="container">
    <input type="checkbox" id="flip">
<% String error = (String) request.getAttribute("error"); %>
    <div class="cover">
        <div class="front">
            <img src="<%=request.getContextPath()%>/Images/ImagenCentral.jpeg" alt="">
            <div class="text">
                <span class="text-1">Every new friend is a <br> new adventure</span>
                <span class="text-2">Let's get connected</span>
            </div>
        </div>
        <div class="back">
            <img class="backImg" src="<%=request.getContextPath()%>/Images/ImagenCentral.jpeg" alt="">
            <div class="text">
                <span class="text-1">Complete miles of journey <br> with one step</span>
                <span class="text-2">Let's get started</span>
            </div>
        </div>
    </div>

    <div class="forms">
        <div class="form-content">
            <div class="login-form">
                <div class="title">Inicio de sesión </div>

                    <form method="POST" action="LoggingServlet" class="col-md-6 col-lg-6">
                    <div class="input-boxes">
                        <%if(error != null){%>

                        <div class="text sign-up-text" style="color: red; font-size: 12px;" ><%= error%> </div>
                        <%}%>

                        <div class="input-box">
                            <i class="fas fa-envelope"></i>
                            <input type="text" name="usuario" placeholder="Ingresa tu nombre de usuario" required>
                        </div>
                        <div class="input-box">
                            <i class="fas fa-lock"></i>
                            <input type="password" name="contrasena" placeholder="Ingresa tu contraseña" required>
                        </div>

                        <div class="button input-box">
                            <input type="submit" value="Iniciar">
                        </div>

                        <div class="text sign-up-text">No tienes una cuenta? <label for="flip">Registrate ahora</label></div>
                    </div>
                    </form>

            </div>
            <div class="signup-form">
                <div class="title">Registro</div>

                    <form method="POST" action="SignUpServlet?action=form" class="col-md-6 col-lg-6">
                    <div class="input-boxes field email">
                        <!-- SECCION NOMBRE REAL DEL USUARIO-->
                        <%if(request.getAttribute("errorNombre")==null){%>
                        <div class="input-box" >
                            <i class="fas fa-user"></i>
                            <input type="text"  name="nombre" placeholder="Ingresa tu nombre"  required>
                        </div>
                        <%}else{%>
                        <div class="input-box" >
                            <i class="fas fa-user" style="color: red;"></i>
                            <input type="text" name="nombre" placeholder="Ingresa un nombre válido"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >Tu nombre no puede contener números</div>
                        <%}%>

                        <!--EDAD DEL USUARIO-->
                        <%if( request.getAttribute("errorEdad") == null ){%>
                        <div class="input-box" >
                            <i class="fas fa-user"></i>
                            <input type="text" name="edad" placeholder="Ingresa tu edad"  required>
                        </div>
                        <%}else if (  ((String)request.getAttribute("errorEdad")).equals("error")  ){%>
                        <div class="input-box" >
                            <i class="fas fa-user" style="color: red;"></i>
                            <input type="text" name="edad" placeholder="Ingresa una edad válida"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >Debe ingresar un numero</div>
                        <%}else if (  ((String)request.getAttribute("errorRegistro")).equals("ListaNegra")    ){%>
                        <div class="input-box" >
                            <i class="fas fa-user" style="color: red;"></i>
                            <input type="text" name="edad" placeholder="Eres muy pequeño para jugar"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >Ahora te encuentras en la lista negra (estás baneado) </div>
                        <%}%>

                        <!--SECCION DEL CORREO -->

                        <%if(request.getAttribute("errorCorreo")==null){%>
                        <div class="input-box" >
                            <i class="fas fa-envelope"></i>
                            <input type="email"  name="correo" placeholder="Ingresa tu correo"  required>
                        </div>
                        <%}else if( ( (String) request.getAttribute("errorCorreo")).equals("error")  ){%>
                        <div class="input-box" >
                            <i class="fas fa-envelope" style="color: red;"></i>
                            <input type="email" name="correo" placeholder="Ingresa un correo válido"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >Tu correo debe existir (debe contener al menos un @ )</div>
                        <%}else if (  ( (String) request.getAttribute("errorCorreo")).equals("ListaNegra")     ){%>

                        <div class="input-box" >
                            <i class="fas fa-envelope" style="color: red;"></i>
                            <input type="email" name="correo" placeholder="Tu correo esta en la lista negra"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >Debes tener al menos 13 años para jugar </div>
                        <%}%>

                        <!--Username -->
                        <%if(request.getAttribute("errorUsername")==null){%>
                        <div class="input-box" >
                            <i class="fas fa-user"></i>
                            <input type="text"  name="username" placeholder="Ingresa su nombre de usuario"  required>
                        </div>
                        <%}else{%>
                        <div class="input-box" >
                            <i class="fas fa-user" style="color: red;"></i>
                            <input type="text" name="username" placeholder="Ingresa un nombre de usuario válido"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >Ya existe otro jugador con ese nombre</div>
                        <%}%>
                        <!--Contraseña-->
                        <%if(request.getAttribute("errorContrasena")==null){%>
                        <div class="input-box" >
                            <i class="fas fa-lock"></i>
                            <input type="password"  name="contrasena" placeholder="Ingresa tu contraseña"  required>
                        </div>
                        <%}else{%>
                        <div class="input-box" >
                            <i class="fas fa-lock" style="color: red;"></i>
                            <input type="password" name="contrasena" placeholder="Ingresa una contraseña válida"  required>
                        </div>
                        <div class="error error-txt" style="font-size: 12px; color: red;" >tu contraseña debe tener por lo menos una mayuscula , un numero y un caracter especial </div>
                        <%}%>


                        <div class="button input-box">
                            <input type="submit" value="Enviar">
                        </div>
                        <div class="text sign-up-text">Ya tienes una cuenta? <label for="flip"> Ingresa ahora</label></div>
                    </div>
                    </form>

            </div>
        </div>
    </div>
</div>

</body>
</html>
