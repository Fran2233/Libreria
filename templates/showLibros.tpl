{include file='templates/header.tpl'}

 <div class="home">
    <h1>Biblioteca</h1>
    <h2>Lista de libros: </h2>
    <h1>{$error}</h1>
    <a href="logout" class="btn btn-outline-secondary bt-sm">Logout</a>
   
    <ul id="listaLibros">


        {* RECORRO LISTA DE LIBROS *}
        {foreach from=$list item=$lista}
            <a href="viewLibro/{$lista->id_libro}" class="fw-bolder">
                {* Muestra nombre libros *}
                <li>{$lista->titulo}</li>
            </a>
            {* Agrega boton delete *}
            <button class="btn btn-danger btn-sm">
                <a href="deleteLibro/{$lista->id_libro}">Borrar</a>
            </button>
           
        {* Editar libro *}
        
            <form action="editLibro" method="post">
                <input type="number"  name="id_libro" id="id_libro"  value="{$lista->id_libro}" class="hidden">
                <input type="text" placeholder="Título" name="titulo" id="titulo"  required > 
                <select type="text" name="fk_id_autor" id="fk_id_autor" >
                {foreach from=$autores item=$autor }
                    <option value="{$autor->id_autor}">{$autor->id_autor}</option>
                {/foreach}
                </select>
                <input type="number" placeholder="Año publicado" name="anio_publicado" id="anio_publicado" required> 
                <input type="text" placeholder="Genero" name="genero" id="genero" required> 
                <input type="submit"  value="Editar" class= "btn btn-info btn-sm">    
            </form>
        
        {/foreach}

    </ul>
           

    
{include file='templates/footer.tpl'}