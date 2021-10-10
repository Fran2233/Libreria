<?php
require_once "./Model/autoresModel.php";
require_once "./View/libreriaView.php";
require_once "./Helpers/AuthHelper.php";
require_once "./Model/librosModel.php";



class autoresController{
    private $modelLibros;
    private $modelAutores;
    private $view;
    private $authHelper;
    public function __construct()
    {
        $this->modelLibros = new libreriaModel();
        $this->modelAutores = new autoresModel();
        $this->view = new libreriaView();
        $this->authHelper = new AuthHelper();
    }

    public function showAutores(){
       $autores = $this->modelAutores->listaAutores();
       $this->view->mostrarAutores($autores);
       $this->view->addAutor();
    }


    //Agregar Autor
public function agregarAutor(){
    $this->authHelper->checkloggedIn();
    $nameAutor = $_POST['nameAutores'];
    $existe =$this->checkName($nameAutor);
    if($existe){
        $this->view->showError("Ya existe ingrese otro nombre");
    }else{
        $this->modelAutores->crearAutor($_POST['nameAutores'],$_POST['nacionalidad']);
        $this->view->mostrarHome();
    }
    
}



// Borrar autor
public function deleteAutor($autor){
    $this->authHelper->checkloggedIn();
    $existe = $this->checkLibroAutor($autor);
    if($existe){
        $this->view->showError("Este autor tiene libros asignados");
        
    }
    else{
        $this->modelAutores->borrarAutor($autor);
        $this->view->mostrarHome();
    }
    
}


//Editar Autor
public function editAutor(){
    $this->authHelper->checkloggedIn();
    $nameAutor = $_POST['nameAutores'];
    $existe =$this->checkName($nameAutor);
    if($existe){
        $this->view->showError("Ese nombre ya esta en uso!");
    }else{
        $this->modelAutores->editarAutor($_POST['id_autor'],$_POST['nameAutores']);
        $this->view->mostrarHome();
    }
    
}

// Chequear que el name no este repetido
public function checkName($nameAutor){
    $autoresList = $this->modelAutores->listaAutores();
    foreach($autoresList as $autores){
        if($autores->nameAutores === $nameAutor){
            return true;
        }
    }
}


// Chequear que el autor a borrar no tenga libros asociados
public function checkLibroAutor($autor){
    $listLibros = $this->modelLibros->listaCompleta();
    foreach($listLibros as $lista){
        if($lista->autor === $autor){
            return true;
        }
    }
}



}