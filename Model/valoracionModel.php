<?php




class valoracionModel
{
    private $db;
    public function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;' . 'dbname=libreria;charset=utf8', 'root', '');
    }

    // Mostrar Comentarios y puntuacion
    public function showComentarios()
    {
        $obtener = $this->db->prepare("SELECT * FROM valoracion");
        $obtener->execute();
        $comentarios = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $comentarios;
    }

    // Insertar comentario y puntaje
    public function cargarComentario($puntaje, $comentario, $fk_id_libro)
    {
        $obtener = $this->db->prepare("INSERT INTO valoracion(puntaje,comentario,fk_id_libro) VALUES(?,?,?)");
        $obtener->execute(array($puntaje, $comentario, $fk_id_libro));
    }

    // Muestra los comentarios y puntaje de cada libro
    public function comentariosPorLibro($id_libro)
    {
        $obtener = $this->db->prepare("SELECT * FROM valoracion WHERE fk_id_libro=?");
        $obtener->execute(array($id_libro));
        $comentarios = $obtener->fetchAll(PDO::FETCH_OBJ);
        return $comentarios;
    }

    //Obtener comentario y puntaje especifico mediante ID
    public function getValoracion($id)
    {
        $obtener = $this->db->prepare("SELECT * FROM valoracion WHERE id_valoracion =?");
        $obtener->execute(array($id));
        $valoracion = $obtener->fetch(PDO::FETCH_OBJ);
        return $valoracion;
    }

    // Borrar Valoracion
    public function borrarValoracion($id)
    {
        $res = $this->db->prepare("DELETE FROM valoracion WHERE id_valoracion=?");
        $res->execute(array($id));
    }
}
