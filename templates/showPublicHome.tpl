{include file='templates/header.tpl'}
<h1>Biblioteca(vista pública)</h1>
<a href="login" class="backInicio">Iniciar sesión</a>

    <h2 class="h2Public">Lista de libros disponibles</h2>
<ul>
    {foreach from=$list item=$lista}
        <li>
            <a href="viewLibro/{$lista->id_libro}" class="fw-bolder">
                {* Muestra nombre libros *}
                <li>{$lista->titulo}</li>
            </a>
        </li>
    {/foreach}
</ul>
<h2 class="h2Public">Lista de autores</h2>
<ul>
    {foreach from=$autores item=$autor}
        <li>
           <a href="viewLibroAutor/{$autor->nameAutores}" class="fw-bolder">
                <li>{$autor->nameAutores}---{$autor->nacionalidad}</li>
            </a>
        </li>
    {/foreach}
</ul>




{include file='templates/footer.tpl'}