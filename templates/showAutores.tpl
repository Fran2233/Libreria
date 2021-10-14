{include file='templates/header.tpl'}
  
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





{include file='templates/footer.tpl'}