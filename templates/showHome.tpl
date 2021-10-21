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
                    <option value="{$autor->id_autor}">{$autor->nameAutores}</option>
                {/foreach}
                </select>
                <input type="number" placeholder="Año publicado" name="anio_publicado" id="anio_publicado" required> 
                <input type="text" placeholder="Genero" name="genero" id="genero" required> 
                <input type="submit"  value="Editar" class= "btn btn-info btn-sm">    
            </form>
        
        {/foreach}
        

    </ul>
    <h2 id="addLibro">Agregar libro</h2>
                <form  action="createLibro" method="post"  class="mb-3">
                    <input type="text" placeholder="Título" name="titulo" id="titulo"  required > 
                    <select type="text" name="fk_id_autor" id="fk_id_autor" >
                    {foreach from=$autores item=$autor}
                        <option value="{$autor->id_autor}">{$autor->nameAutores}</option>
                    {/foreach}
                    </select>
                    <input type="number" placeholder="Año publicado" name="anio_publicado" id="anio_publicado"> 
                    <input type="text" placeholder="Género" name="genero" id="genero"> 
                    <input type="submit"  value="Enviar" class="btn btn-success btn-sm">    
                </form>

    {* ERROR *}
    <h2 class="autores">Autores:</h2>
    <h1>{$error}</h1>
        {if $error === 'Este autor tiene libros asignados'}
            <a href="home" class="backInicio">Volver al inicio</a>
        {/if}

        
      
<ul id="listAutores">
    
        
        {* Muestro Autores *}
        {foreach from=$autores item=$autor}
            <a href="viewLibroAutor/{$autor->nameAutores}" class="fw-bolder">
                <li>{$autor->nameAutores}---{$autor->nacionalidad}</li>
            </a>
        {* Agrega boton delete *}
        <button class="btn btn-danger btn-sm">
                <a href="deleteAutor/{$autor->id_autor}">Borrar</a>
        </button>
        {* Editar Autor *}
        <form  action="editAutor" method="post"  class="mb-3 inputAutores">
            <input type="text" value="{$autor->id_autor}" name="id_autor" id="id_autor"  class="hidden" >
            <input type="text" placeholder="Nombre" name="nameAutores" id="nameAutores"  required >
            <input type="submit"  value="Editar" class="btn btn-info btn-sm">
        </form>
    
        {/foreach}

</ul>
<h2 class="autores">Agregar autor</h2>
    <form  action="agregarAutor" method="post"  class="mb-3">
        <input type="text" placeholder="Nombre" name="nameAutores" id="nameAutores"  required >
        <input type="text" placeholder="Nacionalidad" name="nacionalidad" id="nacionalidad"  required >
        <input type="submit"  value="Enviar" class="btn btn-success btn-sm">
     </form>

     <h2>{$error}</h2>
</div>

{include file='templates/footer.tpl'}