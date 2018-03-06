<?php
    session_start();
    require_once("modelo.php");
    
    if(isset($_SESSION["usuario"])){
        include("_header.html");
        $user = $_SESSION["usuario"];
        include("_logged_view.html");
        include("_cuestionario.html");
        include("_footer.html");
    }
     else if (login($_POST["usuario"], $_POST["password"]) ) {
        unset($_SESSION["error"]);
        $_SESSION["usuario"] = $_POST["usuario"];
        $user = $_SESSION["usuario"];
         include("_header.html");
        include("_logged_view.html");
        include("_cuestionario.html");
        include("_footer.html");
    }

     else{
        $_SESSION["error"] = "Usuario y/o contraseña incorrectos";
        header("location: index.php");
    }

?>
