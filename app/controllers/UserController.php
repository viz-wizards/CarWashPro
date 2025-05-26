<?php
require_once '../models/Usuario.php';

// Validar reCAPTCHA
if (!isset($_POST['g-recaptcha-response'])) {
    die('Por favor completa el reCAPTCHA');
}

$captcha = $_POST['g-recaptcha-response'];
$secretKey = '6Lei8EkrAAAAAHot9TjshXrt7t3B-Ghd5pFG5lM4'; 

$response = file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=$secretKey&response=$captcha");
$responseKeys = json_decode($response, true);

if (!$responseKeys["success"]) {
    die('Error en la verificación reCAPTCHA. Intenta de nuevo.');
}

// Obtener usuario y contraseña
$user = trim($_POST["user"]);
$clave = trim($_POST["pass"]);

// Validar usuario
$obj = new Usuario();
$resultado = $obj->getLoginUsuario();
$encontrados = 0;

while($fila = $resultado->fetch_array(MYSQLI_ASSOC)) {
    if($fila['usuario'] == $user && $fila['password'] == $clave) {
        session_start(); 
        $_SESSION["usuario_sesion"] = $fila; 
        $encontrados = 1;
        break;
    }
}

if($encontrados) {
    header('Location: ../views/dashboard.php');
    exit;
} else {
    header('Location: ../index.php');
    exit;
}
