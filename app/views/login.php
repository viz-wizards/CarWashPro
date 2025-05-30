<?php
session_start();
if (isset($_SESSION["usuario_sesion"])) {
    header("Location: views/dashboard.php");
    exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
    <!-- Mis propios estilos -->
    <link rel="stylesheet" href="views/assets/css/login.css">
    <!-- Poner icono -->
    <link rel="shortcut icon" href="#" type="image/x-icon"> 
    <!-- Script reCAPTCHA -->
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body>
    <form action="controllers/UserController.php" method="POST" style="border:1px solid;">
        <fieldset>
            <legend>FORMULARIO-EMPRESA</legend>
            <label for="user">Usuario</label>
            <input type="text" name="user" placeholder="Escribe tu usuario" required>

            <label for="pass">Contraseña</label>
            <input type="password" name="pass" placeholder="Escribe tu contraseña" required>

            <input type="checkbox" onclick="pass.type =this. checked ? 'text' : 'password'">
            <!-- reCAPTCHA -->
            <div class="g-recaptcha" data-sitekey="6Lei8EkrAAAAAD7vv-YK22L5U-oZTivGPjrndBmQ"></div>

            <input type="submit" value="Iniciar Sesión">
        </fieldset>
    </form>
</body>
</html>
