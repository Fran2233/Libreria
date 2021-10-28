{literal}
    <h1>{{titulo}}</h1>
        <ul id="listaComentarios">
            <li v-for="comentarios in arrComentarios">
               Comentario : {{comentarios.comentario}} // 
               Puntaje : {{comentarios.puntaje}}
            </li>
        </ul>

            <form action="" id="formApi">
            <label for="comentario" >Comentario:</label>
            <textarea name="comentario" id="comentario" ></textarea>
            <label for="puntaje">Puntaje :</label>
            <input type="number" maxlength="5"  name="puntaje" id="puntaje" class="btn btn-success btn-sm">
            <input type="number"  value="6" name="fk_id_libro" class="btn btn-success btn-sm hidden">
            <button id="btn-carga">Cargar</button>
            </form>

{/literal}