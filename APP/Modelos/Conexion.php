<?php
class Conexion {
    private $servidor;
    private $user;
    private $clave;
    private $database;
    private $conexion;

    public function __construct() {
        $this->servidor = "localhost";
        $this->user = "root";
        $this->clave = "";
        $this->database = "sistema_login";
    }

    public function conectar() {
        $this->conexion = new mysqli($this->servidor, $this->user, $this->clave, $this->database);
        if ($this->conexion->connect_error) {
            die("Error de conexión: " . $this->conexion->connect_error);
        }
        return $this->conexion;
    }

    public function cerrarConexion() {
        if ($this->conexion) {
            $this->conexion->close();
        }
    }

    public function getEjecutionQuery($sql) {
        return $this->conexion->query($sql);
    }

    public function setEjecutionQuery($sql) {
        return $this->conexion->query($sql);
    }

    public function getServidor() {
        return $this->servidor;
    }

    public function getUser() {
        return $this->user;
    }

    public function getClave() {
        return $this->clave;
    }

    public function getDatabase() {
        return $this->database;
    }

    public function setServidor($servidor) {
        $this->servidor = $servidor;
    }

    public function setUser($user) {
        $this->user = $user;
    }

    public function setClave($clave) {
        $this->clave = $clave;
    }

    public function setDatabase($database) {
        $this->database = $database;
    }
}
?>
