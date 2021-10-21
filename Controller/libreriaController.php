<?php
require_once "./Model/librosModel.php";
require_once "./Model/autoresModel.php";
require_once "./View/homeView.php";
require_once "./Helpers/AuthHelper.php";
require_once "./View/libreriaView.php";



class libreriaController
{
    private $autoresModel;
    private $modelLibros;
    private $view;
    private $viewLibreria;
    private $authHelper;
    public function __construct()
    {
        $this->autoresModel = new autoresModel();
        $this->modelLibros = new libreriaModel();
        $this->view = new homeView();
        $this->viewLibreria = new libreriaView();
        $this->authHelper = new AuthHelper();
        $this->loginView = new loginView();
    }

    // Muestra la home
    public function showHome()
    {
        $this->authHelper->checkloggedIn();
        $list = $this->modelLibros->listaCompleta();
        $autores = $this->autoresModel->listaAutores();
        $this->view->showHome($list, $autores);
    }

    //Descripción de un libro especifico
    public function viewLibro($id)
    {
        $libro = $this->modelLibros->getLibro($id);
        $this->viewLibreria->mostrarLibroID($libro);
    }

    // Lista de libros por Autor
    public function viewLibroAutor($autor)
    {
        $nombreAutor = $autor;
        $libroPorAutor = $this->modelLibros->getLibrosPorAutor($autor);
        $this->viewLibreria->libroPorAutor($libroPorAutor, $nombreAutor);
    }


    //Crear el LIBRO
    public function createLibro()
    {
        $this->authHelper->checkloggedIn();
        $existe = $this->checkLibro($_POST['titulo'], $_POST['fk_id_autor']);
        if ($existe) {
            $this->view->showError("El libro ya existe!");
        } else {
            $this->modelLibros->crearLibro($_POST['titulo'], $_POST['anio_publicado'], $_POST['genero'], $_POST['fk_id_autor']);
            $this->view->mostrarHome();
        }
    }

    //Borrar un libro
    public function deleteLibro($id)
    {
        $this->authHelper->checkloggedIn();
        $this->modelLibros->borrarLibro($id);
        $this->view->mostrarHome();
    }



    //EDITAR LIBRO
    public function editLibro()
    {
        $this->authHelper->checkloggedIn();
        $this->modelLibros->editarLibro($_POST['id_libro'], $_POST['titulo'], $_POST['anio_publicado'], $_POST['genero'], $_POST['fk_id_autor']);
        $this->view->mostrarHome();
    }



    // Muesta la vista sin loguearse
    public function showHomePublic()
    {
        $list = $this->modelLibros->listaCompleta();
        $autores = $this->autoresModel->listaAutores();
        $this->view->homePublic($list, $autores);
    }

    // Chequear que el libro no exista
    public function checkLibro($titulo, $autor)
    {
        $lista = $this->modelLibros->listaCompleta();
        foreach ($lista as $list) {
            if (($list->titulo === $titulo) && ($list->fk_id_autor === $autor)) {
                return true;
            }
        }
    }


    
}
