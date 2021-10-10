{include file='templates/header.tpl'}
<div class="form-content"> 
    <h1> ¡Bienvenidos! </h1>
        <h2>Registrarse</h2>
            <form class= "form-signin" action="registrarUser" method="post">
                <input type="text"  name="email" id="email-signin" placeholder="Email"  required>
                <input type="password" placeholder="Password" name="user_password" id="signin_password"  required >
                <input class="btn btn-secondary" type="submit"  value="Sign in">
            </form>
            
        <h2>Iniciar sesión</h2>
              <form class="form-login" action="verify" method="post">
                <input type="text"  name="email" id="email-login" placeholder="Email"  required>
                <input type="password" placeholder="Password" name="user_password" id="login_password"  required > 
                <input class="btn btn-secondary" type="submit"  value="Login">
            </form>
</div>
            {* Si manda un error se muestra aca, por default esta vacio *}
        <h4>{$default}</h4>

        <h3>Continuar como invitado</h3>
        <a href="showHomePublic" class="backInicio">Continuar</a>



{include file='templates/footer.tpl'}