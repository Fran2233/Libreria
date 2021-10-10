{include file='templates/header.tpl'} 
 
 <h2>Lista completa de libros escritor por: {$autor}</h2>
             <ul class="list-group libroPorAutor">
                
                    {foreach from=$libroPorAutor item=$libroAutor}
                        <li class="list-group-item">
                           <a href="viewLibro/{$libroAutor->id_libro}">{$libroAutor->titulo}</a> 
                        </li>
                    {/foreach}
                
            </ul>
            <a href="" class="backInicio">Volver al inicio</a>

{include file='templates/footer.tpl'}