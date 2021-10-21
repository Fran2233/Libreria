<?php

require_once './libs/smarty-3.1.39/libs/Smarty.class.php';

class libreriaView
{

    private $smarty;
    public function __construct()
    {
        $this->smarty = new Smarty();
    }


    // Muestro lista de libros
    public function showLibros($list, $autores, $error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->assign('list', $list);
        $this->smarty->assign('autores', $autores);
        $this->smarty->display('templates/showLibros.tpl');
    }

//    Muestro libro por ID
    public function mostrarLibroID($libro)
    {
        $this->smarty->assign('libro', $libro);
        $this->smarty->display('templates/detallesLibro.tpl');
    }

    // Muestro libro por autor
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


}
