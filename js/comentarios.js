"use strict"

const apiUrl ="http://localhost/Web2/TPE2/api/libreriaApi/";


let app = new Vue({
    el: "#app",
    data:{
        titulo:"listaa Comentarios",
        arrComentarios:[],
    },
});




async function getComentarios(){
    try{
        let response = await fetch(apiUrl);
        let comentarios = await response.json();

        app.arrComentarios = comentarios;
    } catch(e){
        console.log(e);
    }
}

getComentarios();