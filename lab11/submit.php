<?php

function _e($string) {
  return htmlspecialchars($string, ENT_QUOTES, 'UTF-8');
  //echo htmlentities($string, ENT_QUOTES, 'UTF-8');
}


if(isset($_POST["first_name"]) && isset($_POST["last_name"]) && isset($_POST["password"]) && isset($_POST["email"])){



    if(empty($_POST["first_name"])||empty($_POST["last_name"])||empty($_POST["password"])||empty($_POST["email"])){
      $msg ="Fill all the inputs please";
      include("_header.html");
      include("_error.html");
      include("_footer.html");


    }else{
      $fn=_e($_POST["first_name"]);
      $ln=_e($_POST["last_name"]);
      $em=_e($_POST["email"]);
      $ps=_e($_POST["password"]);
      
      session_start();
      $_SESSION["name"] = $fn;
      $_SESSION["last_name"] = $ln;
      $_SESSION["email"] = $em;

      include("_header.html");
      include("_register.html");
      include("_footer.html");
    }


}else{
 header("Location:index.php");
}


?>
