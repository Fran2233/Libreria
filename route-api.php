<?php

require_once 'libs/Router.php';
require_once 'Controller/ApiLibreriaController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo

// Lista de todos los comentarios
$router->addRoute('libreriaApi', 'GET', 'ApiLibreriaController', 'obtenerComentarios');

// Comentarios por Libro
$router->addRoute('libreriaApi/:ID', 'GET', 'ApiLibreriaController', 'comentariosPorLibro');

// Borrar comentario
$router->addRoute('libreriaApi/:ID', 'DELETE', 'ApiLibreriaController', 'borrarComentario');

// Add Comentario
$router->addRoute('libreriaApi', 'POST','ApiLibreriaController', 'addComentario');

// Editar comentario
$router->addRoute('libreriaApi/:ID', 'PUT','ApiLibreriaController', 'editLibro');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
