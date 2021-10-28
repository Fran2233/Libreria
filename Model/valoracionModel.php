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

    // Cargar comentario y puntaje
    public function cargarComentario($puntaje, $comentario, $fk_id_libro)
    {
        $obtener = $this->db->prepare("INSERT INTO valoracion(puntaje,comentario,fk_id_libro) VALUES(?,?,?)");
        $obtener->execute(array($puntaje, $comentario, $fk_id_libro));
    }
}
