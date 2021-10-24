<?php

require_once "./Model/librosModel.php";
require_once "./Model/autoresModel.php";
require_once "./View/ApiView.php";

require_once "./Helpers/AuthHelper.php";
class ApiLibreriaController
{
    private $modelLibros;
    private $view;
    private $authHelper;
    public function __construct()
    {
        $this->modelLibros = new libreriaModel();
        $this->view = new ApiView();
        $this->authHelper = new AuthHelper();
    }


    public function obtenerLibros()
    {
        $libros = $this->modelLibros->listaCompleta();
        return $this->view->response($libros, 200);
    }

    public function obtenerLibro($params = null)
    {
        $id_Libro = $params[':ID'];
        $libro = $this->modelLibros->getLibro($id_Libro);
        if ($libro) {
            return $this->view->response($libro, 200);
        } else {
            return $this->view->response("La tarea con el ID =  $id_Libro  no existe ", 404);
        }
    }

    public function borrarLibro($params = null)
    {
        $id_Libro = $params[':ID'];
        $libro = $this->modelLibros->getLibro($id_Libro);
        if ($libro) {
            $this->modelLibros->borrarLibro($id_Libro);
            return $this->view->response("El libro con el ID=$id_Libro fue borrada", 200);
        } else {
            return $this->view->response("El libro con el ID=$id_Libro no existe", 404);
        }
    }

    public function addLibro($params = null)
    {
        // Obtengo el body del request (json)
        $body = $this->getBody();
        // Le mando los parametros con el objeto BODY
        if ($body->titulo && $body->anio_publicado && $body->genero && $body->fk_id_autor) {
            $this->modelLibros->crearLibro($body->titulo, $body->anio_publicado, $body->genero, $body->fk_id_autor);
            $this->view->response("El libro se creo con exito", 200);
        } else {
            $this->view->response("El libro no se pudo crear", 400);
        }
    }

    // Edito el libro
    public function editLibro($params = null)
    {
        $idLibro = $params[':ID'];
        $body = $this->getBody();
        $libro = $this->modelLibros->getLibro($idLibro);
        // Chequeo que el libro y los parametros
        if ($libro && ($body->titulo && $body->anio_publicado && $body->genero && $body->fk_id_autor)) {
            $this->modelLibros->editarLibro($idLibro, $body->titulo, $body->anio_publicado, $body->genero, $body->fk_id_autor);
            return $this->view->response("El libro se edito con exito!", 200);
        } else {
            return $this->view->response("El libro con el ID=$idLibro no existe", 404);
        }
    }



    // Devuelve el body del request
    private function getBody()
    {
        $bodyString = file_get_contents('php://input');
        return json_decode($bodyString);
    }
}
