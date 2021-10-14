{include file='templates/header.tpl'}

<h1>{$libro->titulo}</h1>
<h2>Autor:{$libro->fk_id_autor}</h2>
<h3>Año de publicación:{$libro->anio_publicado}</h3>
<h3>Género:{$libro->genero}</h3>

<a href="" class="backInicio">Volver al inicio</a>

{include file='templates/footer.tpl'}