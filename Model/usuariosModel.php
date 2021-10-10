<?php


class usuariosModel {

    
    private $db;


    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=libreria;charset=utf8', 'root', '');
    }

// Registro usuario
public function registration($email,$user_password){
    $obtener = $this->db->prepare("INSERT INTO usuarios(email,user_password) VALUES(?,?)");
    $obtener->execute(array($email,$user_password));
}


// Obtener user
public function getUser($email){
    $obtener = $this->db->prepare("SELECT * FROM usuarios WHERE email=? ");
    $obtener->execute(array($email));
    $user = $obtener->fetch(PDO::FETCH_OBJ);
    return $user;
}

// Obtener lista de usuarios 
public function listaCompleta(){
    $obtener = $this->db->prepare("SELECT * FROM usuarios");
    $obtener->execute();
    $lista = $obtener->fetchAll(PDO::FETCH_OBJ);
    return $lista;
}


}