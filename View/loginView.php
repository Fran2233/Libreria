<?php

require_once './libs/smarty-3.1.39/libs/Smarty.class.php';

class loginView
{

    private $smarty;

    public function __construct()
    {
        $this->smarty = new Smarty();
    }

    // Muestra el login
    public function showLogin($default = "")
    {
        $this->smarty->assign('default', $default);
        $this->smarty->display('templates/login.tpl');
    }

    public function showLoginLocation()
    {
        header("Location: " . BASE_URL . "login");
    }
}
