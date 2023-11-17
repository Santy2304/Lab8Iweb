<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Página de Inicio</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            font-family: 'Roboto Condensed', sans-serif;
        }

        video {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        button {
            padding: 20px 40px;
            font-size: 28px;
            background-color: #2c3e50; /* Color oscuro */
            color: #ecf0f1; /* Color claro */
            border: none;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #34495e; /* Cambia el color al pasar el mouse */
        }
    </style>
    <!-- Enlace a la fuente Roboto Condensed -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@700&display=swap" rel="stylesheet">
</head>
<body>

<video autoplay loop muted>
    <!-- Reemplaza 'tu-video.mp4' con la URL de tu video -->
    <source src="Mi video.mp4" type="video/mp4">
    Tu navegador no admite el elemento de video.
</video>

<button onclick="window.location.href='<%=request.getContextPath()%>/LoggingServlet'">INICIAR</button>

<script>
    function iniciar() {
        alert('¡Inicio!');
        // Agrega aquí la lógica para iniciar tu aplicación
    }
</script>

</body>
</html>