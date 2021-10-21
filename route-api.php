<?php

require_once 'libs/Router.php';
require_once 'Controller/ApiLibreriaController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo
$router->addRoute('libreriaApi', 'GET', 'ApiLibreriaController', 'obtenerLibros');
$router->addRoute('libreriaApi/:ID', 'GET', 'ApiLibreriaController', 'obtenerLibro');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
