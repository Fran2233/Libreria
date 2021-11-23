{include file='templates/header.tpl'}

    <h1>{$libro->titulo}</h1>
    <h2>Autor:{$libro->nameAutores}</h2>
    <h3>Año de publicación:{$libro->anio_publicado}</h3>
    <h3>Género:{$libro->genero}</h3>
    
    <h3>Crear Comentario</h3>
    <form action="" id="formApi">
        <label for="comentario" >Comentario:</label>
        <textarea name="comentario" id="comentario" ></textarea>
        <label for="puntaje">Puntaje :</label>
        <input type="number"  name="puntaje" id="puntaje" class="btn btn-success btn-sm" min="0" max="5" required>
        <input type="number"  value="{$libro->id_libro}" name="fk_id_libro" class="btn btn-success btn-sm hidden">
        <input type="submit"  class="btn btn-success btn-sm" id="btn-carga">
    </form>

    <div id="app">
        {include file='templates/vue/comentarios.tpl'}
    </div>

    <a href="javascript:history.back()" class="back"><img src="./images/back.png" alt="" id="back"></a>
    <a href="" class="backInicio">Volver al inicio</a>



<script src="js/comentarios.js"></script>
{include file='templates/footer.tpl'}