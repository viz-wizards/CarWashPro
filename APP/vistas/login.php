<?php
session_start();
if (isset($_SESSION["usuario_sesion"])) {
    header("Location: dashboard.php");
    exit();
}

include_once __DIR__ . '/../Modelos/Conexion.php';

$mensaje_error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['user'];
    $password = $_POST['pass'];

    $conexion = new Conexion();
    $conexion->conectar();
    $conn = new mysqli(
        $conexion->getServidor(),
        $conexion->getUser(),
        $conexion->getClave(),
        $conexion->getDatabase()
    );

    $sql = "SELECT * FROM tb_usuario WHERE usuario = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $usuario, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows === 1) {
        $datos = $result->fetch_assoc();
        $_SESSION["usuario_sesion"] = [
            "nombre" => $datos["nombre"],
            "apellido" => $datos["apellido"],
            "id_rol" => $datos["id_rol"]
        ];
        header("Location: dashboard.php");
        exit;
    } else {
        $mensaje_error = "Usuario o contraseña incorrectos.";
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | CarWash SuperCar</title>
    <link rel="stylesheet" href="../asset/css/logins.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
    <div class="wrapper">
        <form method="POST" action="Controladores/UserController.php">

            <h1>Bienvenido</h1>
            <h2 id="is">Iniciar sesión</h2> 
            <div class="input-box">
                <input type="text" name="user" placeholder="Usuario" required>
                <i class='bx bxs-user'></i>
            </div>
            <div class="input-box">
                <input type="password" name="pass" placeholder="Contraseña" required>
                <i class='bx bxs-lock-alt'></i>
            </div>

            <div class="remember-forgot">
                <a href="#">Olvidé mi contraseña</a>
            </div>

            <button type="submit" class="btn">Iniciar Sesión</button>
        </form>
    </div>

    <?php if (!empty($mensaje_error)): ?>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: <?= json_encode($mensaje_error) ?>
            });
        });
    </script>
    <?php endif; ?>
</body>

</html>
