<?php


class usuariosModel {

    
    private $db;


    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=libreria;charset=utf8', 'root', '');
    }

// Registro usuario
function registration($email,$user_password){
    $obtener = $this->db->prepare("INSERT INTO usuarios(email,user_password) VALUES(?,?)");
    $obtener->execute(array($email,$user_password));
}


// Obtener user
function getUser($email){
    $obtener = $this->db->prepare("SELECT * FROM usuarios WHERE email=? ");
    $obtener->execute(array($email));
    $user = $obtener->fetch(PDO::FETCH_OBJ);
    return $user;
}
}