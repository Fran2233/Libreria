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
                <li>
                {$lista->titulo}
                <button class="btn btn-danger btn-sm">
                    <a href="deleteLibro/{$lista->id_libro}">
                        Borrar
                    </a>
                </button>
                </li>
            </a>
            {* Agrega boton delete *}
            
           
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
                <li>
                    {$autor->nameAutores}---{$autor->nacionalidad}
                    <button class="btn btn-danger btn-sm">
                        <a href="deleteAutor/{$autor->id_autor}">
                            Borrar
                        </a>
                    </button>
                </li>
            </a>
        {* Agrega boton delete *}
        
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

     <h2 class="users">{$error}</h2>

        {* Si sos admin muestro la lista de users *}
            {if $smarty.session.administrador == 'userAdmin'}
            <h1>Lista de usuarios</h1>
                <ul>
                    {foreach from=$usuarios item=$users}
                         <li>
                         {* Con el if miro en que cuenta estoy iniciado y deshabilito los botones de borrar,agregar y quitar admin *}
                         {if $smarty.session.email == {$users->email}}
                             {$users->email}  (Iniciado con esta cuenta)
                             {* Si ya es admin agrego boton de quitar admin *}
                             {else if $users->administrador == 'userAdmin'}
                                 {$users->email}
                            <button class="btn btn-danger btn-sm">
                                <a href="deleteUser/{$users->id_usuario}">
                                    Borrar
                                </a>
                            </button>
                            
                            <form  action="removeAdmin" method="post"  class="mb-3 inputAutores">
                                <input type="text" value="{$users->id_usuario}" name="id_usuario" id="id_usuario"  class="hidden" >
                                <input type="text" value="no-admin" name="administrador" id="administrador"  class="hidden" >
                                <input type="submit"  value="Quitar Admin" class="btn btn-success btn-sm">
                            </form>
                            {else}
                            {* Sino es admin agrego el boton para agregarlo *}
                            {$users->email}
                            <button class="btn btn-danger btn-sm">
                                <a href="deleteUser/{$users->id_usuario}">
                                    Borrar
                                </a>
                            </button>
                                <form  action="addAdmin" method="post"  class="mb-3 inputAutores">
                                <input type="text" value="{$users->id_usuario}" name="id_usuario" id="id_usuario"  class="hidden" >
                                <input type="text" value="userAdmin" name="administrador" id="administrador"  class="hidden" >
                                <input type="submit"  value="Dar Admin" class="btn btn-success btn-sm">
                            </form>
                         {/if}                      
                        </li>
                    {/foreach}
                </ul>
            {/if}
</div>

{include file='templates/footer.tpl'}