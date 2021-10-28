"use strict"
let form = document.querySelector("#formApi");
let btn = document.querySelector("#btn-carga").addEventListener("click", postComentario);
const apiUrl = "http://localhost/Web2/TPE2/api/libreriaApi/";




let app = new Vue({
    el: "#app",
    data: {
        titulo: "Lista de  Comentarios",
        arrComentarios: [],
    },
});



// Obtengo comentarios 
async function getComentarios() {
    try {
        let response = await fetch(apiUrl);
        let comentarios = await response.json();

        app.arrComentarios = comentarios;
    } catch (e) {
        console.log(e);
    }
}
// Agrego comentario 
async function postComentario() {
    let formData = new FormData(form);
    let comentario = formData.get('comentario');
    let puntaje = formData.get('puntaje');
    let valoracion = {
        "puntaje": puntaje,
        "comentario": comentario,
        "fk_id_libro": 6,
    }
    try {
        let res = await fetch(apiUrl,{
            "method":"POST",
            "headers": {"Content-type":"application/json"},
            "body": JSON.stringify(valoracion)
        });
        if(res.status === 200){
            alert("cargado!");
            getComentarios();
        }

        
    } catch (e) {
        console.log(e);
    }
}

getComentarios();