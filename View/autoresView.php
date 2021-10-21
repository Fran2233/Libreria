<?php
require_once './libs/smarty-3.1.39/libs/Smarty.class.php';
class autoresView
{

    private $smarty;
    public function __construct()
    {
        $this->smarty = new Smarty();
    }


    // Muestra la lista de autores
    public function mostrarAutores($autores, $error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->assign('autores', $autores);
        $this->smarty->display('templates/showAutores.tpl');
    }

    // Muestra el form para crear autor
    public function addAutor($error = "")
    {
        $this->smarty->assign('error', $error);
        $this->smarty->display('templates/addAutor.tpl');
    }
}
