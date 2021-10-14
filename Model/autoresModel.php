<?php

class autoresModel
{

    private $db;

    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=libreria;charset=utf8', 'root', '');
    }


    //Lista de autores
    public function listaAutores()
    {
        $obtener = $this->db->prepare("SELECT * FROM autores");
        $obtener->execute();
        $listaAutores = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $listaAutores;
    }


    //Crear Autor
    public function crearAutor($nombre, $nacionalidad)
    {
        $obtener = $this->db->prepare("INSERT INTO autores(nameAutores,nacionalidad) VALUES(?,?)");
        $obtener->execute(array($nombre, $nacionalidad));
    }


    //Borrar autor
    public function borrarAutor($autor)
    {
        $obtener = $this->db->prepare("DELETE FROM autores WHERE id_autor=?");
        $obtener->execute(array($autor));
    }


    // Editar autor
    public function editarAutor($id_autor, $autor)
    {
        $obtener = $this->db->prepare("UPDATE autores SET nameAutores='$autor'  WHERE id_autor=?");
        $obtener->execute(array($id_autor));
        $obtener->execute(array($autor));
    }
}
