<?php

class libreriaModel
{

    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=libreria;charset=utf8', 'root', '');
    }


    //Traigo la lista completa de libros
    public function listaCompleta()
    {
        $obtener = $this->db->prepare("SELECT * FROM libros");
        $obtener->execute();
        $lista = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $lista;
    }


    //Obtener libro especifico mediante ID
    public function getLibro($id)
    {
        $obtener = $this->db->prepare("SELECT a.*,b.* FROM libros a INNER JOIN autores b ON a.fk_id_autor = b.id_autor
        WHERE a.id_libro =?");
        $obtener->execute(array($id));
        $libro = $obtener->fetch(PDO::FETCH_OBJ);
        return $libro;
    }


    //Libros por autor
    public function getLibrosPorAutor($autor)
    {
        $obtener = $this->db->prepare("SELECT a.*,b.* FROM libros a INNER JOIN autores b ON a.fk_id_autor = b.id_autor
    WHERE b.nameAutores =?");
        $obtener->execute(array($autor));
        $libroAutor = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $libroAutor;
    }

    //Crear Libro
    public function crearLibro($titulo, $anio_publicado, $genero, $fk_id_autor)
    {
        $obtener = $this->db->prepare("INSERT INTO libros(titulo,anio_publicado,genero,fk_id_autor) VALUES(?,?,?,?)");
        $obtener->execute(array($titulo, $anio_publicado, $genero, $fk_id_autor));
    }


    //Borrar LIBRO
    public function borrarLibro($id)
    {
        $obtener = $this->db->prepare("DELETE FROM libros WHERE id_libro=?");
        $obtener->execute(array($id));
    }



    //Editar Libro
    public function editarLibro($id, $titulo, $anio_publicado, $genero, $fk_id_autor)
    {
        $obtener = $this->db->prepare("UPDATE libros SET titulo=?,anio_publicado=?,genero=?,fk_id_autor=? WHERE id_libro=?");
        $obtener->execute(array($titulo, $anio_publicado, $genero, $fk_id_autor, $id));
    }

}
