<?php
    session_start();
    
    if(isset($_SESSION["usuario"]) ) {
        if(isset($_POST["producto"]) != NULL ) {
            unset($_SESSION["error_archivo"]);
            $target_dir = "images/";
            $target_file = $target_dir . basename($_FILES["imagen"]["name"]);
            $uploadOk = 1;
            $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
            // Check if image file is a actual image or fake image
            
                $check = getimagesize($_FILES["imagen"]["tmp_name"]);
                if($check !== false) {
                    echo "File is an image - " . $check["mime"] . ".";
                    $uploadOk = 1;
                } else {
                    $_SESSION["error_archivo"] = "El archivo no es una imagen";
                    $uploadOk = 0;
                }
            
            // Check if file already exists
            if (file_exists($target_file)) {
                 $_SESSION["error_archivo"] =  "El archivo ya existe";
                $uploadOk = 0;
            }
            // Check file size
            if ($_FILES["imagen"]["size"] > 500000) {
                $_SESSION["error_archivo"] =  "El archivo es demasiado grande.";
                $uploadOk = 0;
            }
            // Allow certain file formats
            if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
            && $imageFileType != "gif" ) {
                $_SESSION["error_archivo"] = "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
                $uploadOk = 0;
            }
            // Check if $uploadOk is set to 0 by an error
            if ($uploadOk == 0) {
                //echo "Sorry, your file was not uploaded.";
            // if everything is ok, try to upload file
            } else {
                if (move_uploaded_file($_FILES["imagen"]["tmp_name"], $target_file)) {
                    echo "The file ". basename( $_FILES["imagen"]["name"]). " has been uploaded.";
                     $_SESSION["ruta_archivo"] = $target_file;
                } else {
                    $_SESSION["error_archivo"] =  "Sorry, there was an error uploading your file.";
                }
            }
            
            if(isset($_SESSION["error_archivo"])) {
                $_SESSION["error_archivo"] = "Si se esta procesando el archivo";
                header("location:add.php");
            }
            $_SESSION["archivo"] = $target_file;
            $_SESSION["producto"] = $_POST["producto"];
            header("location:login.php");
        } else {
            $_SESSION["error_archivo"] = "No se esta procesando el archivo";
            header("location:add.php");
        }
    } else {
        header("location:index.php");
    }
?>