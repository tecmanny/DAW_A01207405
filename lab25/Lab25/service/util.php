<?php

//CONECTAR CON BASE DE DATOS (USAR EN CADA FUNCION)
function connectDB(){
  $mysql = mysqli_connect("localhost","root","","tienda");
  $mysql->set_charset("utf8");
  return $mysql;
}

//DESCONECTAR CON BASE DE DATOS (USAR EN CADA FUNCION)
function disconnectDB($mysql){
  mysqli_close($mysql);
}

function getFoto(){
    $db = connectDB();
    if ($db != NULL) {
    
        $query = 'SELECT nombre,imagen,created_at FROM productos';
        //Pa' debugear
        //var_dump($query); 
        //die('');
        $results = mysqli_query($db,$query);
        disconnectDB($db);
        echo '<table class="table">'; 
        echo  '<thead class="thead-dark">'; 
        echo  '<tr>';
        echo      '<th scope="col">Nombre</th>';
        echo         '<th scope="col">imagen</th>' ;
        echo          '<th scope="col">fecha de creacion</th>' ;
        echo        '</tr>'; 
            '</thead>'; 
        echo '<tbody>'; 
        if(mysqli_num_rows($results) > 0){
            while ($row = mysqli_fetch_assoc($results)) {
                 echo '<tr>';
                 echo '<td>'.$row["nombre"].'</td>';
                 echo '<td>'.$row["imagen"].'</td>';
                 echo '<td>'.$row["created_At"].'</td>';
                 echo '</tr>';
            }
        }
        echo'</tbody>';
    echo '</table>';
    }
}

function getFotoid($id){
    $db = connectDB();
    if ($db != NULL) {
        
        $query = 'SELECT Nombre, imagen, created_at FROM productos WHERE id ="'.$id.'"';
        //Pa' debugear
        //var_dump($query); 
        //die('');
        $results = mysqli_query($db,$query);
        disconnectDB($db);
        echo '<table class="table">'; 
        echo  '<thead class="thead-dark">'; 
        echo  '<tr>';
        echo      '<th scope="col">Nombre</th>';
        echo         '<th scope="col">imagen</th>' ;
        echo          '<th scope="col">Creado a las' ;
        echo        '</tr>'; 
            '</thead>'; 
        echo '<tbody>'; 
        if(mysqli_num_rows($results) > 0){
            while ($row = mysqli_fetch_assoc($results)) {
                 echo '<tr>';
                 echo '<td>'.$row["nombre"].'</td>';
                 echo '<td>'.$row["imagen"].'</td>';
                 echo '<td>'.$row["created_at"].'</td>';
                 echo '</tr>';
            }
        }
        echo'</tbody>';
    echo '</table>';
    }
}