<?php
require_once "./Model/librosModel.php";
require_once "./Model/autoresModel.php";
require_once "./View/libreriaView.php";
require_once "./Helpers/AuthHelper.php";



class libreriaController{
    private $autoresModel;
    private $modelLibros;
    private $view;
    private $authHelper;
    public function __construct()
    {
        $this->autoresModel = new autoresModel();
        $this->modelLibros = new libreriaModel();
        $this->view = new libreriaView();
        $this->authHelper = new AuthHelper();
        $this->loginView = new loginView();
    }

    
    public function showLibros(){
        $this->authHelper->checkloggedIn();
        $list = $this->modelLibros->listaCompleta();
        $autores = $this->autoresModel->listaAutores();
        $this->view->showLibros($list,$autores);
        $this->view->addLibro($autores);
        
    }


//Descripción de un libro especifico
public function viewLibro($id){
    // $this->authHelper->checkloggedIn();
    $libro = $this->modelLibros->getLibro($id);
    $this->view->mostrarLibroID($libro);
}

// Lista de libros por Autor
public function viewLibroAutor($autor){
    // $this->authHelper->checkloggedIn();
    $nombreAutor = $autor;
    $libroPorAutor = $this->modelLibros->getLibrosPorAutor($autor);
    $this->view->libroPorAutor($libroPorAutor,$nombreAutor);
}   


//Crear el LIBRO
public function createLibro(){
    $this->authHelper->checkloggedIn();
    $existe = $this->checkLibro($_POST['titulo'],$_POST['autor']);
    if($existe){
        $this->view->showError("El libro ya existe!");
    }
    else{
        $this->modelLibros->crearLibro($_POST['titulo'], $_POST['autor'], $_POST['anio_publicado'], $_POST['genero']);
        $this->view->mostrarHome();
    }
    
}

//Borrar un libro
public function deleteLibro($id){
    $this->authHelper->checkloggedIn();
    $this->modelLibros->borrarLibro($id);
    $this->view->mostrarHome();
}



//EDITAR LIBRO
public function editLibro(){
    $this->authHelper->checkloggedIn();
    $this->modelLibros->editarLibro($_POST['id_libro'],$_POST['titulo'], $_POST['autor'], $_POST['anio_publicado'], $_POST['genero']);
    $this->view->mostrarHome();
}



// Muesta la vista sin loguearse
public function showHomePublic(){
    $list = $this->modelLibros->listaCompleta();
    $autores = $this->autoresModel->listaAutores();
    $this->view->homePublic($list,$autores);
}

// Chequear que el libro no exista
public function checkLibro($titulo,$autor){
    $lista = $this->modelLibros->listaCompleta();
    foreach($lista as $list){
        if(($list->titulo === $titulo)&&($list->autor === $autor)){
            return true;
        }
    }
}
















    

}