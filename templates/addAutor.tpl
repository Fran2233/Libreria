{include file='templates/header.tpl'}

<h2>Agregar autor</h2>
    <form  action="agregarAutor" method="post"  class="mb-3">
        <input type="text" placeholder="Nombre" name="nameAutores" id="nameAutores"  required >
        <input type="text" placeholder="Nacionalidad" name="nacionalidad" id="nacionalidad"  required >
        <input type="submit"  value="Enviar" class="btn btn-success btn-sm">
     </form>

     <h2>{$error}</h2>
</div>
{include file='templates/footer.tpl'}