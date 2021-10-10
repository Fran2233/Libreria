<?php

class AuthHelper{
    function __construct()
    {
        
    }

    // Chequeo si no esta logueado
    function checkloggedIn(){
        session_start();
        if(!isset($_SESSION["email"])){
            header("Location: ".BASE_URL."login");
        }
    }

}