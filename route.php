<?php

require_once "Controller/libreriaController.php";
require_once "Controller/autoresController.php";
require_once "Controller/usuariosController.php";


define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

if (!empty($_GET['action'])) {
    $action = $_GET['action'];
} else {
    $action = 'home'; // acción por defecto si no envían
}

$params = explode('/', $action);

$libreriaController = new libreriaController();
$autoresController = new autoresController();
$userController = new usuariosController();

// determina que camino seguir según la acción
switch ($params[0]) {
    case 'login':
        $userController->login();
        break;
    case 'logout':
        $userController->logout();
        break;
    case 'verify':
        $userController->verifyLogin();
        break;
    case 'home': 
        $libreriaController->showHome();
        break;
    case 'viewLibro':
        $libreriaController->viewLibro($params[1]);
        break;
    case 'viewLibroAutor':
        $libreriaController->viewLibroAutor($params[1]);
        break;
    case 'createLibro':
        $libreriaController->createLibro();
        break;
    case 'deleteLibro':
            $libreriaController->deleteLibro($params[1]);
        break;
    case 'editLibro':
            $libreriaController->editLibro();
        break;
    case 'agregarAutor':
            $autoresController->agregarAutor();
        break;
    case 'deleteAutor':
            $autoresController->deleteAutor($params[1]);
            break;
    case 'editAutor':
            $autoresController->editAutor();
            break;
    case 'registrarUser':
            $userController->registrarUser();
         break;
    case 'showHomePublic':
            $libreriaController->showHomePublic();
         break;
    

        default:

        echo('404 Page not found'); 
        break;
}
