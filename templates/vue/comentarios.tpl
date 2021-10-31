{literal}
    <h1>{{titulo}}</h1>
        <ul id="listaComentarios">
            <li v-for="comentarios in arrComentarios">
               Comentario : {{comentarios.comentario}} // 
               Puntaje : {{comentarios.puntaje}}
            </li>
        </ul>
{/literal}