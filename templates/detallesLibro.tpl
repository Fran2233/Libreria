{include file='templates/header.tpl'}

<h1>{$libro->titulo}</h1>
<h2>Autor:{$libro->nameAutores}</h2>
<h3>Año de publicación:{$libro->anio_publicado}</h3>
<h3>Género:{$libro->genero}</h3>

<a href="viewLibroAutor/{$libro->nameAutores}" class="back"><img src="./images/back.png" alt="" id="back"></a>
<a href="" class="backInicio">Volver al inicio</a>

{include file='templates/footer.tpl'}