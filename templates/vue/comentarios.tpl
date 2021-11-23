{literal}
    <h1>{{titulo}}</h1>
        <ul id="listaComentarios">
            <li v-for="comentarios in arrComentarios">
               Comentario : {{comentarios.comentario}} // 
               Puntaje : {{comentarios.puntaje}}
               <button v-on:click="btnborrar" :data-id_valoracion="comentarios.id_valoracion">Borrar</button>
               {{comentarios.id_valoracion}}
            </li>       
        </ul>
{/literal}