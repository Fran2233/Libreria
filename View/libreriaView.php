<?php

require_once './libs/smarty-3.1.39/libs/Smarty.class.php';

class libreriaView
{

    private $smarty;
    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    public function showLibros($list, $autores, $error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->assign('list', $list);
        $this->smarty->assign('autores', $autores);
        $this->smarty->display('templates/showLibros.tpl');
    }

    public function mostrarAutores($autores, $error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->assign('autores', $autores);
        $this->smarty->display('templates/showAutores.tpl');
    }


    public function mostrarLibroID($libro)
    {
        $this->smarty->assign('libro', $libro);
        $this->smarty->display('templates/detallesLibro.tpl');
    }


    public function libroPorAutor($libroPorAutor, $autor)
    {
        $this->smarty->assign('libroPorAutor', $libroPorAutor);
        $this->smarty->assign('autor', $autor);
        $this->smarty->display('templates/libroPorAutor.tpl');
    }

    // Muestra el form para crear un libro
    public function addLibro($autores)
    {
        $this->smarty->assign('autores', $autores);
        $this->smarty->display('templates/addLibro.tpl');
    }

    // Muestra el form para crear autor
    public function addAutor($error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/addAutor.tpl');
    }

    // Muestro la vista sin loguearse
    public function homePublic($list, $autores)
    {
        $this->smarty->assign('list', $list);
        $this->smarty->assign('autores', $autores);
        $this->smarty->display('templates/showPublicHome.tpl');
    }

    // Muestro el error
    public function showError($error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/error.tpl');
    }

    public function mostrarHome()
    {
        header("Location: " . BASE_URL . "home");
    }


    public function showHomeView($list,$autores,$error = ''){
        $this->smarty->assign('list',$list);
        $this->smarty->assign('error',$error);
        $this->smarty->assign('autores',$autores);
        $this->smarty->display('templates/showHome.tpl');
    }
}
