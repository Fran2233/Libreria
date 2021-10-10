<?php
require_once "./Model/usuariosModel.php";
require_once "./View/loginView.php";

class usuariosController{
    private $view;
    private $model;
    function __construct()
    {
        $this->model = new usuariosModel();
        $this->view = new loginView();
    }

function login(){
    $this->view->showLogin();
}



// Verigica que el password ingresado coincida con el guardado en la base de datos de usuarios
function verifyLogin(){
      if(!empty($_POST['email'])&& !empty($_POST['user_password'])){
          $email = $_POST['email'];
          $password = $_POST['user_password'];
      }  

      $user = $this->model->getUser($email);

      if($user && password_verify($password,$user->user_password)){

        session_start();
        $_SESSION["email"] = $email;
        
        $this->view->showHome();

      }else{
            $this->view->showLogin("Email o Password incorrectos");
        }

      }

    //   Desconectar sesion
      function logout(){
          session_start();
          session_destroy();
          $this->view->showLogin("Te desconectaste");
      }


      // Registro user
function registrarUser(){
    $password = password_hash($_POST['user_password'],PASSWORD_BCRYPT);
    $this->model->registration($_POST['email'],$password);
    $this->view->showLogin("¡Registrado con exito!");
}




      
}

