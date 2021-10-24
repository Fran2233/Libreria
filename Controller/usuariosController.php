<?php
require_once "./Model/usuariosModel.php";
require_once "./View/loginView.php";
require_once "./View/homeView.php";
require_once "./Helpers/AuthHelper.php";
class usuariosController
{
    private $view;
    private $model;
    private $viewHome;
    private $authHelper;
    public function __construct()
    {
        $this->viewLibreria = new libreriaView();
        $this->model = new usuariosModel();
        $this->view = new loginView();
        $this->viewHome = new homeView();
    }


    // Muestra el login
    public function login()
    {
        $this->view->showLogin();
    }




    // Verigica que el password ingresado coincida con el guardado en la base de datos de usuarios
    public function verifyLogin()
    {
        if (!empty($_POST['email']) && !empty($_POST['user_password'])) {
            $email = $_POST['email'];
            $password = $_POST['user_password'];
        }

        $user = $this->model->getUser($email);

        if ($user && password_verify($password, $user->user_password)) {

            session_start();
            $_SESSION["email"] = $email;

            $this->view->showHome();
        } else {
            $this->view->showLogin("Email o Password incorrectos");
        }
    }

    //   Desconectar sesion
    public function logout()
    {
        session_start();
        session_destroy();
        $this->view->showLogin("Te desconectaste");
    }


    // Registro user
    public function registrarUser()
    {
        $password = password_hash($_POST['user_password'], PASSWORD_BCRYPT);
        $existe = $this->checkUser($_POST['email']);
        if ($existe) {
            $this->viewHome->showError("Ese nombre ya esta en uso!");
        } else {
            $this->model->registration($_POST['email'], $password);
            $this->verifyLogin();
        }
    }


    // Chequear que el usuario no se encuentre registrado
    public function checkUser($user)
    {
        $lista = $this->model->listaCompleta();
        foreach ($lista as $list) {
            if ($list->email === $user) {
                return true;
            }
        }
    }
}
