{literal}
    <h1>{{titulo}}</h1>
        <ul id="listaComentarios">
            <li v-for="comentarios in arrComentarios">
               Comentario echo por *{{comentarios.email}}* : {{comentarios.comentario}} // 
               Puntaje : {{comentarios.puntaje}}
               <button   v-on:click="btnborrar" :data-id_valoracion="comentarios.id_valoracion">Borrar</button>
            </li>       
        </ul>
{/literal}