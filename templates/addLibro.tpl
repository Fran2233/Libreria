{include file='templates/header.tpl'}

    <h2 id="addLibro">Agregar libro</h2>
                <form  action="createLibro" method="post"  class="mb-3">
                    <input type="text" placeholder="Título" name="titulo" id="titulo"  required > 
                    <select type="text" name="fk_id_autor" id="fk_id_autor" >
                    {foreach from=$autores item=$autor}
                        <option value="{$autor->id_autor}">{$autor->id_autor}</option>
                    {/foreach}
                    </select>
                    <input type="number" placeholder="Año publicado" name="anio_publicado" id="anio_publicado"> 
                    <input type="text" placeholder="Género" name="genero" id="genero"> 
                    <input type="submit"  value="Enviar" class="btn btn-success btn-sm">    
                </form>

{include file='templates/footer.tpl'}