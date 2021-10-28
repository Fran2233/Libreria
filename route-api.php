<?php

require_once 'libs/Router.php';
require_once 'Controller/ApiLibreriaController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo

// Lista de todos los comentarios
$router->addRoute('libreriaApi', 'GET', 'ApiLibreriaController', 'obtenerComentarios');

// Libro por ID
$router->addRoute('libreriaApi/:ID', 'GET', 'ApiLibreriaController', 'obtenerLibro');

// Borrar Libro
$router->addRoute('libreriaApi/:ID', 'DELETE', 'ApiLibreriaController', 'borrarLibro');

// Add libro
$router->addRoute('libreriaApi', 'POST','ApiLibreriaController', 'addComentario');

// Editar libro
$router->addRoute('libreriaApi/:ID', 'PUT','ApiLibreriaController', 'editLibro');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
