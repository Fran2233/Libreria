<?php

require_once 'libs/Router.php';
require_once 'Controller/ApiValoracionController.php';

// crea el router
$router = new Router();

// define la tabla de ruteo

// Lista de todos los comentariosValoracion
$router->addRoute('libreriaApi', 'GET', 'ApiValoracionController', 'obtenerComentarios');

// Comentarios por Libro
$router->addRoute('libreriaApi/:ID', 'GET', 'ApiValoracionController', 'comentariosPorLibro');

// Borrar comentario
$router->addRoute('libreriaApi/:ID', 'DELETE', 'ApiValoracionController', 'borrarComentario');

// Add Comentario
$router->addRoute('libreriaApi', 'POST','ApiValoracionController', 'addComentario');

// Editar comentario
$router->addRoute('libreriaApi/:ID', 'PUT','ApiValoracionController', 'editLibro');

// rutea
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
