<?php
session_start();

require_once '../Modelos/usuario.php';

$obj = new Usuario();
$resultado = $obj->getLoginUsuario();

$user = trim($_POST["user"]);
$clave = trim($_POST["pass"]);
$encontrados = 0;

while($fila=$resultado->fetch_array(MYSQLI_ASSOC)){
    //print_r($fila); //Monstramos los resultados
    if($fila['usuario'] == $user && $fila['password'] == $clave)
    {   
        //Activamos el sesion storage
        session_start(); 
        //almacenamos informacion del usuario en el sesion storage
        $_SESSION["usuario_sesion"]=$fila; 
        $encontrados = 1;
        break;
    }else{
        $encontrados = 0;
    }
}

if ($encontrados) {
    header('Location: ../vistas/dashboard.php');
} else {
    header('Location: ../index.php'); // Para que vuelva al login si falla
}
