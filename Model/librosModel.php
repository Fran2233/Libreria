<?php

class libreriaModel
{

    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=libreria;charset=utf8', 'root', '');
    }


    //Traigo la lista completa de libros
    function listaCompleta()
    {
        $obtener = $this->db->prepare("SELECT * FROM libros");
        $obtener->execute();
        $lista = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $lista;
    }


    //Obtener libro especifico mediante ID
    function getLibro($id)
    {
        $obtener = $this->db->prepare("SELECT * FROM libros WHERE id_libro=?");
        $obtener->execute(array($id));
        $libro = $obtener->fetch(PDO::FETCH_OBJ);
        return $libro;
    }


    //Libros por autor
    function getLibrosPorAutor($autor)
    {
        $obtener = $this->db->prepare("SELECT a.* FROM libros a INNER JOIN autores b ON a.autor = b.nameAutores
    WHERE b.nameAutores =?");
        $obtener->execute(array($autor));
        $libroAutor = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $libroAutor;
    }

    //Crear Libro
    function crearLibro($titulo, $autor, $anio_publicado, $genero)
    {
        $obtener = $this->db->prepare("INSERT INTO libros(titulo,autor,anio_publicado,genero) VALUES(?, ?, ?, ?)");
        $obtener->execute(array($titulo, $autor, $anio_publicado, $genero));
    }


    //Borrar LIBRO
    function borrarLibro($id)
    {
        $obtener = $this->db->prepare("DELETE FROM libros WHERE id_libro=?");
        $obtener->execute(array($id));
    }



    //Editar Libro
    function editarLibro($id, $titulo, $autor, $anio_publicado, $genero)
    {
        $obtener = $this->db->prepare("UPDATE libros SET titulo='$titulo',autor='$autor',anio_publicado='$anio_publicado',genero='$genero' WHERE id_libro=?");
        $obtener->execute(array($id));
        $obtener->execute(array($titulo));
        $obtener->execute(array($autor));
        $obtener->execute(array($anio_publicado));
        $obtener->execute(array($genero));
    }
}
