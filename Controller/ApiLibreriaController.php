<?php

require_once "./Model/librosModel.php";
require_once "./Model/autoresModel.php";
require_once "./View/ApiView.php";

require_once "./Helpers/AuthHelper.php";
class ApiLibreriaController
{
    private $autoresModel;
    private $modelLibros;
    private $view;
    private $authHelper;
    public function __construct()
    {
        $this->autoresModel = new autoresModel();
        $this->modelLibros = new libreriaModel();
        $this->view = new ApiView();
        $this->authHelper = new AuthHelper();
    }


    public function obtenerLibros()
    {
        $libros = $this->modelLibros->listaCompleta();
        return $this->view->response($libros, 200);
    }

    public function obtenerLibro($params = [])
    {
        $id_Libro = $params[':ID'];
        $libro = $this->modelLibros->getLibro($id_Libro);
        return $this->view->response($libro, 200);
    }
}
