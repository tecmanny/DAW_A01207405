<?php

    session_start();
    if(isset($_SESSION["usuario"])){
        header("location: login.php");
    } 
    else{
        include ("_header.html");
        include ("_login_form.html");
        include ("_footer.html");
    }
?>