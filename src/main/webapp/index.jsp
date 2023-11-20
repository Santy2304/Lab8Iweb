<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Anton|Bangers|Changa:wght@400;700&display=swap">

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

        }

        video {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        button {
            transform: skew(-10deg); font-weight: bold; color: #2c3e50; background-color: #ecf0f1; padding: 35px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            font-size: 1.5em
        }
        button:hover {
            background-color: rgba(25, 87, 173, 0.89); /* Cambia el color al pasar el mouse */
        }
    </style>
    <!-- Enlace a la fuente Roboto Condensed -->
</head>
<body>

<video autoplay loop muted>
    <!-- Reemplaza 'tu-video.mp4' con la URL de tu video -->
    <source src="MiVideo.mp4" type="video/mp4">
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