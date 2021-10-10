{include file='templates/header.tpl'}
<div class="form-content"> 
    <h1 class="login"> ¡Bienvenidos! </h1>
        <h2 class="login">Registrarse</h2>
            <form class= "form-signin" action="registrarUser" method="post">
                <input type="text"  name="email" id="email-signin" placeholder="Email"  required>
                <input type="password" placeholder="Password" name="user_password" id="signin_password"  required >
                <input class="btn btn-primary" type="submit"  value="Sign in">
            </form>
            
        <h2 class="login">Iniciar sesión</h2>
              <form class="form-login" action="verify" method="post">
                <input type="text"  name="email" id="email-login" placeholder="Email"  required>
                <input type="password" placeholder="Password" name="user_password" id="login_password"  required > 
                <input class="btn btn-primary" type="submit"  value="Login">
            </form>
</div>
            {* Si manda un error se muestra aca, por default esta vacio *}
        <h4>{$default}</h4>

        <h3 class="login">Continuar como invitado</h3>
        <a href="showHomePublic" class="backInicio">Continuar</a>



{include file='templates/footer.tpl'}