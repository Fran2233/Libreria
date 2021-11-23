"use strict"
let form = document.querySelector("#formApi");
form.addEventListener("submit", postComentario);
const apiUrl = "http://localhost/Web2/TPE2/api/libreriaApi/";




let app = new Vue({
    el: "#app",
    data: {
        titulo: "Lista de  Comentarios y Puntajes",
        arrComentarios: [],
    },
    methods: {
        btnborrar: function () {
            let id_valoracion = event.target.getAttribute('data-id_valoracion');          
            borrarComentario(id_valoracion); 
        }
    }
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
    let fk_id_libro = formData.get('fk_id_libro');
    let valoracion = {
        "puntaje": puntaje,
        "comentario": comentario,
        "fk_id_libro": fk_id_libro,
    }
    try {
        let res = await fetch(apiUrl, {
            "method": "POST",
            "headers": { "Content-type": "application/json" },
            "body": JSON.stringify(valoracion)
        });
        if (res.status === 200) {
            console.log(valoracion)
        }


    } catch (e) {
        console.log(e);
    }
}

async function comentariosPorLibro() {
    let formData = new FormData(form);
    let id_libro = new Number(formData.get('fk_id_libro'));
    try {
        let response = await fetch(`${apiUrl}/${id_libro}`);
        let comentarios = await response.json();
        app.arrComentarios = comentarios;
    } catch (e) {
        console.log(e);
    }
}


async function borrarComentario(id_valoracion) {
    try {
        let res = await fetch(`${apiUrl}/${id_valoracion}`, {
            "method": "DELETE"
        });
        if (res.status === 200) {
            console.log("se borro")
            comentariosPorLibro();
        }

    } catch (e) {
        console.log(e);
    }
}


comentariosPorLibro();
