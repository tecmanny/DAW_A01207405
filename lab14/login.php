<?php
    session_start();
    
    if(isset($_SESSION["usuario"])){
        include("_header.html");
        $user = $_SESSION["usuario"];
        include("_logged_view.html");
        include("_cuestionario.html");
        include("_footer.html");
    }
    else if($_POST["usuario"] == "A01207405" && $_POST["password"]=="nomelase"){
        unset($_SESSION["error"]);
        $_SESSION["usuario"] = $_POST["usuario"];
        $user = $_SESSION["usuario"];
         include("_header.html");
        include("_logged_view.html");
        include("_cuestionario.html");
        include("_footer.html");
    }
    else if($_POST["usuario"] != "A01207405" || $_POST["password"] != "nomelase"){
        $_SESSION["error"] = "El nombre de usuario y/o la contraseña son incorrectos";
        header("location: index.php");
    }

?>