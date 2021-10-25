<?php
require_once './libs/smarty-3.1.39/libs/Smarty.class.php';
class homeView
{

    private $smarty;
    public function __construct()
    {
        $this->smarty = new Smarty();
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


    public function showHome($list, $autores, $error = '', $usuarios='')
    {
        $this->smarty->assign('list', $list);
        $this->smarty->assign('error', $error);
        $this->smarty->assign('autores', $autores);
        $this->smarty->assign('usuarios', $usuarios);
        $this->smarty->display('templates/showHome.tpl');
    }
}
