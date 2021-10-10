<?php

class libreriaModel{
    
    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=libreria;charset=utf8', 'root', '');
    }


    //Traigo la lista completa de libros
    public function listaCompleta(){
        $obtener = $this->db->prepare("SELECT * FROM libros");
        $obtener->execute();
        $lista = $obtener->fetchAll(PDO::FETCH_OBJ);
    return $lista;
}




//Obtener libro especifico mediante ID
public function getLibro($id){
    $obtener = $this->db->prepare("SELECT * FROM libros WHERE id_libro=?");
    $obtener->execute(array($id));
    $libro = $obtener->fetch(PDO::FETCH_OBJ);
    return $libro;
}


//Libros por autor
public function getLibrosPorAutor($autor){
    $obtener = $this->db->prepare("SELECT a.*, b.* FROM libros a INNER JOIN autores b ON a.autor = b.nameAutores
    WHERE b.nameAutores =?");
    $obtener->execute(array($autor));
    $libroAutor = $obtener->fetchAll(PDO::FETCH_OBJ);
    return $libroAutor;
}

//Crear Libro
public function crearLibro($titulo,$autor,$anio_publicado,$genero){
    $obtener = $this->db->prepare("INSERT INTO libros(titulo,autor,anio_publicado,genero) VALUES(?, ?, ?, ?)");
    $obtener->execute(array($titulo,$autor,$anio_publicado,$genero));
}


//Borrar LIBRO
public function borrarLibro($id){
    $obtener = $this->db->prepare("DELETE FROM libros WHERE id_libro=?");
    $obtener->execute(array($id));
}



//Editar Libro
public function editarLibro($id,$titulo,$autor,$anio_publicado,$genero){
    $obtener = $this->db->prepare("UPDATE libros SET titulo='$titulo',autor='$autor',anio_publicado='$anio_publicado',genero='$genero' WHERE id_libro=?");
    $obtener->execute(array($id));
    $obtener->execute(array($titulo));
    $obtener->execute(array($autor));
    $obtener->execute(array($anio_publicado));
    $obtener->execute(array($genero));
}


// Registro usuario
public function registration($email,$user_password){
    $obtener = $this->db->prepare("INSERT INTO usuarios(email,user_password) VALUES(?,?)");
    $obtener->execute(array($email,$user_password));
}

//Obtener usuario
public function getUser($email){
    $obtener = $this->db->prepare("SELECT * FROM usuarios WHERE email=?");
    $obtener->execute(array($email));
    $usuario = $obtener->fetch(PDO::FETCH_OBJ);
    return $usuario;
}

}